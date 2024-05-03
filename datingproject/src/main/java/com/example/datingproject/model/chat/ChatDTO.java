package com.example.datingproject.model.chat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ChatDTO {
	private int idx;
	private int roomnumber;
	private String userid;
	private String message;
}
