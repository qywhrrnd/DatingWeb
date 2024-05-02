package com.example.datingproject.model.email;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailCheckDto {

	private String email;

	private String authNum;

}