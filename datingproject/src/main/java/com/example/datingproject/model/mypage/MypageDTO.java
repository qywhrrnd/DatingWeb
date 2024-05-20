package com.example.datingproject.model.mypage;

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
public class MypageDTO {
	private int countfollowing;
	private int countfollower;
	private int countchat;
}
