package com.example.datingproject.model.visiter;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class VisiterDTO {
	private int idx;
	private Date day;
	
	public VisiterDTO() {
		this.day = new Date();
	}
	
	public Date getDay() {
		return day;
	}
	
	
	
}
