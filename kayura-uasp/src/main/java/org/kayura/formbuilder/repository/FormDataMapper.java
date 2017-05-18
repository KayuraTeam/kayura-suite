package org.kayura.formbuilder.repository;

import java.util.Map;

import org.kayura.formbuilder.model.FormData;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface FormDataMapper {

	/**
	 * 以分页方式选择多条符件条件的动态表单数据.
	 * 
	 * @param args
	 *            表单KEY(formKey),模型编号(modelCode),
	 *            租户ID(tenantId),
	 *            模型ID(modelId),
	 *            创建人(creator),
	 *            搜索关键字(keyword);
	 * @param pageBounds
	 *            分页参数
	 * @return
	 */
	PageList<FormData> selectFormDatas(Map<String, Object> args, PageBounds pageBounds);

	/**
	 * 选择一条符合条件的表单数据
	 * 
	 * @param args
	 *            表单数据ID(dataId)
	 * @return
	 */
	FormData selectFormData(Map<String, Object> args);

	/**
	 * 保存一条新表单数据
	 * 
	 * @param formData
	 */
	void insertFormData(FormData formData);

	/**
	 * 更新一条指定列的表单数据
	 * 
	 * @param args 可选列(title,content,createTime,creator,updateTime),主键(dataId)
	 */
	void updateFormData(Map<String, Object> args);

	/**
	 * 删除符合条件的表单数据
	 * 
	 * @param args 主键ID(dataId),模型ID(modelId)
	 */
	void deleteFormData(Map<String, Object> args);

}
