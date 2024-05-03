package com.example.datingproject.model.info;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

@Component
public class InfoDTO {

	private String name;
	private int age;
	private String email;
	private String cellphone;
	private String address;
	private double height;
	private double weight;
	private String MBTI;
	private int smoking;
	private String hobby;
	private String style;
	private String education;
	private String religion;
	private String job;
	private MultipartFile file;
	private double AIface;
	private int gender;
	private String description;
	
	
	
}
