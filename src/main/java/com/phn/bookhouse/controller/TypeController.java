/**
 * 
 */
package com.phn.bookhouse.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phn.bookhouse.entity.Type;
import com.phn.bookhouse.service.TypeService;


/**
 * @file TypeController.java
 * @author pan
 * @date 2014年11月12日
 * @email panhainan@yeah.net
 */
@Controller
@RequestMapping(value = "/booktype")
public class TypeController {
	@Autowired
	private TypeService typeService;
	@RequestMapping(value = "/goAllBookType.htm")
	public String goAllBookType(HttpServletRequest req) {
		int typefatherid = -1;
		List<Type> listftype = typeService.findFatherType(typefatherid);
		req.setAttribute("listftype", listftype);
		return "admin/allBookType";
	}
	@RequestMapping(value = "/goAddBookType.htm")
	public String goAddBookType(HttpServletRequest req) {
		int typefatherid = -1;
		List<Type> listftype = typeService.findFatherType(typefatherid);
		req.setAttribute("listftype", listftype);
		return "admin/addBookType";
	}
	@RequestMapping(value = "/addBookType.htm")
	public ModelAndView addBookType(Type type) {
		//System.out.println(type);
		int flag = typeService.addType(type);
		if(flag==1){
			return new ModelAndView("redirect:/admin/goHome.htm");
		}
		return new ModelAndView("redirect:./goAddBookType.htm");
	}
	@RequestMapping(value = "/findType.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> findType(HttpServletRequest req,HttpServletResponse response,@RequestParam(value = "typefatherid")String typefatherid) {
		//System.out.println("-----------------------:"+typefatherid);
		int  fatherid = Integer.parseInt(typefatherid);
		List<Type> listType = typeService.findTypeByFatherId(fatherid);
		Map<String,Object> map = new HashMap<String,Object>();  
	    map.put("listType", listType);
	    return map;
	}
	@RequestMapping(value = "/goEditType.htm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> goEditType(@RequestParam(value = "typeid")int typeid){
		Type ttype = typeService.findTypeById(typeid);
		System.out.println(ttype);
		Map<String,Object> map = new HashMap<String,Object>();  
	    map.put("type", ttype);
		return map;
	}
	@RequestMapping(value = "/editType.htm")
	public ModelAndView editType(Type type) {
		System.out.println(type);
		int flag = typeService.editType(type);
		if(flag!=1){
			return new ModelAndView("redirect:/admin/goHome.htm");
		}
		return new ModelAndView("redirect:./goAllBookType.htm");
	}
	
}
