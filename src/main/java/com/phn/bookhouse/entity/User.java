/**
 * 
 */
package com.phn.bookhouse.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @author phn
 * @date 2014-11-4
 */
public class User {
	private long user_id;
	private String user_login_name;
	private String user_login_password;
	private String user_nick_name;
	private String user_sex;
	private String user_picture;
	private String user_phone;
	private String user_login_email;
	// private long user_addr_id;
	private List<Address> address = new ArrayList<Address>();

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getUser_login_name() {
		return user_login_name;
	}

	public void setUser_login_name(String user_login_name) {
		this.user_login_name = user_login_name;
	}

	public String getUser_login_password() {
		return user_login_password;
	}

	public void setUser_login_password(String user_login_password) {
		this.user_login_password = user_login_password;
	}

	public String getUser_nick_name() {
		return user_nick_name;
	}

	public void setUser_nick_name(String user_nick_name) {
		this.user_nick_name = user_nick_name;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_picture() {
		return user_picture;
	}

	public void setUser_picture(String user_picture) {
		this.user_picture = user_picture;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_login_email() {
		return user_login_email;
	}

	public void setUser_login_email(String user_login_email) {
		this.user_login_email = user_login_email;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_login_name=" + user_login_name + ",  user_nick_name=" + user_nick_name+"]";
	}
}
