/**
 * 
 */
package com.phn.bookhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.TypeDao;
import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.TypeService;

/**
 * @file TypeServiceImpl.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService {

	@Autowired
	private TypeDao typeDao;

	@Override
	public int addType(Type type) {
		// TODO Auto-generated method stub
		return typeDao.insertType(type);
	}

	@Override
	public int removeTypeById(int typeid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Type findTypeById(int typeid) {
		return typeDao.selectTypeById(typeid);
	}

	@Override
	public List<Type> findTypeByFatherId(int typefatherid) {
		return typeDao.selectTypeByFatherId(typefatherid);
	}

	@Override
	public List<Type> findTypeByName(String typename) {
		return null;
	}

	@Override
	public int editType(Type type) {
		return typeDao.updateType(type);
	}

	@Override
	public List<Type> findFatherType(int typefatherid) {
		return typeDao.selectTypeByFatherId(typefatherid);
	}

}
