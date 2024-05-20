package com.example.datingproject.controller.review;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.info.InfoDAO;
import com.example.datingproject.model.review.ReviewDAO;
import com.example.datingproject.model.review.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReivewController {
	@Autowired
	ReviewDTO reviewDto;
	@Autowired
	ReviewDAO reviewDao;
	@Autowired
	InfoDAO infoDao;
	
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

	@PostMapping("review/reviewwrite.do")
	public String reviewwrite(@RequestParam HashMap<Object, Object> params) {
		String otherida = (String) params.get("otherid");
		String userida = (String) params.get("userid");
		String review = (String) params.get("reviewContent");
		String starStr = (String) params.get("star");
		double star = Double.parseDouble(starStr); // String을 double로 변환
		System.out.println(otherida);
		System.out.println(userida);
		System.out.println(review);
		System.out.println(star);

		String userid = infoDao.getname(userida);
		String reviewer = infoDao.getname(otherida);

		reviewDto.setUserid(userid);
		reviewDto.setReviewer(reviewer);
		reviewDto.setReview(review);
		reviewDto.setStar(star);

		reviewDao.reviewWrite(reviewDto);

		return redirectToPreviousPage();

	}

}
