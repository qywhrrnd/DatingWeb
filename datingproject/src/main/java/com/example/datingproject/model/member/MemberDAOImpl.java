package com.example.datingproject.model.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession session;

	@Override
	public int useridcheck(String userid) {
		return session.selectOne("member.useridcheck", userid);
	}

	@Override
	public void join(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);

		session.insert("member.join", map);

	}

	@Override
	public int login(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		return session.selectOne("member.login", map);
	}

	@Override
	public String login2(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		return session.selectOne("member.login2", map);
	}

	@Override
	public void infoupdate(String userid) {
		session.update("member.infoupdate",userid);
		
	}

}
