package com.example.jshop.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;

import java.util.Collections;


@Service("configService")
public class MemberService implements UserDetailsService {
    @Autowired
    private MemberRepository repo;

    public MemberDTO findId(String username) throws Exception {
        return repo.findId(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDTO member = null;
        try {
            member = repo.findId(username);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if(member == null) {
            throw new UsernameNotFoundException(username);
        }
        return User.builder()
                .username(member.getUser_id())
                .password(member.getUser_pw())
                .authorities(Collections.emptyList())
                .build();
    }
}
