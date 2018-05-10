package com.sm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sm.service.IDepartmentService;
import com.sm.service.IDoctorService;
import com.sm.util.Util;

@Controller
public class DoctorController {
	@Autowired
	IDoctorService doctorService;
	@Autowired
	IDepartmentService departmentService;
	
	@RequestMapping("doctor/pwd.do")	
	public ModelAndView pwd(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./myinfo/pwd.jsp");
		Object account=request.getSession().getAttribute("account");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("doc_account", account);
		mav.addObject("doctor", doctorService.getOne(map));
		return mav;
	}
	@RequestMapping("doctor/pwdOk.do")
	public ModelAndView pwdOk(String adNewPwd,String adId,HttpServletRequest request){
		ModelAndView mav=new ModelAndView("redirect:/doctor/pwd.do");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", adId);
		map.put("doc_pwd", adNewPwd);
		doctorService.update(map);
		return mav;
	}
	@RequestMapping("doctor/info.do")	
	public ModelAndView info(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./myinfo/info.jsp");
		Object account=request.getSession().getAttribute("doc_id");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", account);
		mav.addObject("doctor", doctorService.getOne(map));
		return mav;
	}
	@RequestMapping("doctor/infoOk.do")
	public ModelAndView infoOk(HttpServletRequest request,
			String id,
			String doc_name,
			String doc_age,
			String doc_sex,
			String doc_title){
		ModelAndView mav=new ModelAndView("redirect:/doctor/info.do");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("doc_name", doc_name);
		map.put("doc_age", doc_age);
		map.put("doc_sex", doc_sex);
		map.put("doc_title", doc_title);
		doctorService.update(map);
		mav.addObject("msg", "");
		return mav;
	}
	@RequestMapping("admin/doctorAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./doctor/add.jsp");
		List<Map<String,Object>> list=departmentService.getList(new HashMap<String, Object>());
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("admin/doctorAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			   String doc_name,
			   String dep_id,
			   String doc_account,
			   String doc_pwd,
			   String doc_age,
			   String doc_title,
			   String doc_sex
			){
			ModelAndView mav=new ModelAndView("redirect:/admin/doctorList.do");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("id", Util.getPrimaryKey());
			map.put("doc_name", doc_name);
			map.put("doc_name",doc_name);
			map.put("depart_id",dep_id);
			map.put("doc_account",doc_account);
			map.put("doc_pwd",doc_pwd);
			map.put("doc_age",doc_age);
			map.put("doc_title",doc_title);
			map.put("doc_sex",doc_sex);
			Map<String,Object> insert=new HashMap<String,Object>();
			insert.put("doc_account",doc_account);
			List r=doctorService.getList(insert);
			if(r.size()<1){
				doctorService.insert(map);				
			}
		return mav;
	}
	@RequestMapping("admin/doctorUpdate.do")	
	public ModelAndView update(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./doctor/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("doctor", doctorService.getOne(map));
		
		List<Map<String,Object>> list=departmentService.getList(new HashMap<String, Object>());
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("admin/doctorUpdateOk.do")	
	public ModelAndView updateOk(HttpServletRequest request,
				   String id,
				   String doc_name,
				   String dep_id,
				   String doc_pwd,
				   String doc_age,
				   String doc_title,
				   String doc_sex){
		ModelAndView mav=new ModelAndView("redirect:/admin/doctorList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("doc_name",doc_name);
		map.put("depart_id",dep_id);
		map.put("doc_pwd",doc_pwd);
		map.put("doc_age",doc_age);
		map.put("doc_title",doc_title);
		map.put("doc_sex",doc_sex);
		doctorService.update(map);
		return mav;
	}
	@RequestMapping("admin/doctorList.do")
	public ModelAndView list(HttpServletRequest request,String doc_name){
		ModelAndView mav=new ModelAndView("./doctor/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("doc_name", doc_name);
		mav.addObject("list", doctorService.getList(map));
		mav.addObject("doc_name", doc_name);
		return mav;
	}
	@RequestMapping("admin/doctorDel.do")	
	public ModelAndView doctorDel(HttpServletRequest request,
			   String doc_id){
		ModelAndView mav=new ModelAndView("redirect:/admin/doctorList.do");
		doctorService.delete(doc_id);
		return mav;
	}
}
