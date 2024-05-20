package com.example.datingproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;

@Controller
public class MainController {

	@Autowired
	MainreviewDAO mrdao;

	@GetMapping("/")
	public ModelAndView main() {
		List<MainreviewDTO> list = mrdao.list();
		return new ModelAndView("main/main", "list", list);
	}

}
