package org.kayura.uasp.security;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kayura.security.LoginUser;
import org.kayura.utils.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.util.Assert;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.GenericFilterBean;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.FrameworkServlet;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

public class PrivilegeAuthenticationFilter extends GenericFilterBean {

	private AuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();

	protected HandlerExecutionChain getHandlerExecution(HttpServletRequest request) throws Exception {

		WebApplicationContext appContext = WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getServletContext());
		HandlerMapping bean = appContext.getBean(RequestMappingHandlerMapping.class);
		HandlerExecutionChain handler = bean.getHandler(request);

		if (handler == null) {
			ServletContext servletContext = request.getServletContext();
			Enumeration<?> attrNameEnum = servletContext.getAttributeNames();
			while (attrNameEnum.hasMoreElements()) {
				String attrName = (String) attrNameEnum.nextElement();
				if (attrName.startsWith(FrameworkServlet.SERVLET_CONTEXT_PREFIX)) {
					appContext = (WebApplicationContext) servletContext.getAttribute(attrName);
					bean = appContext.getBean(RequestMappingHandlerMapping.class);
					handler = bean.getHandler(request);
					if (handler != null) {
						break;
					}
				}
			}
		}

		return handler;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		Object o = null;
		try {
			HandlerExecutionChain handler = getHandlerExecution(request);
			if (handler != null) {
				o = handler.getHandler();
			} else {
				o = null;
			}
			if (logger.isDebugEnabled()) {
				logger.debug("Request Url: " + request.getRequestURL());
			}

		} catch (Exception e) {
			logger.error("Authentication request error: " + e.toString());
		}

		if (o != null) {
			if (o instanceof HandlerMethod) {

				Method method = ((HandlerMethod) o).getMethod();
				Object bean = ((HandlerMethod) o).getBean();

				Privilege pv = method.getAnnotation(Privilege.class);
				if (pv == null) {
					pv = bean.getClass().getAnnotation(Privilege.class);
				}

				if (pv != null) {
					String[] privileges = pv.value();
					if (privileges.length > 0) {

						LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication()
								.getPrincipal();
						if (!user.hasPrivilege(privileges)) {
							try {
								String exmsg = "缺少相应的权限，权限代码：" + StringUtils.join(",", privileges);

								if (isAjax(request)) {
									throw new AjaxNonePrivilegeException(exmsg);
								} else {
									throw new NonePrivilegeException(exmsg);
								}
							} catch (AuthenticationException e) {
								unsuccessfulAuthentication(request, response, e);
								return;
							}
						}

						if (logger.isDebugEnabled()) {
							logger.debug(
									"用户  " + user.getUsername() + " 通过了权限验证。权限代码：" + StringUtils.join(",", privileges));
						}
					}
				}
			}
		}

		chain.doFilter(request, response);
	}

	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {

		if (logger.isDebugEnabled()) {
			logger.debug("Authentication request failed: " + failed.toString());
			logger.debug("Delegating to authentication failure handler " + failureHandler);
		}

		failureHandler.onAuthenticationFailure(request, response, failed);
	}

	public static boolean isAjax(ServletRequest req) {
		HttpServletRequest request = (HttpServletRequest) req;
		String header = request.getHeader("X-Requested-With");
		return (header != null && "XMLHttpRequest".equals(header));
	}

	public void setAuthenticationFailureHandler(AuthenticationFailureHandler failureHandler) {
		Assert.notNull(failureHandler, "failureHandler cannot be null");
		this.failureHandler = failureHandler;
	}
}
