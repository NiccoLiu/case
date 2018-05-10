package com.sm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sm.service.IDiseaseService;
import com.sm.util.Util;

@Controller
public class DiseaseController {
	@Autowired
	IDiseaseService diseaseService;
	
	@RequestMapping("admin/diseaseAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./disease/add.jsp");
		return mav;
	}
	@RequestMapping("admin/diseaseAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			   String des_name,
			   String des_remark){
		ModelAndView mav=new ModelAndView("redirect:/admin/diseaseAdd.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", Util.getPrimaryKey());
		map.put("des_name", des_name);
		map.put("des_remark", des_remark);
		diseaseService.insert(map);
		return mav;
	}
	@RequestMapping("admin/diseaseUpdate.do")	
	public ModelAndView update(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./disease/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("disease", diseaseService.getOne(map));
		return mav;
	}
	@RequestMapping("admin/diseaseUpdateOk.do")	
	public ModelAndView updateOk(HttpServletRequest request,
				String id,
			   String des_name,
			   String des_remark){
		ModelAndView mav=new ModelAndView("redirect:/admin/diseaseList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("des_name", des_name);
		map.put("des_remark", des_remark);
		diseaseService.update(map);
		return mav;
	}
	@RequestMapping("admin/diseaseList.do")
	public ModelAndView list(HttpServletRequest request,String des_name){
		ModelAndView mav=new ModelAndView("./disease/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("des_name", des_name);
		mav.addObject("list", diseaseService.getList(map));
		mav.addObject("des_name", des_name);
		return mav;
	}
	@RequestMapping("admin/diseaseDel.do")	
	public ModelAndView diseaseDel(HttpServletRequest request,
			   String des_id){
		ModelAndView mav=new ModelAndView("redirect:/admin/diseaseList.do");
		diseaseService.delete(des_id);
		return mav;
	}
}
