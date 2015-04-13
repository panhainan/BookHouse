/**
 * 
 */
package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.phn.bookhouse.dao.AddressDao;
import com.phn.bookhouse.dao.UserDao;
import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.User;

/**
 * @file UserServiceTest.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public class AddressDaoTest {
	private AddressDao addressDao;

	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml",
						"classpath:spring-mybatis.xml" });
		addressDao = (AddressDao) context.getBean("addressDao");
	}

	@Test
	public void testFindAddressWithUser() {
		long id = 1;
		Address address = addressDao.selectAddressById(id);
		System.out.println("**************" + address);
	}

}
