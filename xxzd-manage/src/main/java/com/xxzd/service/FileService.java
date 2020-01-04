package com.xxzd.service;

import org.springframework.web.multipart.MultipartFile;

import com.xxzd.vo.ImageVo;

public interface FileService {

	ImageVo upload(MultipartFile imgFile);
	
}
