/**
 * 
 */
package com.phn.bookhouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.AddressDao;
import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.service.AddressService;

/**
 * @file AddressServiceImpl.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
@Service("addressService")
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressDao addressDao;
	@Override
	public int addAddress(Address address) {
		return addressDao.insertAddress(address);
	}

	@Override
	public int editAddress(Address address) {
		return addressDao.updateAddress(address);
	}

	@Override
	public int removeAddress(long addressid) {
		return addressDao.deleteAddress(addressid);
	}

	@Override
	public Address findAddressById(long addressid) {
		return addressDao.selectAddressById(addressid);
	}

}
