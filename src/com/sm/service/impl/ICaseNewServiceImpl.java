package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.CaseNewMapper;
import com.sm.service.ICaseNewService;

@Service
public class ICaseNewServiceImpl implements ICaseNewService {
	
	@Autowired
	private CaseNewMapper caseNewMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return caseNewMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return caseNewMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		caseNewMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		caseNewMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		caseNewMapper.delete(id);
	}

}
