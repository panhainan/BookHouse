/**
 * 
 */
package com.phn.bookhouse.entity;

import java.util.Date;

/**
 * @file Order.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public class Order {
	private long orde_id;

	private String orde_number;

	// private long orde_book_id;

	private Book orde_book;
	// private long orde_user_id;
	private User orde_user;
	private int orde_book_amount;

	/**
	 * 订单状态：0:未下单；1：已下单未发货；2：已下单已发货未收货；3：已下单已发货已收货未评价；4：已下单已发货已收货已付款已评价
	 * 3和4都表示已完成订单
	 */
	private int orde_status;

	private Date orde_datetime;

	private double orde_price;

	private String orde_user_comment;
	private String orde_addr_name;
	private String orde_addr_user_name;
	private String orde_addr_phone;
	private double orde_user_score;

	public long getOrde_id() {
		return orde_id;
	}

	public void setOrde_id(long orde_id) {
		this.orde_id = orde_id;
	}

	public String getOrde_number() {
		return orde_number;
	}

	public void setOrde_number(String orde_number) {
		this.orde_number = orde_number;
	}

	public Book getOrde_book() {
		return orde_book;
	}

	public void setOrde_book(Book orde_book) {
		this.orde_book = orde_book;
	}

	public User getOrde_user() {
		return orde_user;
	}

	public void setOrde_user(User orde_user) {
		this.orde_user = orde_user;
	}

	public int getOrde_book_amount() {
		return orde_book_amount;
	}

	public void setOrde_book_amount(int orde_book_amount) {
		this.orde_book_amount = orde_book_amount;
	}

	public int getOrde_status() {
		return orde_status;
	}

	public void setOrde_status(int orde_status) {
		this.orde_status = orde_status;
	}

	public Date getOrde_datetime() {
		return orde_datetime;
	}

	public void setOrde_datetime(Date orde_datetime) {
		this.orde_datetime = orde_datetime;
	}

	public double getOrde_price() {
		return orde_price;
	}

	public void setOrde_price(double orde_price) {
		this.orde_price = orde_price;
	}

	public String getOrde_user_comment() {
		return orde_user_comment;
	}

	public void setOrde_user_comment(String orde_user_comment) {
		this.orde_user_comment = orde_user_comment;
	}

	public String getOrde_addr_name() {
		return orde_addr_name;
	}

	public void setOrde_addr_name(String orde_addr_name) {
		this.orde_addr_name = orde_addr_name;
	}

	public String getOrde_addr_user_name() {
		return orde_addr_user_name;
	}

	public void setOrde_addr_user_name(String orde_addr_user_name) {
		this.orde_addr_user_name = orde_addr_user_name;
	}

	public String getOrde_addr_phone() {
		return orde_addr_phone;
	}

	public void setOrde_addr_phone(String orde_addr_phone) {
		this.orde_addr_phone = orde_addr_phone;
	}

	public double getOrde_user_score() {
		return orde_user_score;
	}

	public void setOrde_user_score(double orde_user_score) {
		this.orde_user_score = orde_user_score;
	}

}
