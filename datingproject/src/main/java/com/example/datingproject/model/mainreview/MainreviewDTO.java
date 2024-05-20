package com.example.datingproject.model.mainreview;

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
public class MainreviewDTO {
	private int idx;
	private String userid;
	private String name;
	private String content;

}
