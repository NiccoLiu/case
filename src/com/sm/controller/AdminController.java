package com.sm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sm.service.IAdminService;
import com.sm.service.IDoctorService;
import com.sm.service.ISuffererService;
import com.sm.util.Util;

@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminService;
	@Autowired
	IDoctorService doctorService;
	@Autowired
	ISuffererService suffererService;
	
	@RequestMapping("admin/login.do")	
	public ModelAndView insert(String userName,String userPwd,String userRole,HttpServletRequest request){
		ModelAndView mav=new ModelAndView("../login.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		if(userRole.equals("1")){
			map.put("account", userName);
			map.put("pwd", userPwd);
			Integer count = adminService.getAdmin(map);
			if(count>0){
				request.getSession().setAttribute("account", userName);
				mav=new ModelAndView(new RedirectView("./index.jsp"));				
			}else{
				mav.addObject("msg", "用户名和密码错误!");
			}
		}else if(userRole.equals("2")){
			map.put("doc_account", userName);
			map.put("doc_pwd", userPwd);
			Integer count = doctorService.getList(map).size();
			if(count>0){
				request.getSession().setAttribute("account", userName);
				map.put("doc_account", userName);
				request.getSession().setAttribute("doc_id", doctorService.getOne(map).get("id"));
				mav=new ModelAndView(new RedirectView("../doctor/index.jsp"));				
			}else{
				mav.addObject("msg", "用户名和密码错误");
			}
		}else if(userRole.equals("3")){
			map.put("suf_card", userName);
			Integer count = suffererService.getList(map).size();
			if(count>0){
				request.getSession().setAttribute("suf_id", suffererService.getOne(map).get("id"));
				mav=new ModelAndView(new RedirectView("../sufferer/index.jsp"));			
			}else{
				mav.addObject("msg", "用户名和密码错误");
			}
		}
		return mav;
	}
	@RequestMapping("admin/logout.do")	
	public ModelAndView appLogout(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("../login.jsp");
		request.getSession().removeAttribute("account");
		return mav;
	}
	@RequestMapping("admin/pwd.do")	
	public ModelAndView pwd(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./myinfo/pwd.jsp");
		Object account=request.getSession().getAttribute("account");
		mav.addObject("admin", adminService.getAdminMap(account.toString()));
		return mav;
	}
	@RequestMapping("admin/pwdOk.do")
	public ModelAndView pwdOk(String adNewPwd,String adId,HttpServletRequest request){
		ModelAndView mav=new ModelAndView("redirect:/admin/pwd.do");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", adId);
		map.put("admin_pwd", adNewPwd);
		adminService.update(map);
		return mav;
	}
	@RequestMapping("admin/info.do")	
	public ModelAndView info(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./myinfo/info.jsp");
		Object account=request.getSession().getAttribute("account");
		mav.addObject("admin", adminService.getAdminMap(account.toString()));
		return mav;
	}
	@RequestMapping("admin/infoOk.do")
	public ModelAndView infoOk(String id,String admin_name,HttpServletRequest request){
		ModelAndView mav=new ModelAndView("redirect:/admin/info.do");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("admin_name", admin_name);
		adminService.update(map);
		mav.addObject("msg", "");
		return mav;
	}
	
	//--------------------------管理员端功能------------------------------------------
	@RequestMapping("admin/adminAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./admin/add.jsp");
		return mav;
	}
	@RequestMapping("admin/adminAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			   String admin_name,
			   String admin_account,
			   String admin_pwd){
		ModelAndView mav=new ModelAndView("redirect:/admin/adminList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", Util.getPrimaryKey());
		map.put("admin_name", admin_name);
		map.put("admin_account", admin_account);
		map.put("admin_pwd", admin_pwd);
		Map<String,Object> r=adminService.getAdminMap(admin_name);
		if(r==null){
			adminService.insert(map);			
		}
		return mav;
	}
	@RequestMapping("admin/adminUpdate.do")	
	public ModelAndView update(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./admin/update.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		mav.addObject("admin", adminService.getOne(map));
		return mav;
	}
	@RequestMapping("admin/adminUpdateOk.do")	
	public ModelAndView updateOk(HttpServletRequest request,
				   String id,
				   String admin_name,
				   String admin_account,
				   String admin_pwd){
		ModelAndView mav=new ModelAndView("redirect:/admin/adminList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("admin_name", admin_name);
		map.put("admin_account", admin_account);
		map.put("admin_pwd", admin_pwd);
		adminService.update(map);
		return mav;
	}
	@RequestMapping("admin/adminList.do")
	public ModelAndView list(HttpServletRequest request,String admin_account){
		ModelAndView mav=new ModelAndView("./admin/list.jsp");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("admin_account", admin_account);
		mav.addObject("list", adminService.getList(map));
		mav.addObject("admin_account", admin_account);
		return mav;
	}
	@RequestMapping("admin/adminDel.do")	
	public ModelAndView adminDel(HttpServletRequest request,
			   String dep_id){
		ModelAndView mav=new ModelAndView("redirect:/admin/adminList.do");
		adminService.delete(dep_id);
		return mav;
	}
	
}
