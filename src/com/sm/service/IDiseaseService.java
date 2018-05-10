package com.sm.service;

import java.util.List;
import java.util.Map;

public interface IDiseaseService {
	
	public List<Map<String,Object>> getList(Map<String,Object> param);

	public Map<String,Object> getOne(Map<String,Object> param);
	
	public void insert(Map<String,Object> param);
	
	public void update(Map<String,Object> param);
	
	public void delete(String id);
}
