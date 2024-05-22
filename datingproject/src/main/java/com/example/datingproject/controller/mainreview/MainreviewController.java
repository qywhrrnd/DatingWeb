package com.example.datingproject.controller.mainreview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.info.InfoDAO;
import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainreviewController {

	@Autowired
	MainreviewDAO dao;
	
	@Autowired
	InfoDAO idao;

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
	public String writemainreview(@RequestParam(name = "message") String content, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		String name = idao.getname(userid);
		MainreviewDTO dto = new MainreviewDTO();
		dto.setContent(content);
		dto.setName(name);
		dto.setUserid(userid);
		dao.writemainreview(dto);
		return redirectToPreviousPage();
	}
	
}
