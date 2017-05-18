/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.util.Assert;
import org.springframework.web.filter.GenericFilterBean;

/**
 * 图形证验码校验过滤器.
 * 
 * @author liangxia@live.com
 */
public class CaptchaAuthenticationFilter extends GenericFilterBean {

	private String captchaFieldName;
	private AuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();

	public String getCaptchaFieldName() {
		return captchaFieldName;
	}

	public void setCaptchaFieldName(String captchaFieldName) {
		this.captchaFieldName = captchaFieldName;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		HttpSession session = request.getSession();
		Object needvc = session.getAttribute("needvc");
		if (request.getMethod() == "POST" && needvc != null && (Boolean) needvc) {

			String requestCaptcha = request.getParameter(this.getCaptchaFieldName());
			String genCaptcha = (String) session.getAttribute("j_captcha");

			session.removeAttribute("needvc");
			logger.info("开始校验验证码，生成的验证码为：" + genCaptcha + " ，输入的验证码为：" + requestCaptcha);

			if (genCaptcha != null && !genCaptcha.equals(requestCaptcha)) {

				try {
					throw new CaptchaException("AbstractUserDetailsAuthenticationProvider.badCaptcha");
				} catch (AuthenticationException e) {
					unsuccessfulAuthentication(request, response, e);
					return;
				}
			}
		}

		chain.doFilter(request, response);
	}

	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {

		SecurityContextHolder.clearContext();

		if (logger.isDebugEnabled()) {
			logger.debug("Authentication request failed: " + failed.toString());
			logger.debug("Updated SecurityContextHolder to contain null Authentication");
			logger.debug("Delegating to authentication failure handler " + failureHandler);
		}

		failureHandler.onAuthenticationFailure(request, response, failed);
	}

	public void setAuthenticationFailureHandler(AuthenticationFailureHandler failureHandler) {
		Assert.notNull(failureHandler, "failureHandler cannot be null");
		this.failureHandler = failureHandler;
	}
}