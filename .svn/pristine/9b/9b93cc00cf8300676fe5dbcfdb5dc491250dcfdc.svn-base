package com.sm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sm.service.IDepartmentService;
import com.sm.util.Util;

@Controller
public class DepartmentController {
	@Autowired
	IDepartmentService departmentService;
	
	
	@RequestMapping("admin/departmentAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./department/add.jsp");
		return mav;
	}
	@RequestMapping("admin/departmentAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			   String dep_name,
			   String dep_remark){
		ModelAndView mav=new ModelAndView("redirect:/admin/departmentAdd.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", Util.getPrimaryKey());
		map.put("dep_name", dep_name);
		map.put("dep_remark", dep_remark);
		departmentService.insert(map);
		return mav;
	}
	@RequestMapping("admin/departmentUpdate.do")	
	public ModelAndView update(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./department/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("department", departmentService.getOne(map));
		return mav;
	}
	@RequestMapping("admin/departmentUpdateOk.do")	
	public ModelAndView updateOk(HttpServletRequest request,
				String id,
			   String dep_name,
			   String dep_remark){
		ModelAndView mav=new ModelAndView("redirect:/admin/departmentList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("dep_name", dep_name);
		map.put("dep_remark", dep_remark);
		departmentService.update(map);
		return mav;
	}
	@RequestMapping("admin/departmentList.do")
	public ModelAndView list(HttpServletRequest request,String dep_name){
		ModelAndView mav=new ModelAndView("./department/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("dep_name", dep_name);
		mav.addObject("list", departmentService.getList(map));
		mav.addObject("dep_name", dep_name);
		return mav;
	}
	@RequestMapping("admin/departmentDel.do")	
	public ModelAndView departmentDel(HttpServletRequest request,
			   String dep_id){
		ModelAndView mav=new ModelAndView("redirect:/admin/departmentList.do");
		departmentService.delete(dep_id);
		return mav;
	}
}
