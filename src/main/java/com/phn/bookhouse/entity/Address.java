/**
 * 
 */
package com.phn.bookhouse.entity;

/**
 * @file Address.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public class Address {
	private long addr_id;

	private String addr_user_name;

	private String addr_name;

	private String addr_phone;

	// private long addr_user_id;
	private User user;

	public long getAddr_id() {
		return addr_id;
	}

	public void setAddr_id(long addr_id) {
		this.addr_id = addr_id;
	}

	public String getAddr_user_name() {
		return addr_user_name;
	}

	public void setAddr_user_name(String addr_user_name) {
		this.addr_user_name = addr_user_name;
	}

	public String getAddr_name() {
		return addr_name;
	}

	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}

	public String getAddr_phone() {
		return addr_phone;
	}

	public void setAddr_phone(String addr_phone) {
		this.addr_phone = addr_phone;
	}

	// public long getAddr_user_id() {
	// return addr_user_id;
	// }
	//
	// public void setAddr_user_id(long addr_user_id) {
	// this.addr_user_id = addr_user_id;
	// }

	@Override
	public String toString() {
		return "Address [addr_id=" + addr_id + ", user=" + user
				+ ", addr_name=" + addr_name + ", addr_user_name="
				+ addr_user_name + ",addr_phone="+addr_phone+"]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
