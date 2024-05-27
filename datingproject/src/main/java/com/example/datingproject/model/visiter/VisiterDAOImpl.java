package com.example.datingproject.model.visiter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisiterDAOImpl implements VisiterDAO {

	@Autowired
	SqlSession session;

	@Override
	public void visit(VisiterDTO dto) {
		session.insert("visiter.visit", dto);
	}

	@Override
	public int visitcount() {
		return session.selectOne("visiter.visitcount");
	}

}
