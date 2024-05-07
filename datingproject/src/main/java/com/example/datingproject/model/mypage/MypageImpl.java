package com.example.datingproject.model.mypage;

import java.util.HashMap;
import java.util.Map;

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
	public MemberDTO mypagemember(String userid) {
		return session.selectOne("mypage.mypagemember", userid);
	}

	@Override
	public InfoDTO mypageinfo(String userid) {
		return session.selectOne("mypage.mypageinfo", userid);
	}

	@Override
	public String checkpasswd(String userid) {
		// TODO Auto-generated method stub
		return session.selectOne("mypage.checkpasswd", userid);
	}

	@Override
	public void updaetinfo(InfoDTO dto) {
		session.update("mypage.updateinfo", dto);

	}

	@Override
	public void updatepasswd(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		session.update("mypage.updatepasswd", map);

	}

	@Override
	public void updateimg(String filename, double AIface, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("filename", filename);
		map.put("AIface", AIface);
		map.put("userid", userid);
		
		session.update("mypage.updateimg", map);
		
	}

}
