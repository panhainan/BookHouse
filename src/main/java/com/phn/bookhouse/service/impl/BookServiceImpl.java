package com.phn.bookhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phn.bookhouse.dao.BookDao;
import com.phn.bookhouse.dao.OrderDao;
import com.phn.bookhouse.dao.TypeDao;
import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.Order;
import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;
	@Autowired
	private TypeDao typeDao;
	@Autowired
	private OrderDao orderDao;

	@Override
	public int addBook(Book book) {
		return bookDao.insertBook(book);
	}

	@Override
	public int removeBookById(long bookid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Book findBookById(long bookid) {
		return bookDao.selectBookById(bookid);
	}

	@Override
	public List<Book> findBookByName(String bookname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> findBookByHouseId(long bookhouseid) {
		return bookDao.selectBookByHouseId(bookhouseid);
	}

	@Override
	public Book findBookByISBN(String bookisbn) {
		return bookDao.selectBookByISBN(bookisbn);
	}

	@Override
	public List<Type> findBookFType(int typefatherid) {
		return typeDao.selectTypeByFatherId(typefatherid);
	}

	@Override
	public int upBookImg(Book book) {
		return bookDao.upBookImg(book);
	}

	@Override
	public int editBook(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updownBook(Book book) {
		return bookDao.updownBookStatus(book);
	}

	@Override
	public List<Order> findBookOrderCommentById(Order order) {
		return orderDao.selectOrderByBookidStatus(order);
	}

	@Override
	public List<Book> findBookByName(Book book) {
		return bookDao.selectBookByName(book);
	}

	@Override
	public List<Book> findBookByType(Book book) {
		return bookDao.selectBookByType(book);
	}
	@Override
	public List<Book> findBookBySale() {
		return bookDao.selectBookBySale();
	}

}