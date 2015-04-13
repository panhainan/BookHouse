package com.phn.bookhouse.service;

import java.util.List;

import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.User;


public interface UserService {
	public int insertUser(User user);

	/**
	 * @author pan
	 * @param username
	 * @param userpass
	 * @return
	 */
	public User loginJudge(String username, String userpass);

	/**
	 * @author pan
	 * @param user
	 */
	public int editUserInfo(User user);

	/**
	 * @author pan
	 * @param user_id
	 * @return
	 */
	public User findUserById(long user_id);

	/**
	 * @author pan
	 * @param loginUser
	 * @return
	 */
	public int editUserPass(User user);
	
	public List<Address> findUserAddress(long userid);

	/**
	 * @author pan
	 * @param loginUser
	 */
	public void editUserPic(User loginUser);

	/**
	 * @author pan
	 * @param user
	 * @return
	 */
	public boolean registJudge(User user);

	/**
	 * @author pan
	 * @param user
	 * @return
	 */
	public int regist(User user);
}