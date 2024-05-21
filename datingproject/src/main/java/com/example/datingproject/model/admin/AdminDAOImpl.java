package com.example.datingproject.model.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<AdminDTO> list() {
		return session.selectList("admin.memberinfo");
	}

}
