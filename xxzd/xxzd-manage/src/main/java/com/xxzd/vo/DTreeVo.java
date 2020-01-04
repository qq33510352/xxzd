package com.xxzd.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DTreeVo {
	private Integer id;
	private String title;
	private String checkArr = "[{\"type\": \"0\", \"checked\": \"0\"}]";
	private Integer parentId;
}
