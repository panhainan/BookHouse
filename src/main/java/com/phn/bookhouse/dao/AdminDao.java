/**
 * 
 */
package com.phn.bookhouse.dao;
import java.util.List;


import com.phn.bookhouse.entity.Admin;

/**
 * @author phn
 * @date 2014-11-4
 */
public interface AdminDao {
	public int insertAdmin(Admin admin);
	public int deleteAdminById(int adminid);
	public Admin selectAdminById(int adminid);
	public List<Admin> selectAdminByName(String adminname);
	public int updateAdmin(Admin admin);
}
