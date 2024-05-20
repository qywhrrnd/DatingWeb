package com.example.datingproject.controller.mainreview;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainreviewController {

	@Autowired
	MainreviewDAO dao;

	@Autowired
	private HttpServletRequest request;

	private String redirectToPreviousPage() {
		String referer = request.getHeader("Referer");
		if (referer != null && !referer.isEmpty()) {
			return "redirect:" + referer;
		} else {
			// 이전 페이지가 없으면 기본 페이지로 리디렉션
			return "redirect:/";
		}
	}

	@RequestMapping("mainreview/writemainreview.do")
	public String writemainreview(@RequestParam HashMap<Object, Object> params) {
		String userid = (String) params.get("userid");
		String name = (String) params.get("name");
		String content = (String) params.get("content");
		MainreviewDTO dto = new MainreviewDTO();
		dto.setContent(content);
		dto.setName(name);
		dto.setUserid(userid);
		dao.writemainreview(dto);
		return redirectToPreviousPage();

	}
}
