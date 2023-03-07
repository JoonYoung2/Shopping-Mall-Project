package com.example.jshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.jshop.dto.LoginLoggerDTO;
import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
@Slf4j
public class MemberService {
	@Autowired
	private MemberRepository repo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

	public String register(MemberDTO member, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		log.info("Request url -> {}", request.getRequestURI());
		log.info("params -> {}", member);
		String msg = "";
		try {
			MemberDTO check = repo.findId(member.getUser_id());
			if (check != null) {
				msg = "동일한 아이디가 존재합니다.";

				return msg;
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if (bindingResult.hasErrors()) {
			msg = "아이디는 필수 입니다.";
			if(member.getUser_id() == null || member.getUser_id().equals("")) {
				log.warn("Id esential..");
				return msg;
			}
			msg = "비밀번호는 필수 입니다.";
			if (member.getUser_pw() == null || member.getUser_pw().equals("")) {
				log.warn("Password esential..");
				return msg;
			}
			msg = "이름은 필수 입니다.";
			if(member.getUser_nm() == null || member.getUser_nm().equals("")) {
				log.warn("Name esential..");
				return msg;
			}
			msg = "이메일은 필수 입니다.";
			if(member.getUser_email() == null || member.getUser_email().equals("")) {
				log.warn("Email esential..");
				return msg;
			}
			msg = "휴대폰번호는 필수 입니다.";
			if(member.getUser_phoneNum() == null || member.getUser_phoneNum().equals("")) {
				log.warn("PhoneNum esential..");
				return msg;
			}
			msg = "우편번호는 필수 입니다.";
			if(member.getZip_cd() == null || member.getZip_cd().equals("")) {
				log.warn("우편번호 esential..");
				return msg;
			}
			log.warn("Password esential..");
			msg = "아이디 또는 비밀번호 또는 이메일이 형식에 올바르지 않습니다.";

			return msg;
		}

		if (member.getUser_pw().equals(member.getUser_pw_check())) {
			String rawPassword = member.getUser_pw();
			member.setUser_pw(passwordEncoder.encode(rawPassword));
			repo.register(member);
			return "등록 완료";
		}
		return "비밀번호가 일치하지 않습니다.";
	}

	public void loginLogger(MemberDTO member) {
		LoginLoggerDTO logger = new LoginLoggerDTO();

		String ip = null;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		logger.setUser_id(member.getUser_id());
		logger.setLoginType(member.getLoginType());
		logger.setUser_ip(ip);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String login_time = sdf.format(cal.getTime());
		logger.setLogin_time(login_time);
		logger.setLogout_time("0");

		session.setAttribute("login_time", login_time);

		System.out.println("login_time ===> " + session.getAttribute("login_time"));

		try {
			repo.loginLogger(logger);
		} catch (Exception e) {
			log.error("Logger Error ---> {}", e);
		}
	}

	public void logoutLogger(LoginLoggerDTO logger) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String logout_time = sdf.format(cal.getTime());
		logger.setLogout_time(logout_time);
		try {
			repo.loginLogger(logger);
		} catch (Exception e) {
			log.error("Logger Error ---> {}", e);
		}
	}

	public String infoDelete(MemberDTO member, String sessionId) {
		try {
			MemberDTO check = repo.findId(sessionId);

			if (check.getUser_id().equals(member.getUser_id())
					&& passwordEncoder.matches(member.getUser_pw(), check.getUser_pw())) {
				repo.infoDelete(member.getUser_id());
				repo.tmpDelete(member.getUser_id());
				repo.creditDelete(member.getUser_id());
				return "삭제 완료";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "아이디 또는 비밀번호가 일치하지 않습니다.";

	}
}