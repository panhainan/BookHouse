/**
 * 
 */
package com.test.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.phn.bookhouse.entity.Admin;
import com.phn.bookhouse.service.AdminService;

/**
 * @class AdminServiceTest.java
 * @author pan
 * @date 2014年11月12日
 * @email panhainan@yeah.net
 */
public class AdminServiceTest {
	private AdminService adminService;

	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml",
						"classpath:spring-mybatis.xml" });
		adminService = (AdminService) context.getBean("adminService");
	}

	/**
	 * Test method for
	 * {@link com.phn.bookhouse.service.impl.AdminServiceImpl#insertAdmin(com.phn.bookhouse.entity.Admin)}
	 * .
	 */
	// @Test
	public void testInsertAdmin() {
		Admin admin = new Admin();
		admin.setAdmi_login_name("testInsertAdmin");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhh-mm-ss");
		String testTime = sdf.format(date);
		System.out.println(testTime);
		admin.setAdmi_login_password(testTime);
		adminService.addAdmin(admin);
	}

	// @Test
	public void testRemoveAdminById() {
		int flag = adminService.removeAdminById(2);
		System.out.println("受影响的行数：" + flag);
	}

	// @Test
	public void testSelectAdminByName() {
		List<Admin> list = null;
		list = adminService.findAdminByName("pq");
		System.out.println(list.toString());
	}

	// @Test
	public void testSelectAdminById() {
		Admin admin = null;
		admin = adminService.findAdminById(2);
		if (admin == null) {
			System.out.println("该id管理员不存在！");
		} else {
			System.out.println(admin.toString());
		}
	}

	@Test
	public void testEditAdmin() {
		Admin admin = new Admin();
		admin.setAdmi_id(1);
		admin.setAdmi_login_name("testEditPHN");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhh-mm-ss");
		String testTime = sdf.format(date);
		System.out.println(testTime);
		admin.setAdmi_login_password(testTime);
		int flag = adminService.editAdmin(admin);
		System.out.println("受影响的行数：" + flag);
	}
}
