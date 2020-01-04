package com.xxzd.anno;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
//标识当前注解生命周期
@Retention(RetentionPolicy.RUNTIME)
//标识当前注解对方法生效
@Target(ElementType.METHOD)
public @interface CacheAll {
	/**
	 * 注解中配置的内容
	 * 1.简单  用户使用起来简单
	 * 2.实用
	 * 
	 * 要求  key不同的业务一定不能重复
	 *
	 *规则:
	 *key值默认为"'  如果用户添加了key 则使用用户的
	 *如果用户没有添加key
	 *生成策略:报名.类名.方法名::第一个参数
	 *
	 *添加时间:如果不为0  则需要添加数据过期时间
	 */
	String key() default "";
	int seconds() default 0;//默认不过期  过期时间
}
