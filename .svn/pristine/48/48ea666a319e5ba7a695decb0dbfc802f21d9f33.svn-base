package com.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.mapper.DiseaseMapper;
import com.sm.service.IDiseaseService;
@Service
public class IDiseaseServiceImpl implements IDiseaseService {

	@Autowired
	private DiseaseMapper diseaseMapper;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return diseaseMapper.getList(param);
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return diseaseMapper.getList(param).get(0);
	}

	@Override
	public void insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		diseaseMapper.insert(param);
	}

	@Override
	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		diseaseMapper.update(param);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		diseaseMapper.delete(id);
	}

}
