package com.xxzd.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration   //代表了web.xml  
public class MvcConfigurer implements WebMvcConfigurer{
	
	//开启匹配后缀型配置   默认只拦截前缀 比如  index.xxx  只拦截了index
	@Override
	public void configurePathMatch(PathMatchConfigurer configurer) {
		//由于这里没有指定后缀所以其实无所谓的
		configurer.setUseSuffixPatternMatch(true);
	}
	
//	@Autowired
//	private UserInterceptor userInterceptor;
//	//添加拦截器
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {//  /cart/* 代表cart之后的一级目录 2个*代表多级目录
//		registry.addInterceptor(userInterceptor).addPathPatterns("/cart/**","/order/**");
//	}
	
}
