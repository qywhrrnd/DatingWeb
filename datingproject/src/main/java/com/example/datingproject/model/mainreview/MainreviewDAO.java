package com.example.datingproject.model.mainreview;

import java.util.List;

public interface MainreviewDAO {
	void writemainreview(MainreviewDTO dto);

	List<MainreviewDTO> list();
}
