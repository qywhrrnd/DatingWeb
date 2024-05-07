package com.example.datingproject.model.mypage;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;

public interface MypageDAO {
	MemberDTO mypagemember(String userid);

	InfoDTO mypageinfo(String userid);
	
	String checkpasswd(String userid);
	
	void updaetinfo(InfoDTO dto);
	
	void updatepasswd(String userid, String passwd);
}
