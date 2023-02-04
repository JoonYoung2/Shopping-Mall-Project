package com.example.jshop.sample.dao;

import com.example.jshop.sample.dto.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface User {
    public List<UserInfo> selectUserInfo() throws Exception;
}
