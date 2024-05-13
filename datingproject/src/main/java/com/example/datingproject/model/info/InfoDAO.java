package com.example.datingproject.model.info;

import java.util.List;

public interface InfoDAO {
	void insertInfo(InfoDTO dto);

	List<InfoDTO> list(double b);

	void follow(String following, String follower);

	int countfollow(String follower);

	int checkfollow(String following, String follower);

	void cancelfollow(String following, String follower);

	InfoDTO detail(String userid);

	List<String> followerlist(String follower);

	List<String> followinglist(String following);

	List<InfoDTO> followlist(String userid);

	int viewlog(String userid1, String userid2);

	void insertlog(String userid1, String userid2);

	void updatepoint(String userid);

	int gender(String userid);

	int followercount(String userid);
	
	double getaiface(String userid);
}
