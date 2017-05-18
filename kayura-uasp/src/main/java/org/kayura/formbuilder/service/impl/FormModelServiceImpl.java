package org.kayura.formbuilder.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.converter.FormJsonConverter;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.formbuilder.repository.FormModelMapper;
import org.kayura.formbuilder.service.FormModelService;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class FormModelServiceImpl implements FormModelService {

	@Autowired
	private FormModelMapper formModelMapper;

	@Autowired
	private ObjectMapper objectMapper;

	@Override
	public Result<PageList<FormModel>> selectFormModels(String tenantId, String formKey, String keyword, Integer status,
			PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		if (StringUtils.isNotEmpty(formKey)) {
			args.put("formKey", formKey);
		}

		if (StringUtils.isNotEmpty(keyword)) {
			args.put("keyword", keyword);
		}

		if (status != null) {
			args.put("status", status);
		}

		PageList<FormModel> models = formModelMapper.selectFormModels(args, new PageBounds(pageParams));

		return Result.succeed(models);
	}

	@Override
	public Result<FormModel> selectFormModel(String modelId, String tenantId, String formKey, String code,
			Integer status) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(modelId)) {

			args.put("modelId", modelId);
		} else {

			if (StringUtils.isNotEmpty(tenantId)) {
				args.put("tenantId", tenantId);
			}

			if (StringUtils.isNotEmpty(formKey)) {
				args.put("formKey", formKey);
			}

			if (StringUtils.isNotEmpty(code)) {
				args.put("code", code);
			}
			if (status != null) {
				args.put("status", status);
			}
		}

		FormModel formModel = formModelMapper.selectFormModel(args);

		return Result.succeed(formModel);
	}

	@Override
	public GeneralResult insertFormModel(FormModel formModel) {

		if (StringUtils.isEmpty(formModel.getModelId())) {
			formModel.setModelId(KeyUtils.newId());
		}

		if (StringUtils.isEmpty(formModel.getTenantId())) {
			formModel.setTenantId(null);
		}

		formModel.setRaw("[]");
		formModel.setStatus(FormModel.STATUS_DESIGN);

		formModelMapper.insertFormModel(formModel);

		return Result.succeed();
	}

	@Override
	public GeneralResult updateFormModelForInfo(FormModel formModel) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("code", formModel.getCode());
		args.put("creator", formModel.getCreator());
		args.put("description", formModel.getDescription());
		args.put("icon", formModel.getIcon());
		args.put("title", formModel.getTitle());
		args.put("modelId", formModel.getModelId());

		formModelMapper.updateFormModel(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult updateFormModelForRawModel(String modelId, String rawModel) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("raw", rawModel);
		args.put("modelId", modelId);

		formModelMapper.updateFormModel(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult deployFormModel(String modelId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("modelId", modelId);

		FormModel formModel = formModelMapper.selectFormModel(args);

		Integer maxVersion = formModelMapper.selectFormModelByMaxVersion(formModel.getTenantId(),
				formModel.getFormKey(), formModel.getCode());

		formModel.setModelId(KeyUtils.newId());
		formModel.setStatus(FormModel.STATUS_RUN);
		formModel.setVersion(maxVersion + 1);

		FormJsonConverter jsonConverter = new FormJsonConverter();
		try {
			JsonNode jsonNode = objectMapper.readTree(formModel.getRaw());
			jsonConverter.convertToModel(formModel, jsonNode);
		} catch (Exception e) {
			e.printStackTrace();
		}

		formModel.setRaw("[]");
		formModelMapper.insertFormModel(formModel);

		return Result.succeed();
	}

	@Override
	public GeneralResult deleteFormModelById(String modelId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("modelId", modelId);

		FormModel formModel = formModelMapper.selectFormModelInfo(args);
		if (formModel.getStatus() == FormModel.STATUS_DESIGN) {

			formModelMapper.deleteFormModel(args);
		} else if (formModel.getStatus() == FormModel.STATUS_RUN) {

			args.put("status", FormModel.STATUS_INVALID);
			formModelMapper.updateFormModel(args);
		}

		return Result.succeed();
	}

}
