package com.phn.bookhouse.service;

import java.util.List;

import com.phn.bookhouse.entity.Type;



public interface TypeService {
	public int addType(Type type);
	public int removeTypeById(int typeid);
	public Type findTypeById(int typeid);
	public List<Type> findTypeByName(String typename);
	public int editType(Type type);
	/**
	 * @author pan
	 * @param typefatherid
	 * @return List<Type>
	 */
	public List<Type> findTypeByFatherId(int typefatherid);
	/**
	 * @author pan
	 * @param typefatherid
	 * @return
	 */
	public List<Type> findFatherType(int typefatherid);
}