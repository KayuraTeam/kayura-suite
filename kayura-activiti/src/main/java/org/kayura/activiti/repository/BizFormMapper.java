package org.kayura.activiti.repository;

import java.util.List;
import java.util.Map;

import org.kayura.activiti.model.BizForm;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface BizFormMapper {

	PageList<BizForm> findBizForms(Map<String, Object> args, PageBounds pageBounds);

	List<BizForm> loadBizForms(Map<String, Object> args);

	BizForm selectBizForm(Map<String, Object> args);

	BizForm getBizFormById(Map<String, Object> args);

	void insertBizForm(BizForm bizForm);

	void updateBizForm(Map<String, Object> args);

	void deleteBizForms(Map<String, Object> args);
}
