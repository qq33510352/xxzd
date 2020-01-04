package com.xxzd.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.xxzd.vo.ImageVo;

public interface FileService {

	ImageVo upload(MultipartFile imgFile);

	Map<String, String> tinUpload(MultipartFile file);
	
}
