package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.DepartmentMapper;
import com.sm.service.IDepartmentService;
@Service
public class IDepartmentServiceImpl implements IDepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return departmentMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return departmentMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		departmentMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		departmentMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		departmentMapper.delete(id);
	}

}
