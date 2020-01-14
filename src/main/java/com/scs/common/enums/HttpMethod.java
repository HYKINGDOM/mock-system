package com.scs.common.enums;

import java.util.HashMap;
import java.util.Map;

import org.springframework.lang.Nullable;

/**
 * 请求方式
 *
 * @author yihur
 */
public enum HttpMethod {
    /**
     * get请求
     */
    GET,
    /**
     * HEAD请求
     */
    HEAD,
    /**
     * post请求
     */
    POST,
    /**
     * put请求
     */
    PUT,
    /**
     * patch请求
     */
    PATCH,
    /**
     * delete请求
     */
    DELETE,
    /**
     * options请求
     */
    OPTIONS,
    /**
     * trace请求
     */
    TRACE;

    private static final Map<String, HttpMethod> HTTP_METHOD_HASH_MAP = new HashMap<>(16);

    static {
        for (HttpMethod httpMethod : values()) {
            HTTP_METHOD_HASH_MAP.put(httpMethod.name(), httpMethod);
        }
    }

    @Nullable
    public static HttpMethod resolve(@Nullable String method) {
        return (method != null ? HTTP_METHOD_HASH_MAP.get(method) : null);
    }

    public boolean matches(String method) {
        return (this == resolve(method));
    }
}
