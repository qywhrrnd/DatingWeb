package com.example.datingproject.model.review;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

@Component
public class ReviewDTO {
	
	private int idx;
	private String userid;
	private String reviewer;
	private String review;
	private Date regiDate;
	private double star;
	
	public ReviewDTO() {
		this.regiDate = new Date(); // 생성자에서 현재 날짜와 시간을 설정
	}
	
	public Date getRegiDate() {
		return regiDate;
	}
	

}
