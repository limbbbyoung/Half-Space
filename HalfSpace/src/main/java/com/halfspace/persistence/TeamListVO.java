package com.halfspace.persistence;


import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TeamListVO {
	
	private Long listno;
	private String name;
	private String coach;
	private Date regdate;
	private Long memberCnt;
	
	private List<TeamVO> teamVO;




	
	

}
