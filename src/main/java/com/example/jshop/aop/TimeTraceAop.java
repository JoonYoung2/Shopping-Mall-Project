package com.example.jshop.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TimeTraceAop {
	
	private static final Logger logger = LoggerFactory.getLogger(TimeTraceAop.class);
	
	@Around("execution(* com.example.jshop..*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		// 실행 시간 체크 : 시작시간
	     long start = System.currentTimeMillis();
	     // 핵심로직으로 이동
	     Object result = joinPoint.proceed();
	     // 클래스 이름
	     String type = joinPoint.getSignature().getDeclaringTypeName();
	     String name = "";
	     if (type.indexOf("Controller") > -1) {
	         name = "Controller:";
	     } else if (type.indexOf("Service") > -1) {
	         name = "Service:";
	     } else if (type.indexOf("Repository") > -1) {
	         name = "Repo:";
	     }
	     // 메서드 이름
	     logger.info(name+type+"."+joinPoint.getSignature().getName()+"()");
	     // 파라미터 이름
	     logger.info(Arrays.toString(joinPoint.getArgs()));
	     // 실행 시간 체크 : 종료시간
	     long end = System.currentTimeMillis();
	     // 실행 시간 체크 : 연산
	     long time = end-start;
	     logger.info("실행 시간:"+time);
	     return result;
	 }
}
