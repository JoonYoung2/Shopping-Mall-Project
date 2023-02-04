package com.example.jshop.sample.service;

import com.example.jshop.sample.dao.User;
import com.example.jshop.sample.dto.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("sampleSvc")
public class SampleService {
    @Autowired
    private User mapper;

    public List<UserInfo> getUserInfos() throws Exception{
        return mapper.selectUserInfo();
    }
}
