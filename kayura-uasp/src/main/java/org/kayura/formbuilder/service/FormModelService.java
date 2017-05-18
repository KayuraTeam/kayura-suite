package org.kayura.formbuilder.service;

import org.kayura.formbuilder.model.FormModel;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;

public interface FormModelService {

	Result<PageList<FormModel>> selectFormModels(String tenantId, String formKey, String keyword, Integer status,
			PageParams pageParams);

	Result<FormModel> selectFormModel(String modelId, String tenantId, String formKey, String code, Integer status);

	GeneralResult insertFormModel(FormModel formModel);

	GeneralResult updateFormModelForInfo(FormModel formModel);

	GeneralResult updateFormModelForRawModel(String modelId, String rawModel);

	GeneralResult deployFormModel(String modelId);

	GeneralResult deleteFormModelById(String modelId);

}
