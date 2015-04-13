/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;

import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.User;

/**
 * @file UserDao.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public interface UserDao {
	public User loginJudge(User user);
	/**
	 * @param user
	 * @return
	 */
	public int insertUser(User user);
	/**
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);
	/**
	 * @param user
	 * @return
	 */
	public int updateUserPass(User user);

	/**
	 * @param userid
	 * @return
	 */
	public User selectUserById(long userid);
	
	
	public List<Address> selectUserAddress(long userid);
	/**
	 * @author pan
	 * @param loginUser
	 */
	public void updateUserPic(User loginUser);
	/**
	 * @author pan
	 * @param user
	 * @return
	 */
	public List<House> registJudge(User user);
	/**
	 * @author pan
	 * @param user
	 * @return
	 */
	public int regist(User user);
	
}
