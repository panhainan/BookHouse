/**
 * 
 */
package com.phn.bookhouse.dao;

import java.util.List;
import java.util.Map;

import com.phn.bookhouse.entity.Book;


/**
 * @file BookDao.java
 * @author pan
 * @date 2014年11月14日
 * @email panhainan@yeah.net
 */
public interface BookDao {
	public int insertBook(Book book);
	public int deleteBookById(long bookid);
	public Book selectBookById(long bookid);
	public List<Book> selectBookByName(Book book);
	public List<Book> selectBookByHouseId(long bookuserid);
	public int upBookImg(Book book);
	public int updateBook(Book book);
	/**
	 * @author pan
	 * @param book_status 
	 * @return
	 */
	public List<Book> selectBookListPage(boolean book_status);
	/**
	 * @author pan
	 * @param bookisbn
	 * @return
	 */
	public Book selectBookByISBN(String bookisbn);
	/**
	 * @author pan
	 * @param book
	 * @return
	 */
	public int updownBookStatus(Book book);
	/**
	 * @author pan
	 * @param param
	 * @return
	 */
	public List<Book> selectHouseBookListPage(Map<String, Object> map);
	/**
	 * @author pan
	 * @param book_id
	 */
	public void updateBookSaleSum(Map<String, Object> map);
	/**
	 * @author pan
	 * @param book
	 */
	public void updateBookScore(Book book);
	/**
	 * @author pan
	 * @param book
	 * @return
	 */
	public List<Book> selectBookByType(Book book);
	/**
	 * @author pan
	 * @return
	 */
	public List<Book> selectBookBySale();
}
