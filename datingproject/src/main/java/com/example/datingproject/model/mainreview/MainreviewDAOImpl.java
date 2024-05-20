package com.example.datingproject.model.mainreview;

import java.util.List;

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

	@Override
	public List<MainreviewDTO> list() {
		return session.selectList("mainreview.mainreviewlist");
	}

}
