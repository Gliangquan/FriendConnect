package com.lquan.friendconnect;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.lquan.friendconnect.mapper")
@EnableScheduling
@Slf4j
public class FriendConnectApplication {
    public static void main(String[] args) {
        SpringApplication.run(FriendConnectApplication.class, args);
        log.info("http://localhost:8080/api/doc.html");
    }
}
