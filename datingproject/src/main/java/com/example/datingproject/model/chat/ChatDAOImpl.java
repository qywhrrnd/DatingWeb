package com.example.datingproject.model.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<ChatDTO> loadchat(int roomnumber) {
		return session.selectList("chat.loadchat", roomnumber);
	}

	@Override
	public void savechat(ChatDTO dto) {
		session.insert("chat.savechat", dto);

	}

}
