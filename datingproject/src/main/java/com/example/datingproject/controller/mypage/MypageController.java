package com.example.datingproject.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;
import com.example.datingproject.model.mypage.MypageDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

	@Autowired
	MypageDAO mypageDao;

	@RequestMapping("mypage/mypage.do")
	public ModelAndView mypage(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<MemberDTO> mlist = mypageDao.mypagemember(userid);
		List<InfoDTO> ilist = mypageDao.mypageinfo(userid);
	
		Map<String, Object> map = new HashMap<>();
		map.put("mlist", mlist);
		map.put("ilist", ilist);

		return new ModelAndView("mypage/mypage", "map", map);

	}
}
