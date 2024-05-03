package com.example.datingproject.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@RequestMapping("mypage/mypage.do")
	public String mypage() {

		return "mypage/mypage";

	}
}
