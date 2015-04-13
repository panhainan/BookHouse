package com.phn.bookhouse.service;

import java.util.List;

import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.Order;
import com.phn.bookhouse.entity.Type;



public interface BookService {
	/**
	 * 添加图书
	 * @author pan
	 * @param book
	 * @return int
	 */
	public int addBook(Book book);
	public int removeBookById(long bookid);
	public Book findBookById(long bookid);
	public List<Book> findBookByName(String bookname);
	public List<Book> findBookByHouseId(long bookhouseid);
	public int editBook(Book book);
	public int upBookImg(Book book);
	/**
	 * @author pan
	 * @param book_isbn
	 * @return
	 */
	public Book findBookByISBN(String bookisbn);
	/**
	 * @author pan
	 * @param book
	 * @return
	 */
	public int updownBook(Book book);
	/**
	 * @author pan
	 * @param typefatherid
	 * @return
	 */
	public List<Type> findBookFType(int typefatherid);
	/**
	 * @author pan
	 * @param order
	 * @return
	 */
	public List<Order> findBookOrderCommentById(Order order);
	/**
	 * @author pan
	 * @param book
	 * @return
	 */
	public List<Book> findBookByName(Book book);
	/**
	 * @author pan
	 * @param book
	 * @return
	 */
	public List<Book> findBookByType(Book book);
	/**
	 * @author pan
	 * @return
	 */
	public List<Book> findBookBySale();
}