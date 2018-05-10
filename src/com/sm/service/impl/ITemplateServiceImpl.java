package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.TemplateMapper;
import com.sm.service.ITemplateService;

@Service
public class ITemplateServiceImpl implements ITemplateService {

	@Autowired
	private TemplateMapper templateMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return templateMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return templateMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		templateMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		templateMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		templateMapper.delete(id);
	}

}
