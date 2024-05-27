package com.example.datingproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;
import com.example.datingproject.model.successreview.SuccessreviewDAO;
import com.example.datingproject.model.successreview.SuccessreviewDTO;
import com.example.datingproject.model.visiter.VisiterDAO;
import com.example.datingproject.model.visiter.VisiterDTO;

@Controller
public class MainController {

	@Autowired
	MainreviewDAO mrdao;

	@Autowired
	SuccessreviewDAO sdao;
	
	@Autowired
	VisiterDAO vdao;

	@GetMapping("/")
	public ModelAndView main() {
		VisiterDTO dto = new VisiterDTO();
		vdao.visit(dto);
		List<MainreviewDTO> list = mrdao.list();
		List<SuccessreviewDTO> slist = sdao.list();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("slist", slist);
		return new ModelAndView("main/main", "map", map);
	}

}
