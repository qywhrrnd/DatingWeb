package com.example.datingproject.model.mypage;

import java.util.List;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;

public interface MypageDAO {
	List<MemberDTO> mypagemember(String userid);

	List<InfoDTO> mypageinfo(String userid);
}
