package org.kayura.formbuilder.controller;

import org.apache.commons.lang.StringUtils;
import org.kayura.activiti.model.BizForm;
import org.kayura.activiti.service.BizFormService;
import org.kayura.formbuilder.converter.FormJsonConverter;
import org.kayura.formbuilder.model.FormData;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.formbuilder.service.FormDataService;
import org.kayura.formbuilder.service.FormModelService;
import org.kayura.formbuilder.vo.FormViewTempletes;
import org.kayura.security.LoginUser;
import org.kayura.type.Result;
import org.kayura.utils.DateUtils;
import org.kayura.utils.KeyUtils;
import org.kayura.web.controllers.UaspController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FormBuilderController extends UaspController {

	@Autowired
	private FormViewTempletes viewTempletes;

	@Autowired
	private FormModelService formModelService;

	@Autowired
	protected FormDataService formDataService;

	@Autowired
	private BizFormService bizFormService;

	@Autowired
	private ObjectMapper objectMapper;

	public String getViewTemplete(String viewKey) {

		if (StringUtils.isEmpty(viewKey)) {
			return viewTempletes.first();
		} else {
			return viewTempletes.get(viewKey);
		}
	}

	@RequestMapping(value = "/bpm/form/list", method = RequestMethod.GET)
	public ModelAndView formBuilderList() {

		ModelAndView mv = view("views/formbuilder/model-list");
		mv.addObject("tenantId", this.getLoginUser().getTenantId());
		return mv;
	}

	@RequestMapping(value = "/formbuilder/mobile", method = RequestMethod.GET)
	public ModelAndView mobileIndex(String modelId) {

		ModelAndView mv = this.view("views/formbuilder/mobile");
		mv.addObject("modelId", modelId);
		return mv;
	}

	@RequestMapping(value = "/formbuilder/{formKey}/create", method = RequestMethod.GET)
	public ModelAndView createFormModel(@PathVariable String formKey) {

		LoginUser user = this.getLoginUser();

		FormModel formModel = new FormModel();
		formModel.setFormKey(formKey);
		formModel.setTenantId(user.getTenantId());
		formModel.setCreator(user.getUserId());

		ModelAndView mv = this.view("views/formbuilder/model-edit");
		mv.addObject("model", formModel);
		return mv;
	}

	@RequestMapping(value = "/formbuilder/{modelId}/edit", method = RequestMethod.GET)
	public ModelAndView editFormModel(@PathVariable String modelId) {

		Result<FormModel> r = formModelService.selectFormModel(modelId, null, null, null, null);
		if (r.isSucceed()) {
			FormModel formModel = r.getData();
			ModelAndView mv = this.view("views/formbuilder/model-edit");
			mv.addObject("model", formModel);
			return mv;
		}
		return null;
	}

	private ModelAndView viewForm(String modelId, String formKey, String code, String view, boolean preview) {

		LoginUser loginUser = this.getLoginUser();

		Result<FormModel> r = formModelService.selectFormModel(modelId, loginUser.getTenantId(), formKey, code, null);
		if (r.isSucceed()) {

			FormModel model = r.getData();
			if (model.getStatus() == FormModel.STATUS_DESIGN) {

				FormJsonConverter jsonConverter = new FormJsonConverter();
				try {
					JsonNode jsonNode = objectMapper.readTree(model.getRaw());
					jsonConverter.convertToModel(model, jsonNode);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			Result<BizForm> bizForm = bizFormService.getBizFormsByCode(loginUser.getTenantId(), model.getFormKey());
			BizForm biz = bizForm.getData();

			FormData formdata = new FormData();
			formdata.setTitle(biz.getDisplayName() + DateUtils.now("yyyy") + loginUser.getDisplayName());
			formdata.setFormName(bizForm.getData().getDisplayName());
			formdata.setProcessKey(bizForm.getData().getProcessKey());
			formdata.setView(view);
			formdata.setDataId(KeyUtils.newId());
			formdata.setModelId(model.getModelId());
			formdata.setCreator(loginUser.getUserId());
			formdata.setCreateTime(DateUtils.now());
			for (FormField field : model.getItems()) {
				formdata.addField(field);
			}

			String viewName = getViewTemplete(view);
			ModelAndView mv = this.view(viewName + "-form");
			mv.addObject("model", formdata);
			mv.addObject("tenantId", loginUser.getTenantId());
			mv.addObject("preview", preview);
			return mv;
		}

		return errorPage(r.getMessage());
	}

	@RequestMapping(value = "/form/preview/{modelId}/{view}", method = RequestMethod.GET)
	public ModelAndView formPreview(@PathVariable String modelId, @PathVariable String view) {
		return viewForm(modelId, null, null, view, true);
	}

	@RequestMapping(value = "/form/preview/{formKey}/{code}/{view}", method = RequestMethod.GET)
	public ModelAndView formPreview(@PathVariable String formKey, @PathVariable String code,
			@PathVariable String view) {
		return viewForm(null, formKey, code, view, true);
	}

	@RequestMapping(value = "/form/start/{modelId}/{view}", method = RequestMethod.GET)
	public ModelAndView startForm(@PathVariable String modelId, @PathVariable String view) {

		return viewForm(modelId, null, null, view, false);
	}

	@RequestMapping(value = "/form/start/{formKey}/{code}/{view}", method = RequestMethod.GET)
	public ModelAndView startForm(@PathVariable String formKey, @PathVariable String code, @PathVariable String view) {

		return viewForm(null, formKey, code, view, false);
	}

	@RequestMapping(value = "/form/approve/{dataId}", method = RequestMethod.GET)
	public ModelAndView approveForm(@PathVariable String dataId) {

		Result<FormData> r = formDataService.selectFormDataById(dataId);
		if (r.isSucceed()) {

			FormData formdata = r.getData();
			Result<FormModel> formModel = formModelService.selectFormModel(formdata.getModelId(), null, null, null,
					null);

			for (FormField field : formModel.getData().getItems()) {
				if (formdata.getContent().containsKey(field.getName())) {
					field.setValue(formdata.getContent().get(field.getName()));
				}
				formdata.addField(field);
			}

			String viewName = getViewTemplete(formdata.getView());
			ModelAndView mv = this.view(viewName + "-approve");
			mv.addObject("model", formdata);
			return mv;
		}

		return errorPage(r.getMessage());
	}

	@RequestMapping(value = "/form/edit", method = RequestMethod.GET)
	public ModelAndView editForm(String id, String view) {

		ModelAndView mv = this.view(getViewTemplete(view));
		return mv;
	}

}
