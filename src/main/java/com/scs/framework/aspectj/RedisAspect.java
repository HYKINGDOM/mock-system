package com.scs.framework.aspectj;

import com.scs.framework.aspectj.lang.annotation.RedisCleanUpAnnotation;
import com.scs.framework.redis.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;


/**
 * 用于删除redis缓存的切面应用
 * @author Administrator
 */
@Order(100)
@Slf4j
@Aspect
@Component
public class RedisAspect {


    @Autowired
    private RedisUtil redisUtil;

    /**
     * 切点是注解的方式
     */
    @Pointcut("@annotation(com.scs.framework.aspectj.lang.annotation.RedisCleanUpAnnotation)")
    public void operationRedisKeyData() {

    }

    /**
     * 进入方法前执行
     * @param joinPoint
     */
    @Before("operationRedisKeyData()")
    public void doBeforeAdvice(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        RedisCleanUpAnnotation annotation = signature.getMethod().getAnnotation(RedisCleanUpAnnotation.class);
        String redisKey = annotation.redisKey();
        redisUtil.del(redisKey);
        log.info("===Before删除:{}====",redisKey);
    }

    /**
     * 方法执行结束后之后
     */
    @After("operationRedisKeyData()")
    public void after(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        RedisCleanUpAnnotation annotation = signature.getMethod().getAnnotation(RedisCleanUpAnnotation.class);
        String redisKey = annotation.redisKey();
        redisUtil.del(redisKey);
        log.info("===After删除:{}====",redisKey);
    }

}
