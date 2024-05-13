package com.example.datingproject.model.chat;

import java.util.List;

public interface ChatBoxDAO {
	List<ChatBoxDTO> chatbox(String userid);

	void craetechatbox(String userid, String otherid);

	int chatboxcheck(String userid, String otherid);

	int checkchatlog(String userid, String otherid);

	void chatlog(String userid, String otherid);
	
	String searchname(int roomnumber);
	
	String searchname2(int roomnumber);
}
