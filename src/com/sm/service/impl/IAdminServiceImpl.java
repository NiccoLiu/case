package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.AdminMapper;
import com.sm.service.IAdminService;

@Service
public class IAdminServiceImpl implements IAdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Integer getAdmin(Map<String, Object> map) {
		return adminMapper.getAdmin(map);
	}
	
	@Override
	public Integer getSuper(Map<String, Object> map) {
		return 0;//supervisorMapper.getSuper(map);
	}
	@Override
	public Integer getTeacher(Map<String, Object> map) {
		return 0;
	}
	@Override
	public Integer getStudent(Map<String, Object> map) {
		return 0;
	}
	@Override
	public Map<String, Object> getAdminMap(String account) {
		return adminMapper.getAdminMap(account);
	}
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> map) {
		return adminMapper.getList(map);
	}
	@Override
	public Map<String, Object> getOne(Map<String, Object> map) {
		return adminMapper.getList(map).get(0);
	}
	@Override
	public void insert(Map<String, Object> map) {
		adminMapper.insert(map);
	}
	@Override
	public void update(Map<String, Object> map) {
		adminMapper.update(map);
	}
	@Override
	public void delete(String id) {
		adminMapper.delete(id);
	}
}
