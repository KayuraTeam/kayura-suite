/**
 * Copyright 2015-2015 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service;

import java.util.List;

import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.DictDefine;
import org.kayura.uasp.po.DictItem;

/**
 * DictService
 *
 * @author liangxia@live.com
 */
public interface DictService {
	
	Result<DictDefine> getDictDefineById(String dictId);
	
	Result<List<DictDefine>> loadDictDefinces();

	Result<PageList<DictItem>> loadDictItems(String tenantId, String dictId, String parentId, PageParams params);

	Result<DictItem> getDictItemsById(String itemId);

	GeneralResult createDictItem(DictItem dictItem);

	GeneralResult updateDictItem(DictItem dictItem);

	GeneralResult deleteDictItem(String itemId);

}
