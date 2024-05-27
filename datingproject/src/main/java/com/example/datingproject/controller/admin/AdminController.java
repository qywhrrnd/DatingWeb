package com.example.datingproject.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.admin.AdminDAO;
import com.example.datingproject.model.admin.AdminDTO;
import com.example.datingproject.model.admin.PointDTO;
import com.example.datingproject.model.chat.ChatBoxDAO;
import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;
import com.example.datingproject.model.member.MemberDAO;
import com.example.datingproject.model.review.ReviewDAO;
import com.example.datingproject.model.review.ReviewDTO;
import com.example.datingproject.model.successreview.SuccessreviewDAO;
import com.example.datingproject.model.successreview.SuccessreviewDTO;
import com.example.datingproject.model.visiter.VisiterDAO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

@Controller
public class AdminController {

	@Autowired
	SuccessreviewDAO sdao;

	@Autowired
	AdminDAO adao;

	@Autowired
	MainreviewDAO rdao;

	@Autowired
	MemberDAO memberDao;

	@Autowired
	ChatBoxDAO cdao;

	@Autowired
	ReviewDAO reviewDao;

	@Autowired
	VisiterDAO vdao;

	@PostMapping("admin/writereview.do")
	public String writereview(HttpServletRequest request, @RequestParam(name = "name1") String name1,
			@RequestParam(name = "name2") String name2, @RequestParam(name = "content") String content) {

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

		SuccessreviewDTO dto = new SuccessreviewDTO();
		dto.setFilename(filename);
		dto.setContent(content);
		dto.setName1(name1);
		dto.setName2(name2);
		sdao.writereview(dto);

		return "redirect:/admin/selectreview.do";

	}

	@RequestMapping("adminpage.do")
	public ModelAndView adminpage() {
		String url = "";
		int totalmember = memberDao.totalmember();
		int totalmatching = cdao.totalmatching();
		int totalpoint = adao.totalpoint();
		int vcount = vdao.visitcount();
		List<PointDTO> list = adao.plist();
		Map<String, Object> map = new HashMap<>();
		map.put("totalmember", totalmember);
		map.put("totalmatching", totalmatching);
		map.put("list", list);
		map.put("totalpoint", totalpoint);
		map.put("vcount", vcount);
		url = "admin/main";
		return new ModelAndView(url, "map", map);
	}

	@RequestMapping("admin/memberinfo.do")
	public ModelAndView memberinfo() {
		String url = "";
		List<AdminDTO> list = adao.list();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		url = "admin/user";
		return new ModelAndView(url, "map", map);
	}

	@RequestMapping("admin/selectreview.do")
	public ModelAndView selectreview() {
		String url = "";
		List<SuccessreviewDTO> list = sdao.list();
		List<MainreviewDTO> list1 = rdao.list();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("list1", list1);
		url = "admin/review";
		return new ModelAndView(url, "map", map);
	}

	@RequestMapping("admin/memberreview.do")
	public ModelAndView memberreview(@RequestParam(name = "userid") String userid) {
		List<ReviewDTO> list = reviewDao.list(userid);
		return new ModelAndView("admin/memberreview", "list", list);
	}

}
