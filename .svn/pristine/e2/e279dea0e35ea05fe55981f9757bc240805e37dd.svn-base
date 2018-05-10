package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.CaseLogMapper;
import com.sm.service.ICaseLogService;
@Service
public class ICaseLogServiceImpl implements ICaseLogService {

	@Autowired
	private CaseLogMapper caseLogMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		return caseLogMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return caseLogMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		caseLogMapper.insert(param);

	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

}
