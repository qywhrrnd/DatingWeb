package com.example.datingproject.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.email.EmailCheckDto;
import com.example.datingproject.model.email.MailSendService;
import com.example.datingproject.model.member.MemberDAO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDao;

	@Autowired
	MailSendService mail;

	@RequestMapping("member/pagelogin.do")
	public String pagelogin() {
		return "login/login";
	}

	@RequestMapping("member/emailcheck.do")
	public ResponseEntity<Map<String, String>> emailcheck(@RequestParam(name = "email") String userid) {
		int count = memberDao.useridcheck(userid);
		String message = "";
		if (count == 1) {
			message = "이미 있는 아이디입니다.";
		} else if (count == 0) {
			message = "메일이 발송되었습니다.인증번호를 입력해주세요";
			mail.joinEmail(userid);

		}
		Map<String, String> response = new HashMap<>();
		response.put("message", message);
		return ResponseEntity.ok(response);
	}

	@RequestMapping("member/verifyCode.do")
	public ResponseEntity<Map<String, String>> numcheck(@RequestParam(name = "code") String code) {
		EmailCheckDto check = new EmailCheckDto();
		Boolean checked = mail.CheckAuthNum(check.getEmail(), code);
		String message = "";
		if (checked) {
			message = "ok";
		} else {
			message = "틀렸습니다.";
		}
		Map<String, String> response = new HashMap<>();
		response.put("message", message);
		return ResponseEntity.ok(response);

	}

	@RequestMapping("member/join.do")
	public String join(@RequestParam(name = "email") String userid, @RequestParam(name = "passwd") String passwd) {
		memberDao.join(userid, passwd);
		return "login/login";
	}

}
