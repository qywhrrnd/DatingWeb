package com.example.datingproject.model.mainreview;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainreviewDAOImpl implements MainreviewDAO {

	@Autowired
	SqlSession session;

	@Override
	public void writemainreview(MainreviewDTO dto) {
		session.insert("mainreview.writemainreview", dto);
	}

}
