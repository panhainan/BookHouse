/**
 * 
 */
package com.phn.bookhouse.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.phn.bookhouse.dao.BookDao;
import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.Order;
import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.BookService;
import com.phn.bookhouse.service.TypeService;
import com.phn.bookhouse.util.UploadUtil;

/**
 * @file BookController.java
 * @author pan
 * @date 2014年11月12日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value = "/book")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private TypeService typeService;
	private int pageSize = 6;
	private int forepageSize = 15;

	@RequestMapping(value = "/goAddBook.htm")
	public String goAddBook(HttpServletRequest req) {
		int typefatherid = -1;
		List<Type> listftype = bookService.findBookFType(typefatherid);
		req.setAttribute("listftype", listftype);
		return "house/addBook";
	}

	@RequestMapping(value = "/addBook.htm", method = RequestMethod.POST)
	public ModelAndView addBook(Book book, HttpServletRequest req,
			String book_type1, String book_type2, String book_type3) {
		House house = (House) req.getSession().getAttribute("loginHouse");
		book.setBook_hous_id(house.getHous_id());
		book.setBook_sale_sum(0);
		book.setBook_status(false);
		book.setBook_score(0);
		book.setBook_sale_comment_sum(0);
		System.out.println(book_type1 + book_type2 + book_type3);
		book.setBook_type(book_type1 + book_type2 + book_type3);
		System.out.println(book.getBook_type());
		bookService.addBook(book);
		System.out.println("the book id insert just now is ：" +book.getBook_id());
		Book currentBook = bookService.findBookById(book.getBook_id());
		/* 将保存成功的图书保存到session中 */
		// 获取session对象
		HttpSession session = req.getSession(true);
		session.setAttribute("currentBook", currentBook);
		return new ModelAndView("redirect:./goUpBookImg.htm");
	}

	@RequestMapping(value = "/goUpBookImg.htm", method = RequestMethod.GET)
	public String goUpBookImg(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("--------------------------------");
		return "house/upBookImg";
	}

//	@RequestMapping(value = "/upBookImg.htm", method = RequestMethod.POST)
//	public ModelAndView upBookImg(Model model, HttpServletRequest request) {
//		// 转型为MultipartHttpRequest(重点的所在)
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//		// 获得第1张图片（根据前台的name名称得到上传的文件）
//		MultipartFile imgFile1 = multipartRequest.getFile("imgFile");
//		UploadUtil uploadutil = new UploadUtil();
//		String fileName = imgFile1.getOriginalFilename();
//		// System.out.println("info: up picture name at controller is :"+
//		// fileName);
//		try {
//			String fileNewName = uploadutil.uploadImage1(request, imgFile1,
//					imgFile1.getContentType(), fileName);
//			// System.out.println("info: save picture name at controller is :"+
//			// fileNewName);
//			Book book = (Book) request.getSession().getAttribute("currentBook");
//			book.setBook_picture(fileNewName);
//			int flag = bookService.upBookImg(book);
//			if (flag != 1) {
//				// System.out.println("info:upload image failed!");
//				return new ModelAndView("redirect:./goUpBookImg.htm");
//			}
//		} catch (IOException e) {
//			// e.printStackTrace();
//			System.out.println("info:upload image failed!" + e.getMessage());
//			return new ModelAndView("redirect:./goUpBookImg.htm");
//		}
//		return new ModelAndView("redirect:./goAllBookByHouse.htm", "updown", "down");
//	}
	@RequestMapping(value = "/upBookImg.htm", method = RequestMethod.POST)
	public ModelAndView upBookImg(
			@RequestParam(value = "imgFile", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		String path = request.getSession().getServletContext()
				.getRealPath("bookIMG");
		String fileName = file.getOriginalFilename();
		// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1,
				fileName.length());
		// 对扩展名进行小写转换
		ext = ext.toLowerCase();
		// 定义一个数组，用于保存可上传的文件类型
		List fileTypes = new ArrayList();
		fileTypes.add("jpg");
		fileTypes.add("jpeg");
		fileTypes.add("bmp");
		fileTypes.add("gif");
		if (!fileTypes.contains(ext)) { // 如果扩展名属于允许上传的类型，则创建文件
			System.out.println("文件类型不允许");
			return new ModelAndView("errorpage/404");
		}
		// String fileName = new Date().getTime()+".jpg";
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			// e.printStackTrace();
			return new ModelAndView("errorpage/500");
		}

		String bookImg = "/bookIMG/" + fileName;
		Book book = (Book) request.getSession().getAttribute("currentBook");
		book.setBook_picture(bookImg);
		int flag = bookService.upBookImg(book);
		if (flag != 1) {
			// System.out.println("info:upload image failed!");
			return new ModelAndView("redirect:./goUpBookImg.htm");
		}
		return new ModelAndView("redirect:./goAllBookByHouse.htm", "updown", "down");
	}

	@RequestMapping(value = "/upBook.htm", method = RequestMethod.GET)
	public ModelAndView upBook(HttpServletRequest req,
			@RequestParam(value = "bookid") String bookid) {
		long book_id = 0;
		try {
			book_id = Integer.parseInt(bookid);

		} catch (NumberFormatException e) {
			return new ModelAndView("errorpage/500");
		}
		Book book = bookService.findBookById(book_id);
		book.setBook_status(true);
		int flag = bookService.updownBook(book);
		if (flag != 1) {
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("redirect:./goAllBookByHouse.htm", "updown", "up");
	}

	@RequestMapping(value = "/downBook.htm", method = RequestMethod.GET)
	public ModelAndView downBook(HttpServletRequest req,
			@RequestParam(value = "bookid") String bookid) {
		long book_id = 0;
		try {
			book_id = Integer.parseInt(bookid);

		} catch (NumberFormatException e) {
			return new ModelAndView("errorpage/500");
		}
		Book book = bookService.findBookById(book_id);
		book.setBook_status(false);
		int flag = bookService.updownBook(book);
		if (flag != 1) {
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("redirect:./goAllBookByHouse.htm", "updown", "down");
	}

	/**
	 * 店铺分页浏览图书
	 * @author pan
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/goAllBookByHouse.htm", method = RequestMethod.GET)
	public ModelAndView goAllBookByHousePageList(HttpServletRequest req) throws ServletException, IOException {
		String str_pageNum = req.getParameter("pageNum");
		String book_upDown = req.getParameter("updown");
		System.out.println(book_upDown);
		int book_status = 0;
		if (book_upDown.equals("up")) {
			book_status = 1;
		} else if (book_upDown.equals("down")) {
			book_status = 0;
		} else {
			return new ModelAndView("errorpage/500");
		}
		int pageNum = 0;
		try {
			if (str_pageNum == "" || str_pageNum == null) {
				pageNum = 1;
			} else {
				pageNum = Integer.parseInt(str_pageNum);
			}
		} catch (NumberFormatException e) {
			// req.setAttribute("err", "页码只能是大于0的整数，请重新输入!");
			return new ModelAndView("errorpage/500");
		}
		House loginHouse;
		long house_id = 0;
		try {
			loginHouse = (House) req.getSession().getAttribute("loginHouse");
			house_id = loginHouse.getHous_id();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			PageHelper.startPage(pageNum, pageSize);
			Map<String, Object> param=new HashMap<String, Object>(); 
		    param.put("book_status", book_status);
		    param.put("house_id", house_id); 
			List<Book> list = bookDao.selectHouseBookListPage(param);
			PageInfo<Book> page = new PageInfo(list);
			req.setAttribute("page", page);
			req.setAttribute("updown", book_upDown);
		} catch (Exception e) {
			// req.setAttribute("err", "查询出错:" + e.getMessage());
			System.out.println("查询出错" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("house/allBook");
	}

	@RequestMapping(value = "/goAllBook.htm", method = RequestMethod.GET)
	public ModelAndView goAllBookPageList(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String str_pageNum = req.getParameter("pageNum");
		boolean book_status = true;
		int pageNum = 0;
		try {
			if (str_pageNum == "" || str_pageNum == null) {
				pageNum = 1;
			} else {
				pageNum = Integer.parseInt(str_pageNum);
			}
		} catch (NumberFormatException e) {
			// req.setAttribute("err", "页码只能是大于0的整数，请重新输入!");
			return new ModelAndView("errorpage/500");
		}
		try {
			PageHelper.startPage(pageNum, forepageSize);
			List<Book> list = bookDao.selectBookListPage(book_status);
			PageInfo<Book> page = new PageInfo(list);
			req.setAttribute("page", page);
		} catch (Exception e) {
			// req.setAttribute("err", "查询出错:" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("foreground/allBook");
	}
	@RequestMapping(value = "/goTheBook.htm", method = RequestMethod.GET)
	public String goTheBook(HttpServletRequest req,@RequestParam(value = "bookid")long bookid){
		Book theBook = bookService.findBookById(bookid);
		Order order=new Order();
		order.setOrde_book(theBook);
		order.setOrde_status(4);
		List<Order> listOrder = bookService.findBookOrderCommentById(order);
		req.setAttribute("book", theBook);
		req.setAttribute("listOrder", listOrder);
		req.setAttribute("OrderCount", listOrder.size());
		return "foreground/theBook";
	}
	
	@RequestMapping(value = "/findBookByName.htm", method = RequestMethod.POST)
	public String findBookByName(HttpServletRequest req,Book book){
		List<Book> listBook = bookService.findBookByName(book);
		req.setAttribute("listBook", listBook);
		return "foreground/searchBook";
	}
	@RequestMapping(value = "/findBookByType.htm", method = RequestMethod.GET)
	public ModelAndView findBookByType(HttpServletRequest req){
		String str_pageNum = req.getParameter("pageNum");
		String booktype="";
		try {
			booktype = new String(req.getParameter("booktype").getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			return new ModelAndView("errorpage/500");
		}
		int pageNum = 0;
		try {
			if (str_pageNum == "" || str_pageNum == null) {
				pageNum = 1;
			} else {
				pageNum = Integer.parseInt(str_pageNum);
			}
		} catch (NumberFormatException e) {
			// req.setAttribute("err", "页码只能是大于0的整数，请重新输入!");
			return new ModelAndView("errorpage/500");
		}
		try {
			PageHelper.startPage(pageNum, forepageSize);
			Book book = new Book();
			String searchText = new StringBuilder("%").append(booktype).append("%").toString();
			book.setBook_type(searchText);
			List<Book> listBook = bookService.findBookByType(book);
			PageInfo<Book> page = new PageInfo(listBook);
			req.setAttribute("page", page);
			req.setAttribute("booktype", booktype);
			int typefatherid = -1;
			List<Type> listftype = typeService.findFatherType(typefatherid);
			req.setAttribute("listftype", listftype);
		} catch (Exception e) {
			//System.out.println("查询出错:" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("foreground/typeBook");
	}
	@RequestMapping(value = "/goHotBook.htm")
	public String goHotBook(HttpServletRequest req){
		List<Book> listBook = bookService.findBookBySale();
		req.setAttribute("listBook", listBook);
		return "foreground/hotBook";
	}
}
