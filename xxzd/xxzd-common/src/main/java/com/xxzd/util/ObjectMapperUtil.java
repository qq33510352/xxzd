package com.xxzd.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ObjectMapperUtil {
	private static final ObjectMapper MAPPER = new ObjectMapper();
	
	//1将对象转json
	//如果程序有异常  转为运行时异常
	public static String toJson(Object obj) {
		String json;
		try {
			json = MAPPER.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);//检查异常转运行时异常
		}
		return json;
	}
	//2将json转对象
	//传什么对象转为什么对象
	public static <T> T toObject(String json,Class<T> clazz) {
		T obj=null;
		try {
			obj = MAPPER.readValue(json, clazz);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return obj;
	}
}
