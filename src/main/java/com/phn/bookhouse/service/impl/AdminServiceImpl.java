package com.phn.bookhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.AdminDao;
import com.phn.bookhouse.entity.Admin;
import com.phn.bookhouse.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public int addAdmin(Admin admin) {
		System.out.println("info:here is admin service impl;");
		return adminDao.insertAdmin(admin);
	}

	@Override
	public int removeAdminById(int adminid) {
		return adminDao.deleteAdminById(adminid);
	}

	@Override
	public Admin findAdminById(int adminid) {
		return adminDao.selectAdminById(adminid);
	}

	@Override
	public List<Admin> findAdminByName(String adminname) {
		return adminDao.selectAdminByName(adminname);
	}

	@Override
	public int editAdmin(Admin admin) {
		return adminDao.updateAdmin(admin);
	}

}