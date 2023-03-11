package com.example.jshop.aop;

import java.util.UUID;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LogTraceAop {

	@Around("execution(* com.example.jshop..*(..))")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		long start = System.currentTimeMillis();
		UUID uuid = UUID.randomUUID();
		String traceID = uuid.toString().substring(0, 8);
		String tmp = joinPoint.toString();
		String[] join = tmp.split("[.]");
		log.info("[{}] START --> {}.{}", traceID, join[4], join[5]);
		try {
			return joinPoint.proceed();
		} finally {
			long finish = System.currentTimeMillis();
			long timeMs = finish - start;
			log.info("[{}] END <-- {}.{} {}ms", traceID, join[4], join[5], timeMs);
		}
	}
}