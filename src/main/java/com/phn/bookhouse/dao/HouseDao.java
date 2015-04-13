/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;

import com.phn.bookhouse.entity.House;

/**
 * @file HouseDao.java
 * @author pan
 * @date 2014年11月13日
 * @email panhainan@yeah.net
 */
public interface HouseDao {
	public House loginJudge(House house);
	/**
	 * @param house
	 * @return
	 */
	public int updateHouseInfo(House house);
	/**
	 * @param house
	 * @return
	 */
	public int updateHousePass(House house);

	/**
	 * @param houseid
	 * @return
	 */
	public House selectHouseById(long houseid);
	/**
	 * @author pan
	 * @param loginHouse
	 */
	public void updateHouseLogo(House loginHouse);
	/**
	 * @author pan
	 * @param house
	 */
	public List<House> registJudge(House house);
	/**
	 * @author pan
	 * @param house
	 * @return
	 */
	public int regist(House house);
}
