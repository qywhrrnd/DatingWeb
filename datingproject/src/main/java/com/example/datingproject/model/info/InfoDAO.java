package com.example.datingproject.model.info;

import java.util.List;

public interface InfoDAO {
	void insertInfo(InfoDTO dto);
	
	 List<InfoDTO> list(); 
	 
	 void follow(String following, String follower);
	 
	 int countfollow(String follower);
	 
	 int checkfollow(String following, String follower);
	 
	 void cancelfollow(String following, String follower);
	 
	 InfoDTO detail(String userid); 
	 
	 List<InfoDTO> followerlist(String follower); 
	 
	 List<InfoDTO> followinglist(String following); 
}
