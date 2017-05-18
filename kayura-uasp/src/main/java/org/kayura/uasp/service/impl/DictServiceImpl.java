/**
 * Copyright 2015-2015 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.dao.DictMapper;
import org.kayura.uasp.po.DictDefine;
import org.kayura.uasp.po.DictItem;
import org.kayura.uasp.service.DictService;
import org.kayura.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * DictServiceImpl
 *
 * @author liangxia@live.com
 */
@Service
public class DictServiceImpl implements DictService {

	@Autowired
	private DictMapper dictMapper;

	@Override
	public Result<DictDefine> getDictDefineById(String dictId) {

		DictDefine list = dictMapper.getDictDefineById(dictId);
		return new Result<DictDefine>(Result.SUCCEED, list);
	}

	@Override
	public Result<List<DictDefine>> loadDictDefinces() {

		List<DictDefine> list = dictMapper.loadDictDefinces();
		return new Result<List<DictDefine>>(Result.SUCCEED, list);
	}

	@Override
	public Result<PageList<DictItem>> loadDictItems(String tenantId, String dictId, String parentId,
			PageParams params) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("dictId", dictId);
		
		if (!StringUtils.isEmpty(parentId)) {
			args.put("parentId", parentId);
		}
		
		if (!StringUtils.isEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		PageList<DictItem> list = dictMapper.findDictItems(args, new PageBounds(params));
		return new Result<PageList<DictItem>>(Result.SUCCEED, list);
	}

	@Override
	public Result<DictItem> getDictItemsById(String itemId) {

		DictItem dictItem = dictMapper.getDictItemsById(itemId);
		return new Result<DictItem>(Result.SUCCEED, dictItem);
	}

	@Override
	public GeneralResult createDictItem(DictItem dictItem) {

		if (StringUtils.isEmpty(dictItem.getParentId())) {
			dictItem.setParentId(null);
		}
		dictMapper.insertDictItem(dictItem);
		return Result.succeed();
	}

	@Override
	public GeneralResult updateDictItem(DictItem dictItem) {

		dictMapper.updateDictItem(dictItem);
		return Result.succeed();
	}

	@Override
	public GeneralResult deleteDictItem(String itemId) {

		dictMapper.deleteDictItem(itemId);
		return Result.succeed();
	}

}
