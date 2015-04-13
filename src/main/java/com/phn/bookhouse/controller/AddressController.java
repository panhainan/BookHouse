/**
 * 
 */
package com.phn.bookhouse.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.phn.bookhouse.entity.Address;
import com.phn.bookhouse.entity.User;
import com.phn.bookhouse.service.AddressService;

/**
 * @file AddressController.java
 * @author pan
 * @date 2014年11月17日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value = "/address")
public class AddressController {
	@Autowired
	private AddressService addressService;

	@RequestMapping(value = "/goEditAddr.htm", method = RequestMethod.GET)
	public String goEditAddr(@RequestParam(value = "addrid") String addrid,
			HttpServletRequest req) {
		long addr_id = Integer.parseInt(addrid);
		Address address = addressService.findAddressById(addr_id);
		req.setAttribute("address", address);
		return "user/editAddr";
	}

	@RequestMapping(value = "/editAddr.htm", method = RequestMethod.POST)
	public ModelAndView editAddr(Address address) {
		int flag = addressService.editAddress(address);
		if (flag != 1) {
			return new ModelAndView("errorpage/500");
		} else {
			return new ModelAndView("redirect:/user/goAllAddr.htm");
		}
	}
	@RequestMapping(value = "/goAddAddr.htm", method = RequestMethod.GET)
	public String goAddAddr(){
		return "user/addAddr";
	}

	@RequestMapping(value = "/addAddr.htm", method = RequestMethod.POST)
	public ModelAndView addAddr(Address address,HttpServletRequest req) {
		User loginUser = (User)req.getSession(true).getAttribute("loginUser");
		address.setUser(loginUser);
		int flag = addressService.addAddress(address);
		if (flag != 1) {
			return new ModelAndView("errorpage/500");
		} else {
			return new ModelAndView("redirect:/user/goAllAddr.htm");
		}
	}
}
