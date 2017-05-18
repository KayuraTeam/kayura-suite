/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.security.LoginUser;
import org.kayura.uasp.Urls;
import org.kayura.uasp.po.Identity;
import org.kayura.utils.StringUtils;
import org.kayura.web.controllers.UaspController;
import org.kayura.web.util.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author liangxia@live.com
 */
@Controller
public class HomeController extends UaspController {

	@Value("#{sysProperties['runMode']}")
	private String runMode;

	@Autowired
	private SessionRegistry sessionRegistry;

	@RequestMapping(value = Urls.HOME, method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, Map<String, Object> model) throws Exception {

		LoginUser user = this.getLoginUser();

		model.put("numUsers", sessionRegistry.getAllPrincipals().size());
		model.put("loginName", user.getDisplayName());

		if (user.getIdentities().size() > 0) {
			Identity identity = (Identity) user.getAliveIdentity();
			model.put("identityId", identity.getIdentityId());
			model.put("identityName", identity.getDisplayName());
			model.put("identities", user.getIdentities());
		} else {
			model.put("identityName", "无");
		}

		return view("views/home/index", model);
	}

	@RequestMapping(value = Urls.SETID, method = RequestMethod.POST)
	public void switchIdentity(Map<String, Object> map, @RequestParam("i") String identityId) {

		LoginUser user = this.getLoginUser();

		this.postExecute(map, new PostAction() {
			@Override
			public void invoke(PostResult ps) {

				if (user.getIdentities().containsKey(identityId)) {
					user.setIdentityId(identityId);
				} else {
					ps.setError("切换的身份ID不存在。");
				}
			}
		});
	}

	@RequestMapping(value = Urls.VERIFY_CODE, method = RequestMethod.GET)
	public void authImage(HttpServletRequest req, HttpServletResponse res) throws IOException {

		res.setHeader("Pragma", "No-cache");
		res.setHeader("Cache-Control", "no-cache");
		res.setDateHeader("Expires", 0);
		res.setContentType("image/jpeg");

		// 生成随机字串.
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);

		// 存入会话session.
		HttpSession session = req.getSession(true);
		session.setAttribute("j_captcha", verifyCode.toLowerCase());

		// 生成图片.
		int w = 200, h = 80;
		VerifyCodeUtils.outputImage(w, h, res.getOutputStream(), verifyCode);
	}

	@RequestMapping(value = Urls.LOGIN, method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "t", required = false) String type,
			@RequestParam(value = "pin", required = false) String tenantId, HttpServletRequest req) {

		ModelAndView mv = this.view("views/home/login");

		HttpSession session = req.getSession(true);
		if (req.getParameterMap().containsKey("pin")) {
			if (StringUtils.isEmpty(tenantId)) {
				session.removeAttribute("tenantId");
			} else {
				session.setAttribute("tenantId", tenantId);
			}
		} else {
			tenantId = (String) session.getAttribute("tenantId");
		}

		if (!StringUtils.isEmpty(type)) {

			if (type.equals("failure")) {
				mv.addObject("message", "用户名或密码错误，请重新输入。");
			} else if (type.equals("captcha")) {
				mv.addObject("message", "输入的验证码错误。");
			} else if (type.equals("logout")) {
				mv.addObject("message", "已经成功退出系统。");
			} else if (type.equals("expired")) {
				mv.addObject("message", "您当前的登录已经失效。");
			} else if (type.equals("session")) {
				mv.addObject("message", "因您长时间未使用，需重新登录。");
			}

			session.setAttribute("needvc", true);
		}

		mv.addObject("tid", tenantId);
		mv.addObject("runMode", runMode);

		return mv;
	}

	@ModelAttribute("activeUsers")
	public Map<Object, Date> listActiveUsers(Model model) {

		Map<Object, Date> lastActivityDates = new HashMap<Object, Date>();

		for (Object principal : sessionRegistry.getAllPrincipals()) {
			for (SessionInformation session : sessionRegistry.getAllSessions(principal, false)) {

				if (lastActivityDates.get(principal) == null) {
					lastActivityDates.put(principal, session.getLastRequest());
				} else {
					Date prevLastRequest = lastActivityDates.get(principal);

					if (session.getLastRequest().after(prevLastRequest)) {
						lastActivityDates.put(principal, session.getLastRequest());
					}
				}
			}
		}

		return lastActivityDates;
	}

	@RequestMapping(value = Urls.PORTAL, method = RequestMethod.GET)
	public String portal() {

		return "views/home/portal";
	}

}
