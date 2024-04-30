package com.example.datingproject.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	@GetMapping("member/pagelogin.do")
	public String pagelogin() {
		return "login/login";
	}
}
