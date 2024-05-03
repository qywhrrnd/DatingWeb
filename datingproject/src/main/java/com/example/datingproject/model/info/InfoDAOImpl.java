package com.example.datingproject.model.info;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO{
	
	@Autowired
	SqlSession session;

	@Override
	public void insertInfo(InfoDTO dto) {
		// TODO Auto-generated method stub
		session.insert("info.insertInfo",dto);
	}

}
