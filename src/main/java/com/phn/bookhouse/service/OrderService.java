/**
 * 
 */
package com.phn.bookhouse.service;

import java.util.List;

import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.Order;

/**
 * @file OrderService.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public interface OrderService {
	public int addOrder(Order order);

	/**
	 * @author pan
	 * @param orderid
	 * @return
	 */
	public Order findOrderById(long orderid);

	/**
	 * @author pan
	 * @param order
	 */
	public void assertOrder(Order order);

	public void commentOrder(Order order,double book_score, long book_id, int book_sale_sum, int book_sale_comment_sum);

	/**
	 * @author pan
	 * @param user_id
	 * @return
	 */
	public List<Address> findOrderUserAddress(long user_id);

	/**
	 * @author pan
	 * @param order
	 */
	public void assertOrderWithAddr(Order order);

	/**
	 * @author pan
	 * @param order
	 */
	public void assertOrderAndBook(Order order);
}
