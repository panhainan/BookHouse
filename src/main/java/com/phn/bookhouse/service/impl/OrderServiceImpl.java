/**
 * 
 */
package com.phn.bookhouse.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.AddressDao;
import com.phn.bookhouse.dao.BookDao;
import com.phn.bookhouse.dao.OrderDao;
import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.Order;
import com.phn.bookhouse.service.OrderService;

/**
 * @file OrderServiceImpl.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private AddressDao addressDao;
	@Autowired
	private BookDao bookDao;
	@Override
	public int addOrder(Order order) {
		return orderDao.insertOrder(order);
	}
	@Override
	public Order findOrderById(long orderid) {
		return orderDao.selectOrderById(orderid);
	}
	@Override
	public void assertOrder(Order order) {
		orderDao.updateOrderStatus(order);
	}
	@Override
	public void commentOrder(Order order,double book_score,long book_id,int book_sale_sum,int book_sale_comment_sum) {
		orderDao.updateOrderComment(order);
		Book book = new Book();
		book.setBook_score((book_score*book_sale_comment_sum+order.getOrde_user_score())/(book_sale_comment_sum+1));
		book.setBook_id(book_id);
		book.setBook_sale_comment_sum(book_sale_comment_sum+1);
		bookDao.updateBookScore(book);
	}
	@Override
	public List<Address> findOrderUserAddress(long user_id) {
		return addressDao.selectAddressByUserId(user_id);
	}
	@Override
	public void assertOrderWithAddr(Order order) {
		orderDao.updateOrderWithAddr(order);
	}
	@Override
	public void assertOrderAndBook(Order order) {
		orderDao.updateOrderStatus(order);
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("order_sum", order.getOrde_book_amount());
		param.put("book_id", order.getOrde_book().getBook_id());
		bookDao.updateBookSaleSum(param);
	}

}
