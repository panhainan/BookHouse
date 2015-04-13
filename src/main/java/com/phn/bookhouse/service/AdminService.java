package com.phn.bookhouse.service;

import java.util.List;

import com.phn.bookhouse.entity.Admin;



public interface AdminService {
	public int addAdmin(Admin admin);
	public int removeAdminById(int adminid);
	public Admin findAdminById(int adminid);
	public List<Admin> findAdminByName(String adminname);
	public int editAdmin(Admin admin);
}