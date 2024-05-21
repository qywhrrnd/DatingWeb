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
		session.insert("review.reviewInsert", reviewDto);
		
	}

	@Override
	public List<ReviewDTO> list(String userid) {
		// TODO Auto-generated method stub
		return session.selectList("review.reviewList", userid);
	}

	@Override
	public double avgstar(String userid) {
		return session.selectOne("review.avgstar", userid);
	}
	

}
