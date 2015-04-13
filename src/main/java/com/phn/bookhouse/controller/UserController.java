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

import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.House;
import com.phn.bookhouse.entity.User;
import com.phn.bookhouse.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/goLogin.htm")
	public String goLogin() {
		System.out
				.println("\n>>>>>>>>>>>>>>>>>info:welcome to three's book house!\n");
		return "login";
	}

	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public ModelAndView login(String username, String userpass) {
		System.out.println("\n>>>>>>>>>>>>>>>>>info:login_name:" + username
				+ "login_pass:" + userpass + "\n");
		User sessionUser = null;
		sessionUser = userService.loginJudge(username, userpass);
		if (sessionUser == null) {
			return new ModelAndView("login");
		} else {
			/* 将登录成功的用户保存到session中 */
			// 获取request对象
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
					.getRequestAttributes()).getRequest();
			// 获取session对象
			HttpSession session = request.getSession(true);
			session.setAttribute("loginUser", sessionUser);
			session.setMaxInactiveInterval(15 * 60);
			// model.addAttribute("loginHouse", sessionHouse);
			return new ModelAndView("redirect:./main.htm");
		}
	}
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public ModelAndView logout( HttpServletRequest req){
		req.getSession().removeAttribute("loginUser");
		return new ModelAndView("redirect:/index.htm");
	}

	@RequestMapping(value = "/regist.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> regist(String user_login_name,
			String user_login_password, String user_login_email,
			String userRpassword) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!user_login_password.equals(userRpassword)) {
			map.put("message", "两次密码不一致！");
		} else {
			User user = new User();
			user.setUser_login_name(user_login_name);
			user.setUser_nick_name(user_login_name);
			user.setUser_login_password(user_login_password);
			user.setUser_login_email(user_login_email);
			boolean flag = userService.registJudge(user);
			if (false == flag) {
				map.put("message", "该用户名或者邮箱已被使用！");
			} else {
				int registflag = userService.regist(user);
				if (registflag != 1) {
					map.put("message", "服务器错误！");
				} else {
					map.put("message", "注册成功！");
					map.put("ok", true);
				}
			}
		}
		return map;
	}

	@RequestMapping(value = "/main.htm")
	public String main() {
		return "user/main";
	}

	@RequestMapping(value = "/goHome.htm")
	public String home() {
		System.out.println("\n>>>>>>>>>>>>>>>>>info:home\n");
		return "user/home";
	}

	@RequestMapping(value = "/goEditInfo.htm", method = RequestMethod.GET)
	public String goEditInfo(/* @ModelAttribute("loginHouse") House house */) {
		return "user/editInfo";
	}

	@RequestMapping(value = "/editInfo.htm", method = RequestMethod.POST)
	public ModelAndView editInfo(User user, HttpServletRequest req) {
		User loginUser = (User) req.getSession().getAttribute("loginUser");
		user.setUser_id(loginUser.getUser_id());
		userService.editUserInfo(user);
		loginUser = userService.findUserById(user.getUser_id());
		req.getSession().removeAttribute("loginUser");
		/* 将更新成功的用户保存到session中 */
		req.getSession().setAttribute("loginUser", loginUser);
		req.getSession().setMaxInactiveInterval(15 * 60);
		return new ModelAndView("redirect:./goHome.htm");
	}

	@RequestMapping(value = "/goAllAddr.htm", method = RequestMethod.GET)
	public String goEditAddr(HttpServletRequest req) {
		User loginUser = (User) req.getSession(true).getAttribute("loginUser");
		List<Address> listAddr = userService.findUserAddress(loginUser
				.getUser_id());
		if (listAddr.size() != 0) {
			req.setAttribute("listAddr", listAddr);
		} else {
			req.setAttribute("listAddr", null);
		}
		return "user/allAddr";
	}

	@RequestMapping(value = "/goEditPic.htm", method = RequestMethod.GET)
	public String goEditPic() {
		return "user/editPic";
	}

	@RequestMapping(value = "/editPic.htm")
	public ModelAndView editPic(
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
			e.printStackTrace();
		}
		String userPic = "/u&hIMG/" + fileName;
		User loginUser = (User) request.getSession(true).getAttribute(
				"loginUser");
		loginUser.setUser_picture(userPic);
		userService.editUserPic(loginUser);
		return new ModelAndView("redirect:./goEditPic.htm");
	}

	@RequestMapping(value = "/goEditPass.htm", method = RequestMethod.GET)
	public String goEditPass() {
		return "user/editPass";
	}

	@RequestMapping(value = "/editPass.htm", method = RequestMethod.POST)
	public ModelAndView editPass(String old_password, String new_password,
			String assert_new_password, HttpServletRequest req) {
		User loginUser = (User) req.getSession().getAttribute("loginUser");
		if (old_password.equals(loginUser.getUser_login_password())) {
			if (new_password.equals(assert_new_password)) {
				loginUser.setUser_login_password(new_password);
				int flag = userService.editUserPass(loginUser);
				if (flag == 1) {
					loginUser = userService
							.findUserById(loginUser.getUser_id());
					req.getSession().removeAttribute("loginUser");
					/* 将更新成功的用户保存到session中 */
					req.getSession().setAttribute("loginUser", loginUser);
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
			req.getSession().removeAttribute("loginUser");
			return new ModelAndView("redirect:./goLogin.htm");
		}

	}
}