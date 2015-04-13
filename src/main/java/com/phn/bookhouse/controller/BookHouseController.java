/**
 * 
 */
package com.phn.bookhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.TypeService;

/**
 * @file BookHouseController.java
 * @author pan
 * @date 2014年11月21日
 * @email panhainan@yeah.net
 */
@Controller
public class BookHouseController {

	@Autowired
	private TypeService typeService;
	@RequestMapping("/index.htm")
	public String index(HttpServletRequest req) {
		int typefatherid = -1;
		List<Type> listftype = typeService.findFatherType(typefatherid);
		req.setAttribute("listftype", listftype);
		return "index0";
	}
	@RequestMapping(value = "/goLogin.htm")
	public String goLogin() {
		return "login";
	}
	@RequestMapping(value = "/goRegist.htm")
	public String goRegist() {
		return "regist";
	}
}
