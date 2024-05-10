package com.example.datingproject.controller.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.datingproject.model.chat.ChatBoxDAO;
import com.example.datingproject.model.chat.ChatBoxDTO;
import com.example.datingproject.model.chat.ChatDAO;
import com.example.datingproject.model.chat.ChatDTO;
import com.example.datingproject.model.info.InfoDAO;
import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDAO;
import com.example.datingproject.model.point.PointDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {

	@Autowired
	ChatBoxDAO chatboxDao;

	@Autowired
	ChatDAO chatDao;

	@Autowired
	PointDAO pointDao;

	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	InfoDAO infoDao;

	List<ChatBoxDTO> roomList = new ArrayList<ChatBoxDTO>();
	static int roomNumber = 0;

	@RequestMapping("chat/room.do")
	public ModelAndView room(HttpServletRequest request) {

		String url = "";
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");

		List<ChatBoxDTO> list = chatboxDao.chatbox(userid);
		url = "chat/chatbox";
		return new ModelAndView(url, "list", list);
	}

	@RequestMapping("chat/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		String otherid = (String) params.get("otherid");
		String userid = (String) params.get("userid");
		InfoDTO dto = infoDao.detail(otherid);
		InfoDTO medto = infoDao.detail(userid);
		
		mv.addObject("dto", dto);
		mv.addObject("otherid", otherid);
		mv.addObject("medto", medto);
		mv.addObject("roomNumber", params.get("roomNumber"));
		mv.setViewName("chat/chat");

		return mv;
	}

	@RequestMapping("chat/createchatbox.do")
	public ModelAndView chatbox(@RequestParam(name = "userid") String userid,
			@RequestParam(name = "otherid") String otherid) {
		int countlog = chatboxDao.checkchatlog(userid, otherid);
		int count = chatboxDao.chatboxcheck(userid, otherid);
		int point = memberDao.getpoint(userid);

		if (countlog == 0 && count == 0) {
			if (point < 1000) {
				String message = "포인트가 부족합니다. 충전해주세요.";
				return new ModelAndView("point/buypoint", "message", message);
			} else {
				pointDao.chatpoint(userid);
				chatboxDao.craetechatbox(userid, otherid);
				chatboxDao.chatlog(userid, otherid);
				List<ChatBoxDTO> list = chatboxDao.chatbox(userid);
				return new ModelAndView("chat/chatbox", "list", list);
			}
		} else {
			List<ChatBoxDTO> list = chatboxDao.chatbox(userid);
			return new ModelAndView("chat/chatbox", "list", list);

		}

	}

	@ResponseBody
	@RequestMapping("chat/savechat.do")
	public String savechat(@RequestParam(name = "roomnumber") String roomnumber,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "message") String message) {
		int roomnumber2 = Integer.parseInt(roomnumber);
		ChatDTO chat = new ChatDTO();
		chat.setRoomnumber(roomnumber2);
		chat.setUserid(userid);
		chat.setMessage(message);
		chatDao.savechat(chat);
		return "redirect:/chat/moveChating?roomNumber=" + roomnumber2;

	}

	@ResponseBody
	@GetMapping("/chat/loadchat.do")
	public ResponseEntity<List<ChatDTO>> loadchat(@RequestParam(name = "roomnumber") String roomnumber) {
		int roomnumber2 = Integer.parseInt(roomnumber);
		List<ChatDTO> chat = chatDao.loadchat(roomnumber2);

		return new ResponseEntity<>(chat, HttpStatus.OK);
	}

}
