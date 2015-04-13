package com.phn.bookhouse.service;

import java.util.List;


import com.phn.bookhouse.entity.House;



public interface HouseService {
	public int addHouse(House house);
	public int removeHouseById(long houseid);
	public House findHouseById(long houseid);
	public House loginJudge(String housename,String housepass);
	public List<House> findHouseByName(String housename);
	public int editHouseInfo(House house);
	public int editHousePass(House house);
	/**
	 * @author pan
	 * @param loginHouse
	 */
	public void editHouseLogo(House loginHouse);
	/**
	 * @author pan
	 * @param house
	 */
	public boolean registJudge(House house);
	/**
	 * @author pan
	 * @param house
	 * @return
	 */
	public int regist(House house);
}