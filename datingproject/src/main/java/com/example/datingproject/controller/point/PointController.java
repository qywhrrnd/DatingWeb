package com.example.datingproject.controller.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PointController {

	@RequestMapping("point/buypoint.do")
	public String pagebuypoint() {
		return "point/buypoint";
	}

}
