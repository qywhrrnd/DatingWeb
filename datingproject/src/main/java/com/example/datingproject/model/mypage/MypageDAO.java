package com.example.datingproject.model.mypage;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;

public interface MypageDAO {
	MemberDTO mypagemember(String userid);

	InfoDTO mypageinfo(String userid);
	
	String checkpasswd(String userid);
	
	void updateinfo(InfoDTO dto);
	
	void updatepasswd(String userid, String passwd);
	
	void updateimg(String filename, double AIface, String userid);
	
	int countfollowing(String userid);
	
	int countfollower(String userid);
	
	int countchat(String userid);
}
