/**
 * 
 */
package com.phn.bookhouse.entity;

/**
 * @file Book.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public class Book {
	private long book_id;
	private String book_name;
	private String book_author;
	private String book_isbn;
	private String book_publish_company;
	private String book_publish_datetime;
	private String book_author_introduce;
	private String book_catalogue;
	private String book_picture;
	private String book_parameter;
	private String book_content_introduce;
	private double book_price;
	private long book_hous_id;
	private String book_type;
	private int book_sum;
	private boolean book_status;
	private int book_sale_sum;
	private double book_score;
	private int book_sale_comment_sum;

	public long getBook_id() {
		return book_id;
	}

	public void setBook_id(long book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_publish_company() {
		return book_publish_company;
	}

	public void setBook_publish_company(String book_publish_company) {
		this.book_publish_company = book_publish_company;
	}

	public String getBook_publish_datetime() {
		return book_publish_datetime;
	}

	public void setBook_publish_datetime(String book_publish_datetime) {
		this.book_publish_datetime = book_publish_datetime;
	}

	public String getBook_author_introduce() {
		return book_author_introduce;
	}

	public void setBook_author_introduce(String book_author_introduce) {
		this.book_author_introduce = book_author_introduce;
	}

	public String getBook_catalogue() {
		return book_catalogue;
	}

	public void setBook_catalogue(String book_catalogue) {
		this.book_catalogue = book_catalogue;
	}

	public String getBook_picture() {
		return book_picture;
	}

	public void setBook_picture(String book_picture) {
		this.book_picture = book_picture;
	}

	public String getBook_parameter() {
		return book_parameter;
	}

	public void setBook_parameter(String book_parameter) {
		this.book_parameter = book_parameter;
	}

	public String getBook_content_introduce() {
		return book_content_introduce;
	}

	public void setBook_content_introduce(String book_content_introduce) {
		this.book_content_introduce = book_content_introduce;
	}

	public double getBook_price() {
		return book_price;
	}

	public void setBook_price(double book_price) {
		this.book_price = book_price;
	}

	public long getBook_hous_id() {
		return book_hous_id;
	}

	public void setBook_hous_id(long book_hous_id) {
		this.book_hous_id = book_hous_id;
	}

	public int getBook_sum() {
		return book_sum;
	}

	public void setBook_sum(int book_sum) {
		this.book_sum = book_sum;
	}

	public boolean isBook_status() {
		return book_status;
	}

	public void setBook_status(boolean book_status) {
		this.book_status = book_status;
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public int getBook_sale_sum() {
		return book_sale_sum;
	}

	public void setBook_sale_sum(int book_sale_sum) {
		this.book_sale_sum = book_sale_sum;
	}

	public double getBook_score() {
		return book_score;
	}

	public void setBook_score(double book_score) {
		this.book_score = book_score;
	}

	public int getBook_sale_comment_sum() {
		return book_sale_comment_sum;
	}

	public void setBook_sale_comment_sum(int book_sale_comment_sum) {
		this.book_sale_comment_sum = book_sale_comment_sum;
	}

	@Override
	public String toString() {
		return "Book [book_id=" + book_id + ",book_name=" + book_name
				+ ", book_hous_id=" + book_hous_id + "]";
	}
}
