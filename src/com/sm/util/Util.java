package com.sm.util;

import java.util.UUID;

public class Util {
	
	/**
	 * 获取主键的工具类
	 * @return
	 */
	public static String getPrimaryKey(){
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		return uuid;
	}
}
