package com.example.jshop.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class TimeTraceAop {

	@Around("execution(* com.example.jshop..*(..))")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		long start = System.currentTimeMillis();
		String tmp = joinPoint.toString();
		String[] join = tmp.split("[.]");
		log.info("START --> {} {}", join[4], join[5]);
		try {
			return joinPoint.proceed();
		} finally {
			long finish = System.currentTimeMillis();
			long timeMs = finish - start;
			log.info("END --> {} {} {}ms", join[4], join[5], timeMs);
		}
	}
}
