package com.sm.service;

import java.util.List;
import java.util.Map;

public interface IAdminService {
	public Integer getAdmin(Map<String,Object> map);
	
	public Integer getSuper(Map<String,Object> map);
	
	public Integer getTeacher(Map<String,Object> map);
	
	public Integer getStudent(Map<String,Object> map);
	
	
	public Map<String,Object> getAdminMap(String account);
	
	public List<Map<String,Object>> getList(Map<String,Object> map);
	
	public Map<String,Object> getOne(Map<String,Object> map);
	
	public void insert(Map<String,Object> map);
	
	public void update(Map<String,Object> map);
	
	public void delete(String id);
	
}
