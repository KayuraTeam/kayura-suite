package org.kayura.activiti.vo;

import java.util.HashMap;
import java.util.Map;

public class OrgTypes {

	private static final Map<String, String> ORG_TYPES = new HashMap<String, String>();

	static {
		ORG_TYPES.put("R", "角色");
		ORG_TYPES.put("G", "群组");
		ORG_TYPES.put("D", "部门");
		ORG_TYPES.put("P", "岗位");
		ORG_TYPES.put("U", "员工");
		ORG_TYPES.put("T", "表达式");
	}

	public static String getTypeName(String type) {

		if (ORG_TYPES.containsKey(type)) {
			return ORG_TYPES.get(type);
		} else {
			return "未知";
		}
	}
}
