package com.example.datingproject.controller.info;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.info.FollowDTO;
import com.example.datingproject.model.info.InfoDAO;
import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDAO;
import com.example.datingproject.model.member.MemberDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@Controller
public class InfoController {

	@Autowired
	InfoDAO infoDao;
	@Autowired
	InfoDTO infoDto;
	@Autowired
	MemberDAO mDao;

	@PostMapping("info/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "upload") MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		ServletContext application = request.getSession().getServletContext();
		String uploadPath = application.getRealPath("/resources/images/");
		out = new FileOutputStream(new File(uploadPath + fileName));
		out.write(bytes);
		printWriter = response.getWriter();
		String fileUrl = request.getContextPath() + "/resources/images/" + fileName;
		printWriter.println("{\"filename\"  :  \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
		printWriter.flush();
	}

	public static List<String> executePythonScript(String scriptPath, String file)
			throws IOException, InterruptedException {
		List<String> output = new ArrayList<>();
		// Python 스크립트 실행 명령어
		String[] cmd = { "python", scriptPath, file };
		// 프로세스 실행
		Process process = Runtime.getRuntime().exec(cmd);
		// 프로세스 출력을 읽어옴
		InputStream stdout = process.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(stdout));
		String line;
		// 출력을 리스트에 저장
		while ((line = reader.readLine()) != null) {
			output.add(line);
		}
		// 프로세스가 완료될 때까지 대기
		process.waitFor();
		return output;
	}

	@RequestMapping("info/facescore.do")
	public ResponseEntity<Map<String, Double>> facescore(@RequestParam(name = "file") String file) {
		System.out.println(file);
		String prediction = "";
		double prediction1 = 0.00;
		String pythonScriptPath = "C:/work/product/main3.py";
		// 이미지 파일 경로
		try {
			// Python 스크립트 실행
			List<String> scriptOutput = executePythonScript(pythonScriptPath, file);
			// 출력 내용 표시
			for (String line : scriptOutput) {
				if (line.startsWith("Prediction:")) {
					prediction = line.substring("Prediction:".length()).trim();
					System.out.println(prediction);
				}
			}
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		try {
			prediction1 = Double.parseDouble(prediction);
			System.out.println(prediction1);
		} catch (NumberFormatException e) {
			System.out.println("유효하지 않은 double 형식입니다.");
		}

		Map<String, Double> response = new HashMap<>();
		response.put("prediction", prediction1);
		return ResponseEntity.ok(response);

	}

	@PostMapping("info/movefile.do")
	public ResponseEntity<String> moveFile(@RequestParam("file") MultipartFile file) {
		try {
			// 파일을 저장할 경로 설정
			String uploadPath = "C:/dating/img/";
			// 파일 이름 추출
			String fileName = file.getOriginalFilename();
			// 지정된 경로에 파일 저장
			file.transferTo(new File(uploadPath + fileName));
			// 저장된 파일 경로 반환
			String fileUrl = uploadPath + fileName;
			return ResponseEntity.ok().body(fileUrl);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 이동 중 오류가 발생했습니다.");
		}
	}

	@PostMapping("info/insertInfo.do")
	public String insertInfo(HttpServletRequest request, @RequestParam(name = "name") String name,
			@RequestParam(name = "age") int age, @RequestParam(name = "gender") int gender,
			@RequestParam(name = "height") double height, @RequestParam(name = "weight") double weight,
			@RequestParam(name = "cellphone") String cellphone, @RequestParam(name = "address1") String address1,
			@RequestParam(name = "address2") String address2, @RequestParam(name = "MBTI") String MBTI,
			@RequestParam(name = "smoking") int smoking, @RequestParam(name = "hobby") String hobby,
			@RequestParam(name = "style") String style, @RequestParam(name = "education") String education,
			@RequestParam(name = "religion") String religion, @RequestParam(name = "job") String job,
			@RequestParam(name = "AIface") double AIface, @RequestParam(name = "description") String description,
			@RequestParam(name = "userid") String userid) {

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
		String address = address1 + address2;
		InfoDTO dto = new InfoDTO();
		dto.setUserid(userid);
		dto.setName(name);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setHeight(height);
		dto.setWeight(weight);
		dto.setCellphone(cellphone);
		dto.setAddress(address);
		dto.setMBTI(MBTI);
		dto.setSmoking(smoking);
		dto.setHobby(hobby);
		dto.setStyle(style);
		dto.setEducation(education);
		dto.setReligion(religion);
		dto.setJob(job);
		dto.setFilename(filename);
		dto.setAIface(AIface);
		dto.setDescription(description);
		infoDao.insertInfo(dto);
		mDao.infoupdate(userid);

		return "main/main";
	}

	@RequestMapping("/info.do")
	public ModelAndView list() {
		List<InfoDTO> list = infoDao.list();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("idao", infoDao);
		return new ModelAndView("info/info", "map", map);
	}

	@RequestMapping("/follow.do")
	public String follow(@RequestParam(name = "following") String following,
			@RequestParam(name = "follower") String follower) {
		System.out.println(following);
		System.out.println(follower);
		infoDao.follow(following, follower);

		return "redirect:/info.do";
	}

	@RequestMapping("/checkfollow.do")
	public ModelAndView checkfollow(@RequestParam(name = "following") String following,
			@RequestParam(name = "follower") String follower) {
		int check = infoDao.checkfollow(following, follower);

		List<InfoDTO> list = infoDao.list();
		Map<String, Object> map = new HashMap<>();
		map.put("check", check);
		map.put("list", list);
		map.put("idao", infoDao);

		return new ModelAndView("info/info", "map", map);
	}

	@RequestMapping("/cancelfollow.do")
	public String cancelfollow(@RequestParam(name = "following") String following,
			@RequestParam(name = "follower") String follower) {

		infoDao.cancelfollow(following, follower);

		return "redirect:/info.do";
	}

	
	@RequestMapping("/info/followerlist.do")
	public ModelAndView followerlist(@RequestParam(name = "follower") String follower) {
		List<String> list2 = infoDao.followerlist(follower);

		List<InfoDTO> list = new ArrayList<>();

		for (String a : list2) {
			List<InfoDTO> sublist = infoDao.followlist(a);
			list.addAll(sublist);
			System.out.println(list);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("idao", infoDao);		
		return new ModelAndView("mypage/follower", "map", map);
	}

	@RequestMapping("/info/followinglist.do")
	public ModelAndView followinglist(@RequestParam(name = "following") String following) {
		List<String> list2 = infoDao.followinglist(following);
		List<InfoDTO> list = new ArrayList<>();

		for (String a : list2) {
			List<InfoDTO> sublist = infoDao.followlist(a);
			list.addAll(sublist);
			System.out.println(list);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("idao", infoDao);
		return new ModelAndView("mypage/follower", "map", map);
	}
	
	
	@GetMapping("/detail.do")
	public ModelAndView detail(@RequestParam(name = "userid") String userid,@RequestParam(name = "otherid") String otherid,  ModelAndView mav) {
		System.out.println(userid);
		System.out.println(otherid);
		
		
		
		mav.setViewName("info/detail");
		mav.addObject("dto", infoDao.detail(userid));
		return mav;
	}


}