package org.kayura.activiti.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kayura.activiti.model.BizForm;
import org.kayura.activiti.repository.BizFormMapper;
import org.kayura.activiti.service.BizFormService;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BizFormServiceImpl implements BizFormService {

	@Autowired(required = false)
	protected BizFormMapper bizFormMapper;

	public void setBizFormMapper(BizFormMapper bizFormMapper) {
		this.bizFormMapper = bizFormMapper;
	}

	@Override
	public Result<PageList<BizForm>> findBizForms(String tenantId, String keyword, PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		PageList<BizForm> items = bizFormMapper.findBizForms(args, new PageBounds(pageParams));
		return new Result<PageList<BizForm>>(items);
	}

	public Result<List<BizForm>> loadBizForms(String tenantId) {
		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		List<BizForm> items = bizFormMapper.loadBizForms(args);
		return new Result<List<BizForm>>(items);
	}

	public Result<BizForm> getBizFormsByCode(String tenantId, String code) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("tenantId", tenantId);
		args.put("code", code);

		BizForm item = bizFormMapper.selectBizForm(args);
		return new Result<BizForm>(item);
	}

	@Override
	public Result<BizForm> getBizFormsById(String bizFormId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", bizFormId);

		BizForm item = bizFormMapper.getBizFormById(args);
		return new Result<BizForm>(item);
	}

	@Override
	public GeneralResult insertBizForm(BizForm bizForm) {

		if (StringUtils.isEmpty(bizForm.getId())) {
			bizForm.setId(KeyUtils.newId());
		}

		bizFormMapper.insertBizForm(bizForm);
		return Result.succeed();
	}

	@Override
	public GeneralResult updateBizForm(BizForm bizForm) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("code", bizForm.getCode());
		args.put("displayName", bizForm.getDisplayName());
		args.put("processKey", bizForm.getProcessKey());
		args.put("serial", bizForm.getSerial());
		args.put("iconUrl", bizForm.getIconUrl());
		args.put("description", bizForm.getDescription());
		args.put("type", bizForm.getType());
		args.put("status", bizForm.getStatus());
		args.put("id", bizForm.getId());

		bizFormMapper.updateBizForm(args);
		return Result.succeed();
	}

	@Override
	public GeneralResult deleteBizForm(String bizFormId) {

		Map<String, Object> args = new HashMap<String, Object>();

		String[] idList = bizFormId.split(",");
		for (String id : idList) {
			args.put("id", id);
			bizFormMapper.deleteBizForms(args);
		}

		return Result.succeed();
	}

}
