package com.xxzd.util;

import java.io.IOException;
import java.util.Map;

import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
@Service
public class HttpClientService {
	@Autowired
	CloseableHttpClient client;
	@Autowired
	RequestConfig requestConfig;
	
	/*
	 * 目的::通过指定的url  获取服务器的数据 String json
	 *参数: 1 url地址
	 *参数: 2用户参数  Map<String,String> params
	 *参数: 3设定字符集编码 charset
	 *
	 *请求方式:
	 *	  无参: http:/manage.jt.com/xxx
	 *	有参:: http:/manage.jt.com/xxx?k=v&k=v&k=v
	 */
	public String doGet(String url,Map<String,String> params,String charset) {
		//判断字符集编码是否有值
		if(StringUtils.isEmpty(charset))charset="UTF-8";
		
		//2.判断是否有参数
		if(params!=null) {
			url+="?";
			for (Map.Entry<String, String> entry: params.entrySet()) {
				String key = entry.getKey();
				String value = entry.getValue();
				url += key + "=" +value+"&";
			}
			url = url.substring(0,url.length()-1);
		}
		//3定义请求类型
		HttpGet httpGet = new HttpGet(url);
		httpGet.setConfig(requestConfig);
		//4发起请求获取结果
		String result = null;
		try {
			CloseableHttpResponse response = client.execute(httpGet);
			if(response.getStatusLine().getStatusCode()==200) {
				result = EntityUtils.toString(response.getEntity(),charset);
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return result;
	}
	
	public String doGet(String url) {
		return doGet(url,null,null);
	}
	
	public String doGet(String url,Map<String,String> params) {
		return doGet(url,params,null);
	}

	public <T> T doGet(String url,Map<String,String> params,String charset,Class<T> clazz) {
		String result = doGet(url, params, charset);
		return ObjectMapperUtil.toObject(result, clazz);
	}
	
	public <T> T doGet(String url,Class<T> clazz) {
		String result = doGet(url, null, null);
		
		return ObjectMapperUtil.toObject(result, clazz);
	}
	
//	public String dodo(String url,Map<String,String> params,String charset) {
//		//验证编码
//		if(StringUtils.isEmpty(charset))charset="utf-8";
//		//验证参数
//		if(params!=null) {
//			//先拼个?
//			url+="?";
//			for (Map.Entry<String,String> entry: params.entrySet()) {
//				url+=entry.getKey()+"="+entry.getValue()+"&";
//			}
//			url = url.substring(0,url.length()-1);
//		}
//		//发送请求
//		//封装请求对象
//		HttpGet get = new HttpGet(url);
//		String result = null;
//		try {
//			CloseableHttpResponse response = client.execute(get);
//			if(response.getStatusLine().getStatusCode()==200) {
//				result=EntityUtils.toString(response.getEntity(),charset);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//		return result;
//	}
	
}
