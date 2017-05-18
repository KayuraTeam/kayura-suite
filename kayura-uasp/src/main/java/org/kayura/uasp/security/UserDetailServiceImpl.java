/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.security;

import org.kayura.security.LoginUser;
import org.kayura.uasp.po.User;
import org.kayura.uasp.service.UserService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailServiceImpl implements UserDetailsService {

	private static final Log logger = LogFactory.getLog(UserDetailServiceImpl.class);

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {

		LoginUser loginUser = null;

		try {
			User user = userService.getUserByUserName(username);

			loginUser = new LoginUser(user.getUserName(), user.getPassword(), user.getIsEnabled(), true, true, true,
					getAuthorities(user.getRoles()));

			loginUser.setSalt(user.getSalt());
			loginUser.setUserId(user.getUserId());
			loginUser.setTenantId(user.getTenantId());
			loginUser.setDisplayName(user.getDisplayName());

		} catch (Exception e) {
			logger.error("Error in retrieving user", e);
		}

		return loginUser;
	}

	public Collection<GrantedAuthority> getAuthorities(String roles) {

		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);

		logger.debug("Grant ROLE_USER to this user");
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));

		if (roles.contains("ADMIN")) {
			logger.debug("Grant ROLE_ADMIN to this user");
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}

		if (roles.contains("ROOT")) {
			logger.debug("Grant ROLE_ROOT to this user");
			authList.add(new SimpleGrantedAuthority("ROLE_ROOT"));
		}

		return authList;
	}

}