package com.example.datingproject.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.email.MailSendService;
import com.example.datingproject.model.email.RedisUtil;
import com.example.datingproject.model.info.InfoDAO;
import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDao;

	@Autowired
	InfoDAO infoDao;

	@Autowired
	InfoDTO infoDto;

	@Autowired
	MailSendService mail;

	@Autowired
	RedisUtil util;

	@RequestMapping("member/pagelogin.do")
	public String pagelogin() {
		return "login/login";
	}

	@RequestMapping("member/emailcheck.do")
	public ResponseEntity<Map<String, String>> emailcheck(@RequestParam(name = "email") String userid) {
		int count = memberDao.useridcheck(userid);
		String message = "";
		if (count == 1) {
			message = "이미 있는 아이디입니다.";
		} else if (count == 0) {
			message = "메일이 발송되었습니다.인증번호를 입력해주세요";
			mail.joinEmail(userid);

		}
		Map<String, String> response = new HashMap<>();
		response.put("message", message);
		return ResponseEntity.ok(response);
	}

	@RequestMapping("member/verifyCode.do")
	public ResponseEntity<Map<String, String>> numcheck(@RequestParam(name = "email") String email,
			@RequestParam(name = "code") String code) {
		Boolean checked = mail.CheckAuthNum(email, code);
		String message = "";
		if (checked) {
			message = "ok";
			util.deleteData(code);
		} else {
			message = "틀렸습니다.";
		}
		Map<String, String> response = new HashMap<>();
		response.put("message", message);
		return ResponseEntity.ok(response);

	}

	@RequestMapping("member/join.do")
	public String join(@RequestParam(name = "email") String email, @RequestParam(name = "passwd") String passwd) {
		memberDao.join(email, passwd);
		return "redirect:/member/pagelogin.do";
	}

	@RequestMapping("member/login.do")
	public ModelAndView login(@RequestParam(name = "userid") String userid,
			@RequestParam(name = "password") String passwd, HttpSession session) {

		String userid2 = memberDao.login2(userid, passwd);
		String message = "";
		String url = "";
		if (userid2 == null) {
			message = "error";
			url = "login/login";
		} else {
			int info = memberDao.login(userid, passwd);
			int point = memberDao.getpoint(userid);

			if (info == 1) {
				session.setAttribute("point", point);
				session.setAttribute("userid", userid);
				message = "개인정보를 입력해주세요";
				url = "login/information";

			} else if (info == 2) {
				int gender = infoDao.gender(userid);
				session.setAttribute("userid", userid);
				session.setAttribute("point", point);
				session.setAttribute("gender", gender);
				message = "환영합니다.";
				url = "redirect:/";
			} else if (info == 3) {
				session.setAttribute("userid", userid);
				message = "환영합니다.";
				url = "redirect:/adminpage.do";
			}
		}
		return new ModelAndView(url, "message", message);

	}

	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate(); // 세션 초기화
		mav.setViewName("login/login");
		mav.addObject("message", "logout");
		return mav;
	}

	@RequestMapping("member/uplvl.do")
	public ModelAndView uplvl(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		int point = memberDao.getpoint(userid);
		if (point < 1000) {
			String message = "포인트가 부족합니다. 충전해주세요.";
			return new ModelAndView("point/buypoint", "message", message);
		} else {
			int lvl = memberDao.getlvl(userid);
			double Aiface = infoDao.getaiface(userid);
			double b = Aiface + (lvl * 0.1);
			System.out.println(b);
			b = Math.floor(b * 100) / 100.0;
			System.out.println(b);
			if (b > 5.00) {
				String message = "더 이상 올릴수없습니다.";
				String alertScript = "<script>alert('" + message + "');</script>";
				List<InfoDTO> list = infoDao.list(b);
				Map<String, Object> map = new HashMap<>();
				map.put("b", b);
				map.put("Aiface", Aiface);
				map.put("lvl", lvl);
				map.put("list", list);
				map.put("idao", infoDao);
				map.put("alertScript", alertScript);
				return new ModelAndView("info/info", "map", map);
			} else {
				memberDao.uplvl(userid);
				infoDao.updatepoint(userid);
				return new ModelAndView("redirect:/info.do");
			}
		}
	}

}
