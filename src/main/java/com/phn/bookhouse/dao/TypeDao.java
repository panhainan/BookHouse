/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;

import com.phn.bookhouse.entity.Type;

/**
 * @file TypeDao.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public interface TypeDao {
	public int insertType(Type type);

	public int deleteTypeById(int typeid);

	public Type selectTypeById(int typeid);

	public List<Type> selectTypeByName(String typename);

	/**
	 * @author pan
	 * @param typefatherid
	 * @return
	 */
	public List<Type> selectTypeByFatherId(int typefatherid);

	public int updateType(Type type);
}
