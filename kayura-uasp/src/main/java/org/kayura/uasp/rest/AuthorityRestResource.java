package org.kayura.uasp.rest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kayura.security.LoginUser;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.Role;
import org.kayura.uasp.service.AuthorityService;
import org.kayura.web.rest.UaspRestResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthorityRestResource extends UaspRestResource {

	@Autowired
	private AuthorityService authorityService;

	@RequestMapping(value = "roles/find", method = RequestMethod.GET)
	public Map<String, Object> findRoles(HttpServletRequest req, String keyword) {

		LoginUser user = this.getLoginUser();
		PageParams pageParams = ui.getPageParams(req);
		Result<PageList<Role>> r = authorityService.findRoles(user.getTenantId(), keyword, pageParams);
		return result(r.getCode(), r.getMessage(), ui.putData(r.getData()));
	}

}
