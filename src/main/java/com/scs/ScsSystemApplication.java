package com.scs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author yihur
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class ScsSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(ScsSystemApplication.class, args);
        System.out.println("==========================启动成功=============================\n");
    }
}
