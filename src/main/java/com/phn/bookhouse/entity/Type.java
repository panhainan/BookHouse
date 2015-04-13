/**
 * 
 */
package com.phn.bookhouse.entity;


/**
 * @file Type.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public class Type {
	private int type_id;

	private String type_name;

	private int type_father_id;

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public int getType_father_id() {
		return type_father_id;
	}

	public void setType_father_id(int type_father_id) {
		this.type_father_id = type_father_id;
	}
	@Override
	public String toString() {
		return "Type [type_id=" + type_id + ",type_name=" + type_name
				+ ", type_father_id=" + type_father_id + "]";
	}

}
