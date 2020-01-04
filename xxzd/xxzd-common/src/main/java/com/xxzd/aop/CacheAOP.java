package com.xxzd.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.xxzd.anno.CacheAll;
import com.xxzd.util.ObjectMapperUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.ShardedJedis;

//定义缓存切面
@Component 	//万能注解   交给容器管理
@Aspect		//自定义切面
public class CacheAOP {
	@Autowired(required = false)
    private JedisCluster jedis;
//	private Jedis jedis;
//	private ShardedJedis jedis;
	
	/**
	 * 环绕通知语法
	 * 返回值类型:Object 
	 * 参数说明:必须包含并且位置是第一个
	 * JoinPoint 没有 调用下一个切面方法 或 下一个目标方法的 方法
	 * 所以用ProceedingJoinPoint
	 * 通知标识
	 * 1.@Around("切入点表达式")
	 * 2.@Around("xxx()")
	 * @throws Throwable 
	 */
	@Around("@annotation(cacheAll)")//如果指定了参数中 有指定注解 那这里可以使用注解参数名  然后读取这参数的类型
	public Object around(ProceedingJoinPoint pj,CacheAll cacheAll){
		System.err.println("----->");
		String key = getkey(pj, cacheAll);
		System.out.println(key);
		//首先通过反射算出键 然后获取 
//		String key =classname+methodname+::+参数值
//		String className = pj.getTarget().getClass().getName();
//		
//		String methodName = pj.getSignature().getName();
//		Object[] args = pj.getArgs();
//		Object arg = args[0];
//		//className+methodName+"::"+arg;
//		String key = className+methodName+"::"+arg;
//		System.out.println(key);
		String value = jedis.get(key); 
		Object  obj = new Object();
		//获取后如果没有值 则 执行下一个方法获取 然后存值返回
		//获取类对象
		if(StringUtils.isEmpty(value)) {
			System.out.println("查数据库");
			try {
				obj = pj.proceed();
				String json = ObjectMapperUtil.toJson(obj);
				//然后将obj转json
				if(cacheAll.seconds()>0) {
					jedis.setex(key,cacheAll.seconds(),json);
				}else {
					jedis.set(key,json);
				}
			} catch (Throwable e) {//小异常 不能捕捉大异常
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new RuntimeException(e);
			}//执行下一个方法  虽然现在是父类身份但调用的tostring由于子类重写了用的是子类的
		}else {
			System.out.println("AOP查redis");
			//如果有值则直接转对象并返回
			//关键点怎么转回来? 
			//转为方法 署名  后才能获取返回值
			/**
			 * 如何获取方法的返回值
			 */
//			Class<?> returnType = getReturnType(pj);
			MethodSignature signature = (MethodSignature)pj.getSignature();
			//获取类对象中方法的返回值类型
			obj = ObjectMapperUtil.toObject(value,signature.getReturnType());
		}
		System.err.println("<-----");
		return obj;
	}
//	private Class<?> getReturnType(ProceedingJoinPoint pj) {
//		//1获取方法的类型
//		pj.
//		return null;
//	}
	/**
	 * 获取key的数据
	 * @param pj  包含了方法的所有内容
	 * @param cacheFind
	 * @return 存值取值key
	 */
	private String getkey(ProceedingJoinPoint pj, CacheAll cacheAll) {
		String key = cacheAll.key();
		if(StringUtils.isEmpty(key)) {
			String className = pj.getTarget().getClass().getName();
			String methodName = pj.getSignature().getName();
			Object args = pj.getArgs()[0];
			key = className+"."+methodName+"::"+args;
		}
		return key;
	}
}
