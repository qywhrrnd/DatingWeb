package com.example.datingproject.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.member.MemberDAO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDao;

	@GetMapping("member/pagelogin.do")
	public String pagelogin() {
		return "login/login";
	}

	@PostMapping("member/emailcheck.do")
	public ResponseEntity<Map<String, String>> emailcheck(@RequestParam(name = "email") String userid) {
		int count = memberDao.useridcheck(userid);
		System.out.println(count);
		String message = "";
		if (count == 1) {
			message = "이미 있는 아이디입니다.";
		} else if (count == 0) {
			message = "메일이 발송되었습니다.인증번호를 입력해주세요";
		}
		
		
		Map<String, String> response = new HashMap<>();
		response.put("message", message);

		return ResponseEntity.ok(response);
	}
}
