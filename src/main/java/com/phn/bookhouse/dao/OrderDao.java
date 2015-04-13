/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;
import java.util.Map;

import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.Order;

/**
 * @file OrderDao.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public interface OrderDao {

	/**
	 * @author pan
	 * @param order
	 * @return
	 */
	public int insertOrder(Order order);

	/**
	 * @author pan
	 * @param param
	 * @return
	 */
	public List<Order> selectUserOrderListPage(Map<String, Object> param);

	/**
	 * @author pan
	 * @param user_id
	 * @return
	 */
	public List<Order> select5UserOrderListPage(long user_id);

	/**
	 * @author pan
	 * @param orderid
	 * @return
	 */
	public Order selectOrderById(long orderid);

	/**
	 * @author pan
	 * @param order
	 */
	public void updateOrderStatus(Order order);

	/**
	 * @author pan
	 * @param hosu_id
	 * @return
	 */
	public List<Order> select5HouseOrderListPage(long hosu_id);

	/**
	 * @author pan
	 * @param param
	 * @return
	 */
	public List<Order> selectHouseOrderListPage(Map<String, Object> param);


	public List<Order> findOrderByStatusHouseId(Map<String, Object> param);

	/**
	 * @author pan
	 * @param hosu_id
	 * @return
	 */
	public List<Order> findOrderByStatus5HouseId(long hosu_id);

	/**
	 * @author pan
	 * @param order
	 */
	public void updateOrderComment(Order order);

	/**
	 * @author pan
	 * @param order
	 */
	public void updateOrderWithAddr(Order order);
	
	public List<Order> selectOrderByBookidStatus(Order order);

}
