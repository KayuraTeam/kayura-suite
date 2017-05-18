package org.kayura.activiti.service;

import java.util.List;

import org.kayura.activiti.model.BizForm;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;

public interface BizFormService {

	Result<PageList<BizForm>> findBizForms(String tenantId, String keyword, PageParams pageParams);

	Result<List<BizForm>> loadBizForms(String tenantId);
	
	Result<BizForm> getBizFormsByCode(String tenantId, String code);

	Result<BizForm> getBizFormsById(String bizFormId);

	GeneralResult insertBizForm(BizForm bizForm);

	GeneralResult updateBizForm(BizForm bizForm);

	GeneralResult deleteBizForm(String bizFormId);

}
