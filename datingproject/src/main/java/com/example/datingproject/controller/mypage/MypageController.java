package com.example.datingproject.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;
import com.example.datingproject.model.mypage.MypageDAO;
import com.example.datingproject.model.mypage.MypageDTO;
import com.example.datingproject.model.review.ReviewDAO;
import com.example.datingproject.model.review.ReviewDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller
public class MypageController {

	@Autowired
	MypageDAO mypageDao;
	
	@Autowired
	ReviewDAO reviewDao;

	@RequestMapping("mypage/mypage.do")
	public ModelAndView mypage(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		MypageDTO mypageDto = new MypageDTO();
		MemberDTO mlist = mypageDao.mypagemember(userid);
		List<ReviewDTO> rlist = reviewDao.list(userid);
		InfoDTO ilist = mypageDao.mypageinfo(userid);
		int countfollower = mypageDao.countfollower(userid);
		int countfollowing = mypageDao.countfollowing(userid);
		int countchat = mypageDao.countchat(userid);
		double avgstar = reviewDao.avgstar(userid);
		avgstar = Math.floor(avgstar * 10) / 10.0;
		mypageDto.setCountfollower(countfollower);
		mypageDto.setCountfollowing(countfollowing);
		mypageDto.setCountchat(countchat);

		Map<String, Object> map = new HashMap<>();
		map.put("mlist", mlist);
		map.put("ilist", ilist);
		map.put("mdto", mypageDto);
		map.put("avgstar", avgstar);
		map.put("rlist", rlist);

		return new ModelAndView("mypage/mypage", "map", map);

	}

	@PostMapping("mypage/checkpasswd.do")
	public ResponseEntity<String> checkpasswd(@RequestParam(name = "userid") String userid,
			@RequestParam(name = "passwd") String passwd) {
		String response = "";
		String cpasswd = mypageDao.checkpasswd(userid);

		if (cpasswd.equals(passwd)) {
			response = "correct";
		} else {
			response = "wrong";
		}

		return ResponseEntity.ok(response);

	}

	@RequestMapping("mypage/pagesetting.do")
	public ModelAndView pagesetting(@RequestParam(name = "userid") String userid) {
		InfoDTO dto = mypageDao.mypageinfo(userid);

		return new ModelAndView("mypage/setting", "dto", dto);
	}

	@RequestMapping("mypage/updateinfo.do")
	public String updateinfo(@RequestParam(name = "name") String name, @RequestParam(name = "age") int age,
			@RequestParam(name = "height") double height, @RequestParam(name = "weight") double weight,
			@RequestParam(name = "cellphone") String cellphone, @RequestParam(name = "address1") String address1,
			@RequestParam(name = "address2") String address2, @RequestParam(name = "MBTI") String MBTI,
			@RequestParam(name = "hobby") String hobby, @RequestParam(name = "style") String style,
			@RequestParam(name = "education") String education, @RequestParam(name = "religion") String religion,
			@RequestParam(name = "job") String job, @RequestParam(name = "description") String description,
			@RequestParam(name = "userid") String userid) {

		String address = address1 + address2;
		InfoDTO dto = new InfoDTO();
		dto.setUserid(userid);
		dto.setName(name);
		dto.setAge(age);
		dto.setHeight(height);
		dto.setWeight(weight);
		dto.setCellphone(cellphone);
		dto.setAddress(address);
		dto.setMBTI(MBTI);
		dto.setHobby(hobby);
		dto.setStyle(style);
		dto.setEducation(education);
		dto.setReligion(religion);
		dto.setJob(job);
		dto.setDescription(description);
		mypageDao.updateinfo(dto);

		return "redirect:/mypage/mypage.do";
	}

	@GetMapping("mypage/detail_passwd.do")
	public ModelAndView detail_passwd(@RequestParam(name = "userid") String userid) {

		return new ModelAndView("mypage/change_passwd", "userid", userid);
	}

	@PostMapping("mypage/changepasswd.do")
	public ModelAndView findPwd(@RequestParam(name = "userid") String userid,
			@RequestParam(name = "passwd1") String passwd1, @RequestParam(name = "passwd2") String passwd2) {
		String url = "";
		String mypasswd = mypageDao.checkpasswd(userid);
		if (mypasswd.equals(passwd1)) {
			mypageDao.updatepasswd(userid, passwd2);
			url = "mypage/setting";
			String message = "변경되었습니다.";
			String alertScript = "<script>alert('" + message + "');window.close();</script>";
			ModelAndView modelAndView = new ModelAndView(url);
			modelAndView.addObject("alertScript", alertScript);
			return modelAndView;

		} else {
			url = "mypage/change_passwd";
			String message = "기존 비밀번호가 틀렸습니다.";
			String alertScript = "<script>alert('" + message + "');</script>";
			ModelAndView modelAndView = new ModelAndView(url);
			modelAndView.addObject("alertScript", alertScript);
			modelAndView.addObject("userid", userid);
			return modelAndView;
		}

	}
	
	
	@GetMapping("mypage/detailimg.do")
	public ModelAndView detailimg(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		InfoDTO ilist = mypageDao.mypageinfo(userid);
		return new ModelAndView("mypage/change_img", "ilist", ilist);
	}
	
	@RequestMapping("mypage/changeimg.do")
	public String changeimg(HttpSession session, HttpServletRequest request, @RequestParam(name="AIface") double AIface) {
		String userid = (String) session.getAttribute("userid");
		ServletContext application = request.getSession().getServletContext();
		String imgPath = application.getRealPath("/resources/images/");
		String filename = "";
		try {
			boolean fileUploaded = false;

			for (Part part : request.getParts()) {
				filename = part.getSubmittedFileName();

				if (filename != null && !filename.trim().equals("")) {
					part.write(imgPath + filename);
					fileUploaded = true;
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		InfoDTO dto = new InfoDTO();
		dto.setAIface(AIface);
		dto.setFilename(filename);
		mypageDao.updateimg(filename, AIface, userid);
		
		
		return "redirect:/mypage/mypage.do";
	}
	
}
