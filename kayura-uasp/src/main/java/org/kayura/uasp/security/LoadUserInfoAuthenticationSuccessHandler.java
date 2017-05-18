package org.kayura.uasp.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.security.LoginUser;
import org.kayura.uasp.po.Identity;
import org.kayura.uasp.service.UserService;
import org.kayura.utils.KeyUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

public class LoadUserInfoAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	protected final Log logger = LogFactory.getLog(this.getClass());

	private RequestCache requestCache = new HttpSessionRequestCache();
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);

		LoginUser user = (LoginUser) authentication.getPrincipal();

		// 加载权限
		List<String> privileges = userService.loadPrivileges(user.getUserId());
		user.setPrivileges(privileges);

		// 加载身份
		List<Identity> identityList = userService.loadIdentities(user.getUserId());
		if (identityList != null && identityList.size() == 0) {
			
			Identity anonymousId = new Identity();
			anonymousId.setIdentityId(KeyUtils.newId());
			anonymousId.setDepartmentName("无所属部门");
			
			identityList = new ArrayList<Identity>();
			identityList.add(anonymousId);
		}

		Map<String, Object> identityMap = new HashMap<String, Object>();
		for (Identity i : identityList) {
			identityMap.put(i.getIdentityId(), i);
		}
		user.setIdentities(identityMap);
		user.setIdentityId(identityList.get(0).getIdentityId());

		if (savedRequest == null) {
			super.onAuthenticationSuccess(request, response, authentication);
			return;
		}

		String targetUrlParameter = getTargetUrlParameter();
		if (isAlwaysUseDefaultTargetUrl()
				|| (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
			requestCache.removeRequest(request, response);
			super.onAuthenticationSuccess(request, response, authentication);
			return;
		}

		clearAuthenticationAttributes(request);

		// Use the DefaultSavedRequest URL
		String targetUrl = savedRequest.getRedirectUrl();
		logger.debug("Redirecting to DefaultSavedRequest Url: " + targetUrl);
		getRedirectStrategy().sendRedirect(request, response, targetUrl);
	}
}
