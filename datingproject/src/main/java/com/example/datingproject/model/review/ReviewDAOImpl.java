package com.example.datingproject.model.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	
	@Autowired
	SqlSession session;

	@Override
	public void reviewWrite(ReviewDTO reviewDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReviewDTO> list(String userid) {
		// TODO Auto-generated method stub
		return session.selectList("review.list", userid);
	}
	

}
