/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.form.FormData;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.StartFormData;
import org.activiti.engine.form.TaskFormData;
import org.kayura.activiti.model.BizForm;
import org.kayura.activiti.service.BizFormService;
import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.security.LoginUser;
import org.kayura.tags.types.FormAttribute;
import org.kayura.type.Result;
import org.kayura.web.controllers.ActivitiController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * BpmController
 *
 * @author liangxia@live.com
 */
@Controller
public class BpmController extends ActivitiController {

	@Autowired
	private BizFormService bizFormService;

	@RequestMapping(value = "/modeler", method = RequestMethod.GET)
	public ModelAndView modeler() {

		ModelAndView mv = view("views/activiti/modeler");
		return mv;
	}

	@RequestMapping(value = "/bpm/biz/list", method = RequestMethod.GET)
	public ModelAndView bizList() {

		ModelAndView mv = view("views/bpm/biz-list");
		mv.addObject("tenantId", this.getLoginUser().getTenantId());
		return mv;
	}

	@RequestMapping(value = "/bpm/biz/new", method = RequestMethod.GET)
	public ModelAndView createBizForm() {

		BizForm entity = new BizForm();
		entity.setTenantId(this.getLoginUser().getTenantId());
		ModelAndView mv = view("views/bpm/biz-edit", entity);
		return mv;
	}

	@RequestMapping(value = "/bpm/biz/edit", method = RequestMethod.GET)
	public ModelAndView editBizForm(String id) {

		ModelAndView mv;
		Result<BizForm> r = bizFormService.getBizFormsById(id);
		if (r.isSucceed()) {
			BizForm entity = r.getData();
			mv = view("views/bpm/biz-edit", entity);
		} else {
			mv = this.errorPage(r);
		}
		return mv;
	}

	@RequestMapping(value = "/bpm/task/center", method = RequestMethod.GET)
	public ModelAndView taskCenter() {

		ModelAndView mv = view("views/bpm/task-center");
		mv.addObject("userId", this.getLoginUser().getIdentityId());
		return mv;
	}

	@RequestMapping(value = "/bpm/task/list", method = RequestMethod.GET)
	public ModelAndView taskList() {

		ModelAndView mv = view("views/bpm/task-list");
		mv.addObject("userId", this.getLoginUser().getIdentityId());
		return mv;
	}

	@RequestMapping(value = "/bpm/task/read", method = RequestMethod.GET)
	public ModelAndView taskRead(String id) {

		TaskFormData formData = formService.getTaskFormData(id);
		List<FormAttribute> props = convertFormData(formData);

		ModelAndView mv = view("views/bpm/task-form");
		mv.addObject("model", formData);
		mv.addObject("props", props);

		return mv;
	}

	@RequestMapping(value = "/bpm/task/handler", method = RequestMethod.POST)
	public void taskHandler(Map<String, Object> map, HttpServletRequest req, String id) {

		LoginUser user = this.getLoginUser();

		postExecute(map, new PostAction() {
			@Override
			public void invoke(PostResult ps) {

				TaskFormData formData = formService.getTaskFormData(id);

				List<FormProperty> formProperties = formData.getFormProperties();
				Map<String, String> formValues = new HashMap<String, String>();
				for (FormProperty formProperty : formProperties) {
					if (formProperty.isWritable()) {
						String value = req.getParameter(formProperty.getId());
						formValues.put(formProperty.getId(), value);
					}
				}

				identityService.setAuthenticatedUserId(user.getIdentityId());
				formService.submitTaskFormData(id, formValues);
			}
		});
	}

	@SuppressWarnings("unchecked")
	private List<FormAttribute> convertFormData(FormData formData) {

		List<FormAttribute> props = new ArrayList<FormAttribute>();
		for (FormProperty formProperty : formData.getFormProperties()) {

			FormAttribute fa = new FormAttribute(formProperty.getId(), formProperty.getName(), formProperty.getValue(),
					formProperty.getType().getName());
			fa.setDatePattern(Objects.toString(formProperty.getType().getInformation("datePattern")));
			fa.setItems((Map<String, String>) formProperty.getType().getInformation("values"));
			fa.setReadable(formProperty.isReadable());
			fa.setWriteable(formProperty.isWritable());
			fa.setRequired(formProperty.isRequired());

			props.add(fa);
		}
		return props;
	}

	@RequestMapping(value = "/bpm/proc/list", method = RequestMethod.GET)
	public ModelAndView processList() {

		ModelAndView mv = view("views/bpm/proc-list");
		mv.addObject("tenantId", this.getLoginUser().getTenantId());
		return mv;
	}

	@RequestMapping(value = "/bpm/proc/new", method = RequestMethod.GET)
	public ModelAndView createModel(String key) {

		ModelAndView mv = view("views/bpm/proc-new");
		mv.addObject("key", key);
		mv.addObject("tenantId", this.getLoginUser().getTenantId());
		return mv;
	}

	@RequestMapping(value = "/bpm/proc/form/start", method = RequestMethod.GET)
	public ModelAndView startForm(String id) {

		StartFormData formData = formService.getStartFormData(id);
		List<FormAttribute> props = convertFormData(formData);

		ModelAndView mv = view("views/bpm/start-form");
		mv.addObject("model", formData);
		mv.addObject("props", props);

		return mv;
	}

	@RequestMapping(value = "/bpm/proc/start", method = RequestMethod.POST)
	public void startProcess(Map<String, Object> map, HttpServletRequest request, String processDefinitionId) {

		LoginUser user = this.getLoginUser();
		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				StartFormData formData = formService.getStartFormData(processDefinitionId);
				List<FormProperty> formProperties = formData.getFormProperties();
				Map<String, String> formValues = new HashMap<String, String>();

				for (FormProperty formProperty : formProperties) {
					if (formProperty.isWritable()) {
						String value = request.getParameter(formProperty.getId());
						formValues.put(formProperty.getId(), value);
					}
				}

				identityService.setAuthenticatedUserId(user.getIdentityId());
				formService.submitStartFormData(processDefinitionId, formValues);
			}
		});
	}

}
