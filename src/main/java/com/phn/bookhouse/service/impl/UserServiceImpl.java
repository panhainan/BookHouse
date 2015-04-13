package com.phn.bookhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.UserDao;
import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.User;
import com.phn.bookhouse.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserDao userDao;

	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public User loginJudge(String username, String userpass) {
		User currentUser = new User();
		currentUser.setUser_login_name(username);
		currentUser.setUser_login_password(userpass);
		currentUser.setUser_login_email(username);
		return userDao.loginJudge(currentUser);
	}

	@Override
	public int editUserInfo(User user) {
		return userDao.updateUserInfo(user);
	}

	@Override
	public User findUserById(long user_id) {
		return userDao.selectUserById(user_id);
	}

	@Override
	public int editUserPass(User user) {
		return userDao.updateUserPass(user);
	}

	@Override
	public List<Address> findUserAddress(long userid) {
		return userDao.selectUserAddress(userid);
	}

	@Override
	public void editUserPic(User loginUser) {
		 userDao.updateUserPic(loginUser);
	}

	@Override
	public boolean registJudge(User user) {
		List<House> list= userDao.registJudge(user);
		if(list.size()!=0){
			return false;
		}
		return true;
	}

	@Override
	public int regist(User user) {
		return  userDao.regist(user);
	}

}