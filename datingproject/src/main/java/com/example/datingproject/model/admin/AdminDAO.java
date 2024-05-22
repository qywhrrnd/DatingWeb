package com.example.datingproject.model.admin;

import java.util.List;

public interface AdminDAO {
	List<AdminDTO> list();
	
	List<PointDTO> plist();
	
	void deletemainreview(int idx);
	
	int totalpoint();
}
