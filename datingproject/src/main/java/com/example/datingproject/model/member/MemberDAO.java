package com.example.datingproject.model.member;

public interface MemberDAO {
	int useridcheck(String userid);
	
	void join(String userid, String passwd);
	
	int login(String userid, String passwd);
	
	String login2(String userid, String passwd);
}
