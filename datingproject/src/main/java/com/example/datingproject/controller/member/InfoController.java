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

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class InfoController {
	
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

	   public static List<String> executePythonScript(String scriptPath, String file) throws IOException, InterruptedException {
	        List<String> output = new ArrayList<>();
	        // Python 스크립트 실행 명령어
	        String[] cmd = {"python", scriptPath, file};
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
	public ResponseEntity<Map<String, String>> facescore(@RequestParam(name = "file") String file) {
	System.out.println(file);
		String prediction = "";
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
	    
	

		Map<String, String> response = new HashMap<>();
		response.put("prediction", prediction);
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

}
