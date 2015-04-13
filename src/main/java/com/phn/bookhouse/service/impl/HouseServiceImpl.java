/**
 * 
 */
package com.phn.bookhouse.service.impl;

import java.util.List;







import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.HouseDao;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.service.HouseService;

/**
 * @file HouseServiceImpl.java
 * @author pan
 * @date 2014年11月13日
 * @email panhainan@yeah.net
 */
@Service("houseService")
public class HouseServiceImpl implements HouseService { 
	@Autowired
	private HouseDao houseDao;
	@Override
	public int addHouse(House house) {
		return 0;
	}

	@Override
	public int removeHouseById(long houseid) {
		return 0;
	}

	@Override
	public House findHouseById(long houseid) {
		return houseDao.selectHouseById(houseid);
	}

	@Override
	public House loginJudge(String housename,String housepass) {
		House currentHouse = new House();
		currentHouse.setHous_login_name(housename);
		currentHouse.setHous_login_email(housename);
		currentHouse.setHous_login_password(housepass);
		return houseDao.loginJudge(currentHouse);
	}

	@Override
	public List<House> findHouseByName(String housename) {
		return null;
	}

	@Override
	public int editHouseInfo(House house) {
		return houseDao.updateHouseInfo(house);
	}
	@Override
	public int editHousePass(House house) {
		return houseDao.updateHousePass(house);
	}

	@Override
	public void editHouseLogo(House loginHouse) {
		houseDao.updateHouseLogo(loginHouse);
	}

	@Override
	public boolean registJudge(House house) {
		List<House> list= houseDao.registJudge(house);
		if(list.size()!=0){
			return false;
		}
		return true;
	}
	@Override
	public int regist(House house) {
		return  houseDao.regist(house);
	}

}
