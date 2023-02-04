package com.example.jshop.sample.controller;

import com.example.jshop.sample.dto.UserInfo;
import com.example.jshop.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

@RestController
@Slf4j
public class SampleController {
    @Resource(name = "sampleSvc")
    private SampleService service;

    @RequestMapping("/sample")
    public Object index(HttpServletRequest request) {
        log.info("GET request url -> {}", request.getRequestURI());

        List<UserInfo> result = null;

        try{
            result = service.getUserInfos();

        } catch (Exception e){
            log.info("SQL Exception Occur -> {}", e);
            return "Error";
        }

        if( result == null || result.isEmpty() ) {
            log.info("result -> Null..!!");
            return "Null";
        }

        log.info("User's info -> {}", result.toString());
        return result;
    }
}
