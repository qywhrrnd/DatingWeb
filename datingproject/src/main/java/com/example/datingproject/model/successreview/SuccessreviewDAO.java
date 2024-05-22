package com.example.datingproject.model.successreview;

import java.util.List;

public interface SuccessreviewDAO {
	List<SuccessreviewDTO> list();
	
	void writereview(SuccessreviewDTO dto);
}
