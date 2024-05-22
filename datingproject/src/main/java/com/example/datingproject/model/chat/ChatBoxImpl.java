package com.example.datingproject.model.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatBoxImpl implements ChatBoxDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<ChatBoxDTO> chatbox(String userid) {
		return session.selectList("chat.chatbox", userid);
	}

	@Override
	public void craetechatbox(String userid, String otherid) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("otherid", otherid);
		session.insert("chat.createchatbox", map);

	}

	@Override
	public int chatboxcheck(String userid, String otherid) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("otherid", otherid);
		return session.selectOne("chat.chatboxcheck", map);
	}

	@Override
	public int checkchatlog(String userid, String otherid) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("otherid", otherid);
		return session.selectOne("chat.checkchatlog", map);
	}

	@Override
	public void chatlog(String userid, String otherid) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("otherid", otherid);
		session.insert("chat.chatlog", map);

	}

	@Override
	public String searchname(int roomnumber) {
		return session.selectOne("chat.searchname", roomnumber);
	}

	@Override
	public String searchname2(int roomnumber) {
		return session.selectOne("chat.searchname2", roomnumber);
	}

	@Override
	public int totalmatching() {
		return session.selectOne("chat.totalmatching");
	}

}
