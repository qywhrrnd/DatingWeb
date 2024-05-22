package com.example.datingproject.model.successreview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SuccessreviewDAOImpl implements SuccessreviewDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<SuccessreviewDTO> list() {
		return session.selectList("admin.successreview");
	}

	@Override
	public void writereview(SuccessreviewDTO dto) {
		session.insert("admin.writesuccessreview", dto);

	}

}
