package com.scs.framework.redis.aspectj;

import java.lang.annotation.*;

/**
 * redis注解
 * 用于当数据增删改的时候删除redis中的缓存注解
 * @author Administrator
 */
@Documented
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface RedisCleanUpAnnotation {


    /**
     * redis的key
     */
    String redisKey() default "";
}
