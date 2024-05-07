package com.example.datingproject.model.info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO{
	
	@Autowired
	SqlSession session;

	@Override
	public void insertInfo(InfoDTO dto) {
		// TODO Auto-generated method stub
		session.insert("info.insertInfo",dto);
	}

	
	  @Override 
	  public List<InfoDTO> list() { // TODO Auto-generated method stub
	  return session.selectList("info.list"); }


	@Override
	public void follow(String following, String follower) {
		Map<String ,Object>map = new HashMap<>();
		map.put("following", following);
		map.put("follower", follower);
		session.insert("info.follow",map);
		
	}


	@Override
	public int countfollow(String follower) {
		return session.selectOne("info.countfollow",follower);
	}


	@Override
	public int checkfollow(String following, String follower) {
		Map<String ,Object>map = new HashMap<>();
		map.put("following", following);
		map.put("follower", follower);
		return session.selectOne("info.checkfollow",map);
	}


	@Override
	public void cancelfollow(String following, String follower) {
		Map<String ,Object>map = new HashMap<>();
		map.put("following", following);
		map.put("follower", follower);
		session.delete("info.cancelfollow",map);
		
	}
	
	 @Override
	  public InfoDTO detail(String userid) {
		  
		  return session.selectOne("info.detail", userid);
	  }


	@Override
	public List<InfoDTO> followerlist(String follower) {
		return session.selectList("info.followerlist", follower);
	}


	@Override
	public List<InfoDTO> followinglist(String following) {
		return session.selectList("info.followinglist", following);
	}
	
	
	 

}
