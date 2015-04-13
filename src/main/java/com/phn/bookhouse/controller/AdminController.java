/**
 * 
 */
package com.phn.bookhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @class AdminController.java
 * @author pan
 * @date 2014年11月12日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@RequestMapping(value = "/hello.htm")
	public ModelAndView helloword() {
		System.out.println("欢迎使用三味书城");
		ModelAndView mv = new ModelAndView();
		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
		mv.setViewName("index");
		return mv; 
	}
	
	@RequestMapping(value="/goLogin.htm")
	public String goLogin(){
		return "admin/login";
		
	}
	@RequestMapping(value="/login.htm")
	public String login(){
		return "admin/main";
		
	}
	@RequestMapping(value="/goHome.htm")
	public String goHome(){
		return "admin/home";
		
	}
}
