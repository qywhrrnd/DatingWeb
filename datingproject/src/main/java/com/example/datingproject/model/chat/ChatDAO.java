package com.example.datingproject.model.chat;

import java.util.List;

public interface ChatDAO {
	List<ChatDTO> loadchat(int roomnumber);

	void savechat(ChatDTO dto);
}
