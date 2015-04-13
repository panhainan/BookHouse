/**
 * 
 */
package com.test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.phn.bookhouse.dao.OrderDao;
import com.phn.bookhouse.entity.Order;

/**
 * @file UserServiceTest.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public class OrderDaoTest {
	private OrderDao orderDao;

	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml",
						"classpath:spring-mybatis.xml" });
		orderDao = (OrderDao) context.getBean("orderDao");
	}

	@Test
	public void testFindAddressWithUser() {
		long id = 1;
		int status = 2;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("orde_status", status);
		param.put("hosu_id", id);
		List<Order> order = orderDao.findOrderByStatusHouseId(param);
		System.out.println("**************" + order);
		//System.out.println(order.getBook().getBook_name());
	}

}
