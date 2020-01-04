package com.xxzd.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ExecutionAop {
	
	// .*只能拦截本包  ..* 能拦截子包
	@AfterThrowing(pointcut = "execution(* com.jt.service..*.*(..))",
			throwing = "throwable")//这儿的意思是拦截这个类型的异常 用的是形参的名字所以会去找方法上的参数名 然后获取参数类型 拦截这个类型
	
	//出异常后会传给throwable变量
	//ProceedingJoinPoint 是Around专用
	//除了  环绕通知以外 其他通知必须用  JoinPoint
	public void afterThrow(JoinPoint jp,Throwable throwable) {
		Class<? extends Object> clazz = jp.getTarget().getClass();
		String methodName = jp.getSignature().getName();
		Class<? extends Throwable> throwClass = throwable.getClass();
		String msg = throwable.getMessage();
		System.err.println("异常位置:"+clazz+"."+methodName+"->异常类型:"+throwClass+"->异常信息:"+msg);
	}
}
