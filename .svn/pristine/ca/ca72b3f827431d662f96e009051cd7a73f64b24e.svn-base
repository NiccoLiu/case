package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.SuffererMapper;
import com.sm.service.ISuffererService;
@Service
public class ISuffererServiceImpl implements ISuffererService {

	@Autowired
	private SuffererMapper suffererMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return suffererMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return suffererMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		suffererMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		suffererMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		suffererMapper.delete(id);
	}

}
