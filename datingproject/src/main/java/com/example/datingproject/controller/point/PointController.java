package com.example.datingproject.controller.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.member.MemberDAO;
import com.example.datingproject.model.point.PointDAO;
import com.example.datingproject.model.point.PointlogDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class PointController {

	@Autowired
	PointDAO pdaoDao;
	@Autowired
	MemberDAO memberDao;

	@RequestMapping("point/buypoint.do")
	public String pagebuypoint() {
		return "point/buypoint";
	}

	@RequestMapping("point/point.do")
	public String point(@RequestParam(name = "userid") String userid, @RequestParam(name = "point") int point,
			HttpSession session) {
		pdaoDao.point(userid, point);
		int point2 = memberDao.getpoint(userid);
		session.setAttribute("point", point2);
		PointlogDTO dto = new PointlogDTO();
		dto.setUserid(userid);
		dto.setPoint(point);
		pdaoDao.pointlog(dto);
		return "redirect:/mypage/mypage.do";

	}

}
