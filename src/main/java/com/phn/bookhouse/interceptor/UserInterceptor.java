package com.phn.bookhouse.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.phn.bookhouse.entity.User;

public class UserInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("最后执行！！！一般用于释放资源！！");

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("Action执行之后，生成视图之前执行！！");
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("action之前执行！！！");
		// 获取request对象
		// HttpServletRequest request = ((ServletRequestAttributes)
		// RequestContextHolder.getRequestAttributes()).getRequest();
		// 获取session对象
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
//			PrintWriter out = response.getWriter();
//			response.setContentType("text/html; charset=utf-8");
//			out.write("<script language='javascript'> alert('请先登录！'); </script>");
			response.sendRedirect("/BookHouse/user/goLogin.htm");
			return false;
		}
		return true; // 继续执行action
	}

}
