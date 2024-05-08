package com.example.datingproject.model.point;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO {

	@Autowired
	SqlSession session;

	@Override
	public void point(String userid, int point) {
		Map<String,Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("point", point);
		
		session.update("member.point", map);

	}

	@Override
	public void chatpoint(String userid) {
		session.update("member.chatpoint", userid);

	}

}
