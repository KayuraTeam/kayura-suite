/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.query;

import java.util.HashMap;

/**
 * CompanyQuery
 *
 * @author liangxia@live.com
 */
public class CompanyQuery extends HashMap<String, Object> {

	private static final long serialVersionUID = 1L;

	public CompanyQuery id(String companyId) {
		this.put("companyId", companyId);
		return this;
	}

	public CompanyQuery parentId(String parentId) {
		this.put("parentId", parentId);
		return this;
	}

	public CompanyQuery tenantId(String tenantId) {
		this.put("tenantId", tenantId);
		return this;
	}

	public CompanyQuery containName(String name) {
		this.put("containName", name);
		return this;
	}

	public CompanyQuery status(Integer... statue) {

		if (statue != null && statue.length > 0) {
			StringBuilder sb = new StringBuilder();
			for (Integer i : statue) {
				sb.append(",").append(i);
			}
			this.put("statue", sb.substring(1));
		}
		return this;
	}

}
