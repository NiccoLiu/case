package com.sm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sm.service.IDoctorService;
import com.sm.service.ISuffererService;
import com.sm.util.Util;

@Controller
public class SuffererController {
	@Autowired
	ISuffererService suffererService;
	@Autowired
	IDoctorService doctorService;
	
	@RequestMapping("doctor/sufferAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./sufferer/add.jsp");
		return mav;
	}
	@RequestMapping("doctor/sufferAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			String suf_name,
			String suf_sex,
			String suf_age,
			String suf_card,
			String suf_address,
			String suf_phone,
			String suf_nation,
			String suf_native,
			String suf_his
			){
			ModelAndView mav=new ModelAndView("redirect:/doctor/sufferAdd.do");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("id", Util.getPrimaryKey());
			map.put("suf_name", suf_name);
			map.put("suf_sex",suf_sex);
			map.put("suf_age",suf_age);
			map.put("doc_id",request.getSession().getAttribute("doc_id"));
			map.put("suf_card",suf_card);
			map.put("suf_address",suf_address);
			map.put("suf_phone",suf_phone);
			map.put("suf_nation",suf_nation);
			map.put("suf_native",suf_native);
			map.put("suf_his",suf_his);
			suffererService.insert(map);
		return mav;
	}
	@RequestMapping("doctor/sufferList.do")
	public ModelAndView suffererList(HttpServletRequest request,String suf_name){
		ModelAndView mav=new ModelAndView("./sufferer/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("suf_name", suf_name);
		mav.addObject("list", suffererService.getList(map));
		mav.addObject("suf_name", suf_name);
		return mav;
	}
	@RequestMapping("doctor/suffererUpdate.do")	
	public ModelAndView suffererUpdate(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./sufferer/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("sufferer", suffererService.getOne(map));
		return mav;
	}
	@RequestMapping("doctor/suffererUpdateOk.do")	
	public ModelAndView suffererUpdateOk(HttpServletRequest request,
				   String id,
				   String suf_name,
				   String suf_sex,
				   String suf_age,
				   String suf_address,
				   String suf_phone,
				   String suf_nation,
				   String suf_native,
				   String suf_his){
		ModelAndView mav=new ModelAndView("redirect:/doctor/sufferList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("suf_name",suf_name);
		map.put("suf_sex",suf_sex);
		map.put("suf_age",suf_age);
		map.put("suf_address",suf_address);
		map.put("suf_phone",suf_phone);
		map.put("suf_nation",suf_nation);
		map.put("suf_native",suf_native);
		map.put("suf_his",suf_his);
		suffererService.update(map);
		return mav;
	}
	@RequestMapping("doctor/suffererDel.do")	
	public ModelAndView dsuffererDel(HttpServletRequest request,
			   String suf_id){
		ModelAndView mav=new ModelAndView("redirect:/doctor/sufferList.do");
		suffererService.delete(suf_id);
		return mav;
	}
	@RequestMapping("admin/suffererUpdate.do")	
	public ModelAndView update(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./sufferer/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("sufferer", suffererService.getOne(map));
		
		List<Map<String,Object>> list=doctorService.getList(new HashMap<String, Object>());
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("admin/suffererUpdateOk.do")	
	public ModelAndView updateOk(HttpServletRequest request,
				   String id,
				   String suf_name,
				   String doc_id,
				   String suf_sex,
				   String suf_age,
				   String suf_card,
				   String suf_address,
				   String suf_phone,
				   String suf_nation,
				   String suf_native,
				   String suf_his){
		ModelAndView mav=new ModelAndView("redirect:/admin/suffererList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("suf_name",suf_name);
		map.put("doc_id",doc_id);
		map.put("suf_sex",suf_sex);
		map.put("suf_age",suf_age);
		map.put("suf_card",suf_card);
		map.put("suf_address",suf_address);
		map.put("suf_phone",suf_phone);
		map.put("suf_nation",suf_nation);
		map.put("suf_native",suf_native);
		map.put("suf_his",suf_his);
		suffererService.update(map);
		return mav;
	}
	@RequestMapping("doctor/checkSufferAccount.do")	
	@ResponseBody
	public String checkDocAccount(HttpServletRequest request,String suf_card){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("suf_card", suf_card);
		List l=suffererService.getList(map);
		if(l.size()>0){
			return "1";
		}else{			
			return "0";
		}
	}
	@RequestMapping("admin/suffererList.do")
	public ModelAndView list(HttpServletRequest request,String suf_name){
		ModelAndView mav=new ModelAndView("./sufferer/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("suf_name", suf_name);
		mav.addObject("list", suffererService.getList(map));
		mav.addObject("suf_name", suf_name);
		return mav;
	}
	@RequestMapping("admin/suffererDel.do")	
	public ModelAndView suffererDel(HttpServletRequest request,
			   String suf_id){
		ModelAndView mav=new ModelAndView("redirect:/admin/suffererList.do");
		suffererService.delete(suf_id);
		return mav;
	}
	//----------------------------------患者端------------------
	@RequestMapping("sufferer/info.do")	
	public ModelAndView info(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./myinfo/info.jsp");
		Object suf_id=request.getSession().getAttribute("suf_id");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", suf_id);
		mav.addObject("sufferer", suffererService.getOne(map));
		return mav;
	}
}
