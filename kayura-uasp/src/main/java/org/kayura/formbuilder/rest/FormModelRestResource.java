package org.kayura.formbuilder.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.formbuilder.service.FormModelService;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.web.ui.UISupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FormModelRestResource {

	protected static final Logger logger = LoggerFactory.getLogger(FormModelRestResource.class);

	@Autowired
	protected UISupport ui;

	@Autowired
	private FormModelService formModelService;

	@RequestMapping(value = "/form/model/find", method = RequestMethod.GET, produces = "application/json")
	public Map<String, Object> findFormModels(HttpServletRequest req, String formKey, String keyword, String tenantId,
			Integer status) {

		try {
			PageParams pp = ui.getPageParams(req);
			Result<PageList<FormModel>> r = formModelService.selectFormModels(tenantId, formKey, keyword, status, pp);
			if (r.isSucceed()) {
				PageList<FormModel> pageList = r.getData();
				Map<String, Object> data = ui.putData(pageList);
				return data;
			}
		} catch (Exception e) {
			logger.error("Error Read FormModel", e);
		}

		return new HashMap<String, Object>();
	}

	@RequestMapping(value = "/form/model/{modelId}/raw", method = RequestMethod.GET)
	@ResponseBody
	public String getRawFormModel(@PathVariable String modelId) {

		Result<FormModel> r = formModelService.selectFormModel(modelId, null, null, null, null);
		if (r.isSucceed()) {
			FormModel formModel = r.getData();
			return formModel.getRaw();
		}

		return "";
	}

	@RequestMapping(value = "/form/model/{modelId}/raw", method = RequestMethod.POST)
	public void updateFormModelForRawModel(@PathVariable String modelId, String rawModel) {

		formModelService.updateFormModelForRawModel(modelId, rawModel);
	}

	@RequestMapping(value = "/form/model/saveinfo", method = RequestMethod.POST)
	public void saveOrUpdateFormModel(FormModel formModel) {

		if (StringUtils.isEmpty(formModel.getModelId())) {

			formModelService.insertFormModel(formModel);
		} else {

			formModelService.updateFormModelForInfo(formModel);
		}
	}

	@RequestMapping(value = "/form/model/{modelId}/deploy", method = RequestMethod.POST)
	public void deployFormModel(@PathVariable String modelId) {

		formModelService.deployFormModel(modelId);
	}

	@RequestMapping(value = "/form/model/{modelId}/remove", method = RequestMethod.DELETE)
	public void deleteFormModel(@PathVariable String modelId) {

		formModelService.deleteFormModelById(modelId);
	}

}
