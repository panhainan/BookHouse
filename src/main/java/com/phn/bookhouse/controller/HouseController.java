/**
 * 
 */
package com.phn.bookhouse.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.User;
import com.phn.bookhouse.service.HouseService;

/**
 * @file AdminController.java
 * @author pan
 * @date 2014年11月12日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value = "/house")
// @SessionAttributes(value = "loginHouse")
public class HouseController {
	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "/goLogin.htm")
	public String goLogin() {
		System.out
				.println("\n>>>>>>>>>>>>>>>>>info:welcome to three's book house!\n");
		return "login";
	}

	@RequestMapping(value = "/goHome.htm")
	public String home() {
		System.out.println("\n>>>>>>>>>>>>>>>>>info:main\n");
		return "house/home";
	}

	@RequestMapping(value = "/main.htm")
	public String main() {
		return "house/main";
	}

	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public ModelAndView login(/* Model model, */String housename, String housepass) {
		System.out.println("\n>>>>>>>>>>>>>>>>>info:login_name:" + housename
				+ "login_pass:" + housepass + "\n");
		House sessionHouse = null;
		sessionHouse = houseService.loginJudge(housename, housepass);
		if (sessionHouse == null) {
			return new ModelAndView("login");
		} else {
			/* 将登录成功的用户保存到session中 */
			// 获取request对象
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
					.getRequestAttributes()).getRequest();
			// 获取session对象
			HttpSession session = request.getSession(true);
			session.setAttribute("loginHouse", sessionHouse);
			session.setMaxInactiveInterval(15 * 60);
			// model.addAttribute("loginHouse", sessionHouse);
			return new ModelAndView("redirect:./main.htm");
		}
	}
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public ModelAndView logout( HttpServletRequest req){
		req.getSession().removeAttribute("loginHouse");
		return new ModelAndView("redirect:/index.htm");
	}

	@RequestMapping(value = "/regist.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> regist(String house_login_name,
			String house_login_password, String house_login_email,
			String houseRpassword) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!house_login_password.equals(houseRpassword)) {
			map.put("message", "两次密码不一致！");
		} else {
			House house = new House();
			house.setHous_login_name(house_login_name);
			house.setHous_name(house_login_name);
			house.setHous_login_password(house_login_password);
			house.setHous_login_email(house_login_email);
			boolean flag = houseService.registJudge(house);
			if (false == flag) {
				map.put("message", "该用户名或者邮箱已被使用！");
			} else {
				int registflag = houseService.regist(house);
				if(registflag!=1){
					map.put("message", "服务器错误！");
				}else{
					map.put("message", "注册成功！");
					map.put("ok", true);
				}
			}
		}
		return map;
	}

	@RequestMapping(value = "/goEditInfo.htm", method = RequestMethod.GET)
	public String goEditInfo(/* @ModelAttribute("loginHouse") House house */) {
		return "house/editInfo";
	}

	@RequestMapping(value = "/editInfo.htm", method = RequestMethod.POST)
	public ModelAndView editInfo(House house, HttpServletRequest req) {
		House loginHouse = (House) req.getSession().getAttribute("loginHouse");
		house.setHous_id(loginHouse.getHous_id());
		houseService.editHouseInfo(house);
		loginHouse = houseService.findHouseById(house.getHous_id());
		req.getSession().removeAttribute("loginHouse");
		/* 将更新成功的用户保存到session中 */
		req.getSession().setAttribute("loginHouse", loginHouse);
		req.getSession().setMaxInactiveInterval(15 * 60);
		return new ModelAndView("redirect:./goHome.htm");
	}

	@RequestMapping(value = "/goEditLogo.htm", method = RequestMethod.GET)
	public String goEditLogo() {
		return "house/editLogo";
	}

	@RequestMapping(value = "/editLogo.htm")
	public ModelAndView editLogo(
			@RequestParam(value = "imgFile", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		String path = request.getSession().getServletContext()
				.getRealPath("u&hIMG");
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

		String houseLogo = "/u&hIMG/" + fileName;
		House loginHouse = (House) request.getSession(true).getAttribute(
				"loginHouse");
		loginHouse.setHous_logo(houseLogo);
		houseService.editHouseLogo(loginHouse);
		return new ModelAndView("redirect:./goEditLogo.htm");
	}

	@RequestMapping(value = "/goEditPass.htm", method = RequestMethod.GET)
	public String goEditPass() {
		return "house/editPass";
	}

	@RequestMapping(value = "/editPass.htm", method = RequestMethod.POST)
	public ModelAndView editPass(String old_password, String new_password,
			String assert_new_password, HttpServletRequest req) {
		House loginHouse = (House) req.getSession().getAttribute("loginHouse");
		if (old_password.equals(loginHouse.getHous_login_password())) {
			if (new_password.equals(assert_new_password)) {
				loginHouse.setHous_login_password(new_password);
				int flag = houseService.editHousePass(loginHouse);
				if (flag == 1) {
					loginHouse = houseService.findHouseById(loginHouse
							.getHous_id());
					req.getSession().removeAttribute("loginHouse");
					/* 将更新成功的用户保存到session中 */
					req.getSession().setAttribute("loginHouse", loginHouse);
					req.getSession().setMaxInactiveInterval(15 * 60);
					System.out.println("success");
					return new ModelAndView("redirect:./goHome.htm");
				} else {
					System.out.println("failed01");
					return new ModelAndView("redirect:./goEditPass.htm");
				}
			} else {
				System.out.println("failed02");
				return new ModelAndView("redirect:./goEditPass.htm");
			}
		} else {
			System.out.println("failed03-removesession");
			req.getSession().removeAttribute("loginHouse");
			return new ModelAndView("redirect:./goLogin.htm");
		}

	}
}
