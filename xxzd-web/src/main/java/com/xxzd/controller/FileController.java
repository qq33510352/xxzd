package com.xxzd.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.xxzd.service.FileService;
import com.xxzd.vo.ImageVo;

@RestController
@RequestMapping("/file/")
public class FileController {
	@Autowired
	private FileService fileService;
	/**
	 * 实现所有图片文件
	 * url:/file/upImg
	 * 参数:ImgFile名称
	 * 结果 Map对象{code:0,msg:"OJBK",data:{src:xxxxx}}
	 * @param imgFiles
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/upImg")
	public ImageVo upImg(MultipartFile file){
		System.out.println("上传了一张图片");
		return fileService.upload(file);
	}
	
	/**
	 * 实现所有图片文件2
	 * url:/file/tinUpImg
	 * 参数:ImgFile名称
	 * 结果 Map对象{code:0,msg:"OJBK",data:{src:xxxxx}}
	 * @param imgFiles
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/tinUpImg")
	public Map<String,String> tinUpImg(MultipartFile file){
		System.out.println("上传了一张图片");
		return fileService.tinUpload(file);
	}
}
