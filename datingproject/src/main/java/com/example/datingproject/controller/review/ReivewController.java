package com.example.datingproject.controller.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.review.ReviewDAO;
import com.example.datingproject.model.review.ReviewDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReivewController {
	@Autowired
	ReviewDTO reviewDto;
	@Autowired
	ReviewDAO reviewDao;

	@PostMapping("/reviewwrite.do")
	public ModelAndView reviewwrite(@RequestParam(name = "userid") String userid,
			@RequestParam(name = "otherid") String otherid, @RequestParam(name = "name") String name,
			@RequestParam(name = "reviewContent") String reviewContent) {
				return null;

	}

}
