package com.halfspace.persistence;

import lombok.Data;

@Data
public class LeagueVO {

	private Long tno;
	private String name;
	private int won;
	private int draw;
	private int loss;
	private int GF; // 득점 goals for
	private int GA; // 실점 goals against
	private int GD; // 득실차 goal difference
	private int played; // 경기 수
	private int points; // 승점 (승리 시 +3점, 무승부 시 +1점)
	private String round; // 라운드, 매칭명
	private int qualify;

}

/*
CREATE TABLE league_tbl
( 
    tno   number(10,0), 
    name   VARCHAR2(100), 
    won    number(10,0),
    draw number(10,0) ,
    loss number(10,0),
    GF number(10,0),
    GA number(10,0),
    GD number(10,0),
    played number(10,0),
    points number(10,0),
    round VARCHAR2(100)
); 


*/