package com.xxzd.serviceimpl;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xxzd.service.FileService;
import com.xxzd.vo.ImageVo;
@Service
@PropertySource("classpath:/properties/image.properties")
public class FileServiceImpl implements FileService {
	@Value("${image.localDir}")
	private String localDir = "C:/Users/Hasee/Desktop/kokodayo/dayo/";
	@Value("${image.httpUrl}")
	private String httpUrl = "https://imaged.xxzd.com/";

	
	/**
	 * 实现文件上传思路
	 * 1判断是否为图片类型
	 * 2判断是否为恶意程序
	 * 3图片分目录保存 目录/时间/年/月/日
	 */
	@Override
	public ImageVo upload(MultipartFile imgFile) {
		//获取图片名  判断是否为恶意程序 根据图片属性的宽高 后后缀
		//1获取图片名
		String fileName = imgFile.getOriginalFilename();
		//2.1验证后缀  全小写后验证
		fileName = fileName.toLowerCase();
		if(!fileName.matches("^.+\\.(jpg|png|gif|bmp)$")) {
			return ImageVo.fail();
		}
		//2.2判断是否为恶意程序
		try {
			//从BufferedImage对象里可以获取出这个图片的宽高属性如果有则是图片没有则恶意
			BufferedImage read = ImageIO.read(imgFile.getInputStream());
			int height = read.getHeight();
			int width = read.getWidth();
			if(height==0 || width==0) {
				return ImageVo.fail();
			}
			
			//3分目录存储本地磁盘+日期目录
			String dateDir = new SimpleDateFormat("/yyyy/MM/dd/").format(new Date());
			String folderPath = localDir + dateDir;
			File file = new File(folderPath);
			//判断是否存在不存在则创建
			if(!file.exists()) {
				file.mkdirs();
			}
			//4生成 uuid作为名字  uuid.类型
			UUID uuid = UUID.randomUUID();
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			//拼接路径   磁盘目录+日期目录+uuid.类型
			String newName = localDir + dateDir + uuid + fileType;
			//5输出到本地
			imgFile.transferTo(new File(newName));
			System.out.println("上传成功");
			//客服访问路径   httpurl+dateDir+uuid+fileType
			return new ImageVo(0,"OJBK",httpUrl+dateDir+uuid+fileType);
		} catch (IOException e) {
			e.printStackTrace();
			return ImageVo.fail();
		}
	}


	@Override
	public Map<String, String> tinUpload(MultipartFile file) {
		ImageVo image = upload(file);
		String location = image.getSrc();
		HashMap<String,String> map = new HashMap<>();
		map.put("location",location);
		return map;
	}
	
	
}
