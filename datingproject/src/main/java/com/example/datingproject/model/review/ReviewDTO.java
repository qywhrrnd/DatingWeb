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
	
	private String userid;
	private String name;
	private String reviewContent;
	private Date regiDate;
	private float star;
	

}
