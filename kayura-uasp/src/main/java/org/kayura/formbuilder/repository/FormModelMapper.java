package org.kayura.formbuilder.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface FormModelMapper {

	PageList<FormModel> selectFormModels(Map<String, Object> args, PageBounds pageBounds);

	FormModel selectFormModel(Map<String, Object> args);
	
	FormModel selectFormModelInfo(Map<String, Object> args);

	Integer selectFormModelByMaxVersion(@Param(value = "tenantId") String tenantId,
			@Param(value = "formKey") String formKey, @Param(value = "code") String code);

	void insertFormModel(FormModel formModel);

	void updateFormModel(Map<String, Object> args);

	void deleteFormModel(Map<String, Object> args);

}
