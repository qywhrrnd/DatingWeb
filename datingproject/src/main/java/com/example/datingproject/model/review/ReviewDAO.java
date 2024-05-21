package com.example.datingproject.model.review;

import java.util.List;

public interface ReviewDAO {

	public void reviewWrite(ReviewDTO reviewDto);
	
	List<ReviewDTO> list(String userid);
	
	double avgstar(String userid);
}
