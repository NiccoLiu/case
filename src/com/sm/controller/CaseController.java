package com.sm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sm.service.ICaseNewService;
import com.sm.service.ICaseService;
import com.sm.service.IDepartmentService;
import com.sm.service.IDiseaseService;
import com.sm.service.ISuffererService;
import com.sm.util.Util;

@Controller
public class CaseController {
	@Autowired
	ICaseService caseService;
	@Autowired
	IDiseaseService diseaseService;
	@Autowired
	ISuffererService suffererService;
	@Autowired
	IDepartmentService departmentService;
	@Autowired
	ICaseNewService caseNewService;
	//-----------------------------------医生端端------------------------------------
	@RequestMapping("doctor/caseAdd.do")	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("./case/add.jsp");
		//查询疾病类型
		List<Map<String,Object>> dlist=diseaseService.getList(new HashMap<String, Object>());
		//查询患者类型
		List<Map<String,Object>> slist=suffererService.getList(new HashMap<String, Object>());
		//查询科室
		List<Map<String,Object>> plist=departmentService.getList(new HashMap<String, Object>());
		mav.addObject("dlist", dlist);
		mav.addObject("slist", slist);
		mav.addObject("plist", plist);
		return mav;
	}
	@RequestMapping("doctor/caseAddOk.do")	
	public ModelAndView addOk(HttpServletRequest request,
			String hos_no,
			String suf_id,
			String dep_id,
			String des_id,
			String diagnose_sug,
			String process,
			String deal_sug,
			String diagnose_result,
			String hos_data){
		ModelAndView mav=new ModelAndView("redirect:/doctor/caseAdd.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", Util.getPrimaryKey());
		map.put("hos_no", hos_no);
		map.put("suf_id", suf_id);
		map.put("dep_id", dep_id);
		map.put("des_id", des_id);
		map.put("doc_id", request.getSession().getAttribute("doc_id"));
		map.put("diagnose_sug", diagnose_sug);
		map.put("process", process);
		map.put("deal_sug", deal_sug);
		map.put("diagnose_result", diagnose_result);
		map.put("hos_data", hos_data);
		caseService.insert(map);
		return mav;
	}
	@RequestMapping("doctor/caseList.do")	
	public ModelAndView caseList(HttpServletRequest request,
			String suf_name,String doc_name,
			String suf_card,String dep_name
			){
		ModelAndView mav=new ModelAndView("./case/list.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("suf_name", suf_name);
		map.put("doc_name", doc_name);
		map.put("suf_card", suf_card);
		map.put("dep_name", dep_name);
		mav.addObject("list", caseService.getList(map));
		mav.addObject("suf_name", suf_name);
		mav.addObject("doc_name", doc_name);
		mav.addObject("suf_card", suf_card);
		mav.addObject("dep_name", dep_name);
		return mav;
	}
	@RequestMapping("doctor/caseDetail.do")	
	public ModelAndView caseDetail(HttpServletRequest request,String case_id){
		ModelAndView mav=new ModelAndView("./case/detail.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", case_id);
		mav.addObject("case1", caseService.getOne(map));
		return mav;
	}
	@RequestMapping("doctor/caseUpdate.do")	
	public ModelAndView caseUpdate(HttpServletRequest request,String id){
		ModelAndView mav=new ModelAndView("./case/update.jsp");
		//查询疾病类型
		List<Map<String,Object>> dlist=diseaseService.getList(new HashMap<String, Object>());
		//查询患者类型
		List<Map<String,Object>> slist=suffererService.getList(new HashMap<String, Object>());
		//查询科室
		List<Map<String,Object>> plist=departmentService.getList(new HashMap<String, Object>());
		mav.addObject("dlist", dlist);
		mav.addObject("slist", slist);
		mav.addObject("plist", plist);
		//查询病历信息
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		Map<String,Object> case1=caseService.getOne(map);
		mav.addObject("case1", case1);
		return mav;
	}
	@RequestMapping("doctor/caseUpdateOk.do")	
	public ModelAndView caseUpdateOk(HttpServletRequest request,
			String id,
			String hos_no,
			String dep_id,
			String des_id,
			String diagnose_sug,
			String process,
			String deal_sug,
			String diagnose_result,
			String hos_data){
		ModelAndView mav=new ModelAndView("redirect:/doctor/caseList.do");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("hos_no", hos_no);
		map.put("dep_id", dep_id);
		map.put("des_id", des_id);
		map.put("diagnose_sug", diagnose_sug);
		map.put("process", process);
		map.put("deal_sug", deal_sug);
		map.put("diagnose_result", diagnose_result);
		map.put("hos_data", hos_data);
		caseService.update(map);
		Map<String,Object> paramslct=new HashMap<String,Object>();
		paramslct.put("id", id);
		Map<String,Object> case1=caseService.getOne(paramslct);
		//修改后记录到病历记录表
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("id", Util.getPrimaryKey());
		param.put("case_id", case1.get("id"));
		param.put("suf_id", case1.get("suf_id"));
		param.put("doc_id", request.getSession().getAttribute("doc_id"));
		param.put("dep_id", case1.get("dep_id"));
		param.put("tem_id", case1.get("tem_id"));
		param.put("des_id", case1.get("des_id"));
		param.put("hos_no", case1.get("hos_no"));
		param.put("hos_data", case1.get("hos_data"));
		param.put("diagnose_sug", case1.get("diagnose_sug"));
		param.put("process", case1.get("process"));
		param.put("deal_sug", case1.get("deal_sug"));
		param.put("diagnose_result", case1.get("diagnose_result"));
		param.put("create_time", case1.get("create_time"));
		caseNewService.insert(param);
		return mav;
	}
	@RequestMapping("doctor/recaseList.do")	
	public ModelAndView recaseList(HttpServletRequest request,
			String suf_name,String doc_name,
			String suf_card,String dep_name,
			String case_id
			){
		ModelAndView mav=new ModelAndView("./case/relist.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("suf_name", suf_name);
		map.put("doc_name", doc_name);
		map.put("case_id", case_id);
		map.put("suf_card", suf_card);
		map.put("dep_name", dep_name);
		mav.addObject("list", caseNewService.getList(map));
		mav.addObject("suf_name", suf_name);
		mav.addObject("doc_name", doc_name);
		mav.addObject("suf_card", suf_card);
		mav.addObject("dep_name", dep_name);
		return mav;
	}
	//-----------------------------------系统管理员端------------------------------------
	@RequestMapping("admin/caseList.do")	
	public ModelAndView list(HttpServletRequest request,
			String suf_name,String doc_name,
			String suf_card,String dep_name
			){
		ModelAndView mav=new ModelAndView("./case/list.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("suf_name", suf_name);
		map.put("doc_name", doc_name);
		map.put("suf_card", suf_card);
		map.put("dep_name", dep_name);
		mav.addObject("list", caseService.getList(map));
		mav.addObject("suf_name", suf_name);
		mav.addObject("doc_name", doc_name);
		mav.addObject("suf_card", suf_card);
		mav.addObject("dep_name", dep_name);
		return mav;
	}
	@RequestMapping("admin/caseDetail.do")	
	public ModelAndView detail(HttpServletRequest request,String case_id){
		ModelAndView mav=new ModelAndView("./case/detail.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", case_id);
		mav.addObject("case1", caseService.getOne(map));
		return mav;
	}
	@RequestMapping("admin/caseLogs.do")	
	public ModelAndView caseLogs(HttpServletRequest request,String case_id){
		ModelAndView mav=new ModelAndView("./case/detail.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("case_id", case_id);
		mav.addObject("case", caseService.getOne(map));
		return mav;
	}
	//-----------------------------------患者端------------------------------------
	@RequestMapping("sufferer/scaseList.do")	
	public ModelAndView scaseList(HttpServletRequest request,
			String doc_name,
			String dep_name
			){
		ModelAndView mav=new ModelAndView("./case/list.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("doc_name", doc_name);
		map.put("suf_id", request.getSession().getAttribute("suf_id"));
		map.put("dep_name", dep_name);
		mav.addObject("list", caseService.getList(map));
		mav.addObject("doc_name", doc_name);
		mav.addObject("dep_name", dep_name);
		return mav;
	}
	@RequestMapping("sufferer/scaseDetail.do")	
	public ModelAndView scaseDetail(HttpServletRequest request,String case_id){
		ModelAndView mav=new ModelAndView("./case/detail.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", case_id);
		mav.addObject("case1", caseService.getOne(map));
		return mav;
	}
	@RequestMapping("sufferer/srecaseList.do")	
	public ModelAndView recaseList(HttpServletRequest request,
			String doc_name,
			String dep_name,
			String case_id
			){
		ModelAndView mav=new ModelAndView("./case/relist.jsp");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("doc_name", doc_name);
		map.put("case_id", case_id);
		map.put("dep_name", dep_name);
		mav.addObject("list", caseNewService.getList(map));
		mav.addObject("doc_name", doc_name);
		mav.addObject("dep_name", dep_name);
		return mav;
	}
}
