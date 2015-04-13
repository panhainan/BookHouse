/**
 * 
 */
package com.phn.bookhouse.service;

import com.phn.bookhouse.entity.Address;

/**
 * @file AddressService.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
public interface AddressService {
	public int addAddress(Address address);
	public int editAddress(Address address);
	public int removeAddress(long addressid);
	public Address findAddressById(long addressid);
}
