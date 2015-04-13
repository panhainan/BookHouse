/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;

import com.phn.bookhouse.entity.Address;

/**
 * @file AddressDao.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public interface AddressDao {

	/**
	 * @author pan
	 * @param addressid
	 * @return
	 */
	public Address selectAddressById(long addressid);

	/**
	 * @author pan
	 * @param addressid
	 * @return
	 */
	public int deleteAddress(long addressid);

	/**
	 * @author pan
	 * @param address
	 * @return
	 */
	public int updateAddress(Address address);

	/**
	 * @author pan
	 * @param address
	 * @return
	 */
	public int insertAddress(Address address);

	/**
	 * @author pan
	 * @param user_id
	 * @return
	 */
	public List<Address> selectAddressByUserId(long user_id);

}
