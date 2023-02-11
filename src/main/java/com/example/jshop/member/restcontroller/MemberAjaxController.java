package com.example.jshop.member.restcontroller;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.jshop.repository.MemberRepository;
import com.example.jshop.dto.MemberDTO;

import java.util.HashMap;

@RestController
@Slf4j
@RequestMapping("/rest-api")
public class MemberAjaxController {

    @Autowired
    private MemberRepository repository;

    @PostMapping("/member/id")
    public Object checkIDDuplicate(@RequestParam String user_id ) {

        log.info("get : {}", user_id );

        if(user_id == null || user_id.equals(""))
            return 100;

        String result = "";
        MemberDTO memberDTO = new MemberDTO();
        try{
           memberDTO = repository.findId(user_id);

        }catch (Exception e){
            log.error("error -> {}", e);
        }
        if( memberDTO.getUser_id() == null || memberDTO.getUser_id().equals("")) {
            /* 사용 가능 아이디*/
            log.info("duplicated id");
            return 200;
        }

        return 500;
    }
}
