package com.sm.mapper;

import java.util.List;
import java.util.Map;

public interface CaseLogMapper {
	
	public List<Map<String,Object>> getList(Map<String,Object> param);
	
	public void insert(Map<String,Object> param);
	
}
