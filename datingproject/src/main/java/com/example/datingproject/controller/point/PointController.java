package com.example.datingproject.controller.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.point.PointDAO;

@Controller
public class PointController {

	@Autowired
	PointDAO pdaoDao;
	
	@RequestMapping("point/buypoint.do")
	public String pagebuypoint() {
		return "point/buypoint";
	}

	@RequestMapping("point/point.do")
	public String point(@RequestParam(name="userid") String userid, @RequestParam(name = "point") int point) {
		pdaoDao.point(userid, point);
		
		
		return "mypage/mypage";

	}

}
