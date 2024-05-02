package com.example.datingproject.controller.member;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.email.MailSendService;
import com.example.datingproject.model.email.RedisUtil;
import com.example.datingproject.model.info.infoDTO;
import com.example.datingproject.model.member.MemberDAO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDao;

	@Autowired
	infoDTO infoDto;

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
			if (info == 1) {
				session.setAttribute("userid", userid);
				message = "개인정보를 입력해주세요";
				url = "login/information";

			} else if (info == 2) {
				session.setAttribute("userid", userid);
				message = "환영합니다.";
				url = "main/main";
			}
		}
		return new ModelAndView(url, "message", message);

	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		mav.setViewName("login/login");
		mav.addObject("message", "logout");
		return mav;
	}

	@PostMapping("member/imageUpload.do")
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

	public static List<String> executePythonScript(String scriptPath) throws IOException, InterruptedException {
		List<String> output = new ArrayList<>();
		// Python 스크립트 실행 명령어
		String[] cmd = { "python", scriptPath };
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

	@RequestMapping("member/facescore.do")
	public ResponseEntity<Map<String, String>> facescore(@RequestParam(name = "file") String file) {
		String prediction = "";
		String pythonScriptPath = "C:/work/product/main.py";
		try {
			// Python 스크립트 실행
			List<String> scriptOutput = executePythonScript(pythonScriptPath);
			// 출력 내용 표시
			for (String line : scriptOutput) {
				// 예측 값(Prediction)만 따로 추출하여 출력
				if (line.startsWith("Prediction:")) {
					prediction = line.substring("Prediction:".length()).trim();
					System.out.println("점수는: " + prediction + "점");
				}
			}
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		Map<String, String> response = new HashMap<>();
		response.put("prediction", prediction);
		return ResponseEntity.ok(response);

	}

	@PostMapping("/member/movefile.do")
    public ResponseEntity<String> moveFile(@RequestParam("file") MultipartFile file) {
        try {
            // 파일을 저장할 경로 설정
            String uploadPath = "C:/Users/user/git/repository5/datingproject/src/main/webapp/resources/faceimg/";
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

}
