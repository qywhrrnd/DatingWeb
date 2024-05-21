package com.example.datingproject.model.point;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class PointlogDTO {
	private String userid;
	private int point;
	private Date day;

	public PointlogDTO() {
		this.day = new Date(); // 생성자에서 현재 날짜와 시간을 설정
	}

	public Date getDay() {
		return day;
	}
}
