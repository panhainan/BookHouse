/**
 * 
 */
package com.test.service;

import static org.junit.Assert.fail;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.TypeService;

/**
 * @file TypeServiceTest.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public class TypeServiceTest {
	private TypeService typeService;

	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml",
						"classpath:spring-mybatis.xml" });
		typeService = (TypeService) context.getBean("typeService");
	}

	/**
	 * Test method for
	 * {@link com.phn.bookhouse.service.impl.TypeServiceImpl#addType(com.phn.bookhouse.entity.Type)}
	 * .
	 */
	@Test
	public void testAddType() {
		Type type = new Type();
		int i = 2;
		type.setType_name("test"+(new SimpleDateFormat("yyyyMMddhh-mm-ss").format((new Date()))));
		type.setType_father_id(i);
		System.out.println(typeService.addType(type));
	}

}
