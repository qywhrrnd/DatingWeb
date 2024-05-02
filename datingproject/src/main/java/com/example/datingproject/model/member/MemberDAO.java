package com.example.datingproject.model.member;

public interface MemberDAO {
	int useridcheck(String userid);
	
	void join(String userid, String passwd);
}
