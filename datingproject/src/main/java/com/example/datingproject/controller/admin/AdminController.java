package com.example.datingproject.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.datingproject.model.admin.AdminDAO;
import com.example.datingproject.model.admin.AdminDTO;
import com.example.datingproject.model.successreview.SuccessreviewDAO;
import com.example.datingproject.model.successreview.SuccessreviewDTO;

@Controller
public class AdminController {

	@Autowired
	SuccessreviewDAO sdao;
	
	@Autowired
	AdminDAO adao;
	

	@PostMapping("admin/successreview.do")
	public ResponseEntity<Map<String, Object>> successreview() {
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
	
}
