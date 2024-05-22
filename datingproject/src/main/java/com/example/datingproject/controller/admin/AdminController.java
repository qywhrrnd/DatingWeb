package com.example.datingproject.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.datingproject.model.admin.AdminDAO;
import com.example.datingproject.model.admin.AdminDTO;
import com.example.datingproject.model.admin.PointDTO;
import com.example.datingproject.model.mainreview.MainreviewDAO;
import com.example.datingproject.model.mainreview.MainreviewDTO;
import com.example.datingproject.model.successreview.SuccessreviewDAO;
import com.example.datingproject.model.successreview.SuccessreviewDTO;

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

	@PostMapping("admin/successreview.do")
	public ResponseEntity<Map<String, Object>> successreview() {
		List<SuccessreviewDTO> list = sdao.list();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("admin/writereview.do")
	public ResponseEntity<Map<String, Object>> writereview(HttpServletRequest request,
			@RequestParam(name = "name1") String name1, @RequestParam(name = "name2") String name2,
			@RequestParam(name = "content") String content) {

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
		List<SuccessreviewDTO> list = sdao.list();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);

	}

	@PostMapping("admin/memberinfo.do")
	public ResponseEntity<Map<String, Object>> memberinfo() {
		List<AdminDTO> list = adao.list();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("admin/mainreview.do")
	public ResponseEntity<Map<String, Object>> mainreview() {
		List<MainreviewDTO> list = rdao.list();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("admin/deletemainreview.do")
	public ResponseEntity<Map<String, Object>> deletemainreview(@RequestParam(name = "idx") int idx) {
		adao.deletemainreview(idx);
		List<MainreviewDTO> list = rdao.list();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);
	}

	@PostMapping("admin/sales.do")
	public ResponseEntity<Map<String, Object>> sales() {
		List<PointDTO> list = adao.plist();
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		return ResponseEntity.ok(response);
	}

}