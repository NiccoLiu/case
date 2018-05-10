package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.DoctorMapper;
import com.sm.service.IDoctorService;
@Service
public class IDoctorServiceImpl implements IDoctorService {

	@Autowired
	private DoctorMapper doctorMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return doctorMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return doctorMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		doctorMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		doctorMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		doctorMapper.delete(id);
	}

}
