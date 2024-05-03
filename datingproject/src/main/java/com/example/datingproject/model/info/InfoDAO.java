package com.example.datingproject.model.info;

import java.util.List;

public interface InfoDAO {
	void insertInfo(InfoDTO dto);
	 List<InfoDTO> list(); 
	
}
