/**
 * 
 */
package com.phn.bookhouse.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.phn.bookhouse.dao.OrderDao;
import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.Book;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.Order;
import com.phn.bookhouse.entity.User;
import com.phn.bookhouse.service.OrderService;

/**
 * @file OrderController.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDao orderDao;
	private int pageSize = 6;

	/**
	 * user
	 * 
	 * @author pan
	 * @param req
	 * @param order
	 * @param book
	 * @return
	 */
	@RequestMapping(value = "/addBookOrder.htm", method = RequestMethod.POST)
	public ModelAndView addBookOrder(HttpServletRequest req, Order order,
			Book book) {
		User loginUser = (User) req.getSession(true).getAttribute("loginUser");
		order.setOrde_user(loginUser);
		order.setOrde_book(book);
		order.setOrde_status(0);
		order.setOrde_price(order.getOrde_price() * order.getOrde_book_amount());
		int flag = orderService.addOrder(order);
		if (flag == 1) {
			return new ModelAndView("redirect:./goAllOrderByIndex.htm",
					"assertStatus", 0);
		} else {
			return new ModelAndView("errorpage/500");
		}
	}

	@RequestMapping(value = "/addBookToOrderBag.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBookToOrderBag(HttpServletRequest req,
			@RequestParam(value = "bookid") long bookid,
			@RequestParam(value = "bookprice") double bookprice,
			@RequestParam(value = "ordebookamount") int ordebookamount) {
		User loginUser = (User) req.getSession(true).getAttribute("loginUser");
		Order order = new Order();
		Book book = new Book();
		book.setBook_id(bookid);
		book.setBook_price(bookprice);
		order.setOrde_user(loginUser);
		order.setOrde_book_amount(ordebookamount);
		order.setOrde_book(book);
		order.setOrde_status(0);
		order.setOrde_price(bookprice * order.getOrde_book_amount());
		int flag = orderService.addOrder(order);
		Map<String, Object> map = new HashMap<String, Object>();
		String message = "";
		if (flag == 1) {
			message = "加入购物车成功！请尽快前往结算";
		} else {
			message = "加入购物车失败！请重新操作";
		}
		map.put("message", message);
		return map;
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param req
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/goAllOrderByIndex.htm", method = RequestMethod.GET)
	public ModelAndView goAllOrderByIndex(HttpServletRequest req)
			throws ServletException, IOException {
		String order_assertStatus = req.getParameter("assertStatus");
		System.out.println(order_assertStatus);
		int order_assertStatusInt = Integer.parseInt(order_assertStatus);
		int orde_status = 0;
		if (order_assertStatusInt == 0) {
			orde_status = order_assertStatusInt;
		} else {
			return new ModelAndView("errorpage/500");
		}
		User loginUser;
		long user_id = 0;
		try {
			loginUser = (User) req.getSession().getAttribute("loginUser");
			user_id = loginUser.getUser_id();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("orde_status", orde_status);
			param.put("user_id", user_id);
			List<Order> listorder = null;
			listorder = orderDao.selectUserOrderListPage(param);
			if (listorder.size() != 0) {
				req.setAttribute("listOrder", listorder);
				req.setAttribute("assertStatus", orde_status);
			} else {
				req.setAttribute("listOrder", null);
				req.setAttribute("assertStatus", orde_status);
			}

		} catch (Exception e) {
			// req.setAttribute("err", "查询出错:" + e.getMessage());
			System.out.println("查询出错" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("user/allOrderI");
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param req
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/goAllOrderByUser.htm", method = RequestMethod.GET)
	public ModelAndView goAllOrderByUser(HttpServletRequest req)
			throws ServletException, IOException {
		String str_pageNum = req.getParameter("pageNum");
		String order_assertStatus = req.getParameter("assertStatus");
		System.out.println(order_assertStatus);
		int order_assertStatusInt = Integer.parseInt(order_assertStatus);
		int orde_status = 1;
		if (order_assertStatusInt >= 1 && order_assertStatusInt <= 4) {
			orde_status = order_assertStatusInt;
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
		User loginUser;
		long user_id = 0;
		try {
			loginUser = (User) req.getSession().getAttribute("loginUser");
			user_id = loginUser.getUser_id();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			PageHelper.startPage(pageNum, pageSize);
			if (orde_status == 4) {
				List<Order> list = orderDao.select5UserOrderListPage(user_id);
				PageInfo<Order> page = new PageInfo(list);
				req.setAttribute("page", page);
			} else {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("orde_status", orde_status);
				param.put("user_id", user_id);
				List<Order> list = orderDao.selectUserOrderListPage(param);
				PageInfo<Order> page = new PageInfo(list);
				req.setAttribute("page", page);
			}
			req.setAttribute("assertStatus", orde_status);
		} catch (Exception e) {
			// req.setAttribute("err", "查询出错:" + e.getMessage());
			System.out.println("查询出错" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("user/allOrder");
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param orderid
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/goAssertOrder.htm", method = RequestMethod.GET)
	public String goAssertOrder(@RequestParam(value = "orderid") long orderid,
			HttpServletRequest req) {
		Order order = orderService.findOrderById(orderid);
		User loginUser = (User) req.getSession(true).getAttribute("loginUser");
		List<Address> userListAddress = orderService
				.findOrderUserAddress(loginUser.getUser_id());
		System.out.println(userListAddress);
		req.setAttribute("order", order);
		req.setAttribute("userListAddress", userListAddress);
		return "user/assertOrder";
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param order
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/assertOrder.htm", method = RequestMethod.POST)
	public String assertOrder(Order order, HttpServletRequest req) {
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss-SSS");
		order.setOrde_number(sdf.format(time));
		order.setOrde_status(1);
		order.setOrde_datetime(time);
		orderService.assertOrderWithAddr(order);
		return "user/assertOK";

	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param orde_id
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/goReceiveOrder.htm", method = RequestMethod.GET)
	public String goReceiveOrder(@RequestParam(value = "orderid") long orde_id,
			HttpServletRequest req) {
		Order order = orderService.findOrderById(orde_id);
		req.setAttribute("order", order);
		return "user/receiveOrder";
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param orde_id
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/receiveOrder.htm", method = RequestMethod.POST)
	public String receiveOrder(@RequestParam(value = "orde_id") long orde_id,
			HttpServletRequest req) {
		Order order = new Order();
		order.setOrde_id(orde_id);
		order.setOrde_status(3);
		order.setOrde_user_score(3.0);
		orderService.assertOrder(order);
		req.setAttribute("orde_id", orde_id);
		return "user/receiveOK";
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param orde_id
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/goCommentOrder.htm", method = RequestMethod.GET)
	public String goCommentOrder(@RequestParam(value = "orderid") long orde_id,
			HttpServletRequest req) {
		Order order = orderService.findOrderById(orde_id);
		req.setAttribute("order", order);
		return "user/commentOrder";
	}

	/**
	 * user
	 * 
	 * @author pan
	 * @param order
	 * @param score
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/commentOrder.htm", method = RequestMethod.POST)
	public ModelAndView commentOrder(Order order,
			@RequestParam(value = "score") String score,
			@RequestParam(value = "book_score") double book_score,
			@RequestParam(value = "book_id") long book_id,
			@RequestParam(value = "book_sale_sum")int book_sale_sum,
			@RequestParam(value = "book_sale_comment_sum")int book_sale_comment_sum,
			HttpServletRequest req) {
		double scoreDouble;
		System.out.println(score);
		try {
			scoreDouble = Double.parseDouble(score);
			System.out.println(scoreDouble);
			order.setOrde_user_score(scoreDouble);
		} catch (Exception e) {
			return new ModelAndView("errorpage/500");
		}
		order.setOrde_status(4);
		orderService.commentOrder(order, book_score, book_id,book_sale_sum,book_sale_comment_sum);
		req.setAttribute("orde_id", order.getOrde_id());
		return new ModelAndView("user/commentOK");
	}

	/**
	 * house
	 * 
	 * @author pan
	 * @param req
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/goAllOrderByHouse.htm", method = RequestMethod.GET)
	public ModelAndView goAllOrderByHouse(HttpServletRequest req)
			throws ServletException, IOException {
		String str_pageNum = req.getParameter("pageNum");
		String order_assertStatus = req.getParameter("assertStatus");
		int order_assertStatusInt = Integer.parseInt(order_assertStatus);
		int orde_status = 1;
		if (order_assertStatusInt >= 1 && order_assertStatusInt <= 4) {
			orde_status = order_assertStatusInt;
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
		long hosu_id = 0;
		try {
			loginHouse = (House) req.getSession().getAttribute("loginHouse");
			hosu_id = loginHouse.getHous_id();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			PageHelper.startPage(pageNum, pageSize);
			if (orde_status == 4) {
				/* 这里还有问题 */
				List<Order> list = orderDao.findOrderByStatus5HouseId(hosu_id);
				PageInfo<Order> page = new PageInfo(list);
				req.setAttribute("page", page);
			} else {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("orde_status", orde_status);
				param.put("hosu_id", hosu_id);
				List<Order> list = orderDao.findOrderByStatusHouseId(param);
				PageInfo<Order> page = new PageInfo(list);
				req.setAttribute("page", page);
			}
			req.setAttribute("assertStatus", orde_status);
		} catch (Exception e) {
			// req.setAttribute("err", "查询出错:" + e.getMessage());
			System.out.println("查询出错" + e.getMessage());
			return new ModelAndView("errorpage/500");
		}
		return new ModelAndView("house/allOrder");
	}

	/**
	 * house
	 * 
	 * @author pan
	 * @param orde_id
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/sendOrder.htm", method = RequestMethod.GET)
	public ModelAndView sendOrder(
			@RequestParam(value = "orde_id") long orde_id,
			HttpServletRequest req) {
		Order order = orderService.findOrderById(orde_id);
		order.setOrde_status(2);
		orderService.assertOrderAndBook(order);
		req.setAttribute("orde_id", orde_id);
		return new ModelAndView("redirect:./goAllOrderByHouse.htm",
				"assertStatus", 2);
	}
}
