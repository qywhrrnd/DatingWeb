package com.example.datingproject.model.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.datingproject.model.info.InfoDTO;
import com.example.datingproject.model.member.MemberDTO;

@Repository
public class MypageImpl implements MypageDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<MemberDTO> mypagemember(String userid) {
		return session.selectList("mypage.mypagemember", userid);
	}

	@Override
	public List<InfoDTO> mypageinfo(String userid) {
		return session.selectList("mypage.mypageinfo", userid);
	}

}
