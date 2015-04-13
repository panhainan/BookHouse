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

import com.phn.bookhouse.dao.BookDao;
import com.phn.bookhouse.entity.Order;

/**
 * @file UserServiceTest.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public class BookDaoTest {
	private BookDao bookDao;

	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml",
						"classpath:spring-mybatis.xml" });
		bookDao = (BookDao) context.getBean("bookDao");
	}

	@Test
	public void testFindAddressWithUser() {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("order_sum", 3);
		param.put("book_id", 23);
		bookDao.updateBookSaleSum(param);
	}

}
