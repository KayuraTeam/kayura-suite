package org.kayura.formbuilder.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormData;
import org.kayura.formbuilder.model.MapContent;
import org.kayura.formbuilder.repository.FormDataMapper;
import org.kayura.formbuilder.service.FormDataService;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.DateUtils;
import org.kayura.utils.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FormDataServiceImpl implements FormDataService {

	@Autowired
	private FormDataMapper formDataMapper;

	@Override
	public Result<PageList<FormData>> selectFormDatas(String tenantId, String formKey, String modelCode, String modelId,
			String creator, String keyword, PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		if (StringUtils.isNotEmpty(formKey)) {
			args.put("formKey", formKey);
		}

		if (StringUtils.isNotEmpty(modelId)) {
			args.put("modelId", modelId);
		}

		if (StringUtils.isNotEmpty(creator)) {
			args.put("creator", creator);
		}

		if (StringUtils.isNotEmpty(keyword)) {
			args.put("keyword", keyword);
		}

		PageList<FormData> data = formDataMapper.selectFormDatas(args, new PageBounds(pageParams));

		return Result.succeed(data);
	}

	@Override
	public Result<FormData> selectFormDataById(String dataId) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(dataId)) {
			args.put("dataId", dataId);
		}

		FormData data = formDataMapper.selectFormData(args);
		return Result.succeed(data);
	}

	@Override
	public GeneralResult insertFormData(FormData formData) {

		if (StringUtils.isEmpty(formData.getDataId())) {
			formData.setDataId(KeyUtils.newId());
		}

		formData.setCreateTime(DateUtils.now());
		formData.setUpdateTime(formData.getCreateTime());

		formDataMapper.insertFormData(formData);
		return Result.succeed();
	}

	@Override
	public GeneralResult updateFormDataInfo(FormData formData) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(formData.getDataId())) {
			args.put("dataId", formData.getDataId());
		}

		if (StringUtils.isNotEmpty(formData.getDataId())) {
			args.put("title", formData.getTitle());
		}

		formDataMapper.updateFormData(args);
		return Result.succeed();
	}

	@Override
	public GeneralResult updateFormDataContent(String dataId, MapContent content) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("dataId", dataId);
		args.put("content", content);

		formDataMapper.updateFormData(args);
		return Result.succeed();
	}

	@Override
	public GeneralResult deleteFormDataById(String dataId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("dataId", dataId);
		formDataMapper.deleteFormData(args);
		return Result.succeed();
	}

}
