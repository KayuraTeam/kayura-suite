package org.kayura.formbuilder.service;

import org.kayura.formbuilder.model.FormData;
import org.kayura.formbuilder.model.MapContent;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;

public interface FormDataService {

	Result<PageList<FormData>> selectFormDatas(String tenantId, String formKey, String modelCode, String modelId,
			String creator, String keyword, PageParams pageParams);

	Result<FormData> selectFormDataById(String dataId);

	GeneralResult insertFormData(FormData formData);

	GeneralResult updateFormDataInfo(FormData formData);

	GeneralResult updateFormDataContent(String dataId, MapContent content);

	GeneralResult deleteFormDataById(String dataId);

}
