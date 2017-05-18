package org.kayura.activiti.vo;

import org.activiti.engine.identity.User;

public class UserVo implements User {

	private static final long serialVersionUID = 1L;

	protected String id;
	protected String firstName;
	protected String lastName;
	protected String email;
	protected String password;

	public UserVo() {
	}

	public UserVo(User user) {

		this.id = user.getId();
		this.firstName = user.getFirstName();
		this.lastName = user.getLastName();
		this.email = user.getEmail();
		this.password = user.getPassword();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFullName() {
		return this.lastName + "(" + this.firstName + ")";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean isPictureSet() {
		return false;
	}

}
