package com.example.jshop.service;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.jshop.dto.MemberDTO;
import com.example.jshop.repository.MemberRepository;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



@Service
public class KakaoService {
	@Autowired private MemberRepository repo;
	@Autowired private HttpSession session;
	public String getReturnAccessToken(String code) throws IOException{
		final String HOST = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(HOST);
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		String token = "";
		try {
			urlConnection.setRequestMethod("POST");
			urlConnection.setDoOutput(true); // 데이터 기록 알려주기

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
			System.out.println("start.......");
			System.out.println("code2: "+code);
			String sb = "grant_type=authorization_code" +
					"&client_id=8558b06f798d38a90a338f54282456f2" +
					"&redirect_uri=http://127.0.0.1:8080/kakao_login" +
					"&code=" + code;
			System.out.println("sb: "+sb);

			bw.write(sb);
			bw.flush();

			int responseCode = urlConnection.getResponseCode();
			System.out.println("responseCode = " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("result = " + result);

			// json parsing
			JSONParser parser = new JSONParser();
			JSONObject elem = (JSONObject) parser.parse(result);

			String access_token = elem.get("access_token").toString();
			String refresh_token = elem.get("refresh_token").toString();
			System.out.println("access_token = " + access_token);
			System.out.println("refresh_token = " + refresh_token);

			token = access_token;

			br.close();
			bw.close();
		} catch (IOException | ParseException e) {
			System.out.println("예외발생!!!!!!!!!! : " + e);
		}

		return token;
	}

	public MemberDTO getUserInfo(String access_token) {
		String host = "https://kapi.kakao.com/v2/user/me";
		Map<String, Object> result = new HashMap<>();
		try {
			URL url = new URL(host);

			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
			urlConnection.setRequestMethod("GET");

			int responseCode = urlConnection.getResponseCode();
			System.out.println("responseCode1: " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String res = "";
			while((line = br.readLine()) != null)
				res += line;

			System.out.println("res = " + res);

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(res);
			
			JSONObject properties = (JSONObject) obj.get("properties");

			String user_id = obj.get("id").toString();
			String user_nm = properties.get("nickname").toString();
			
			MemberDTO member = new MemberDTO();
			member.setUser_id(user_id);
			member.setUser_nm(user_nm);
//			result.put("user_id", id);
//			result.put("user_nm", nickname);
			ArrayList<MemberDTO> members = new ArrayList<>();
			members.add(member);
			br.close();
			return member;

		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		return null;
     }
	
	public String kakao_register(MemberDTO member) throws Exception {
		MemberDTO check = repo.findId(member.getUser_id());
		if(check != null) {
			session.setAttribute("user_id", check.getUser_id());
			return "이미 등록";			
		}
		
		if(member.getUser_email() == null || member.getUser_email() == "")	
			return "이메일을 입력하세요";			
		
		if(member.getZip_cd() == null || member.getZip_cd() == "")	
			return "주소를 입력해주세요";
		
		if(member.getAddress_info() == null || member.getAddress_info() == "")	
			return "주소를 입력해주세요";
		
		if(member.getAddress_detail() == null || member.getAddress_detail() == "")	
			return "주소를 입력해주세요";
		
		repo.kakao_register(member);
		return "등록 완료";
	}
}
