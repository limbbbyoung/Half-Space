package com.halfspace.mapper;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.halfspace.persistence.CafeListVO;
import com.halfspace.persistence.MainBoardVO;

public interface CafeListMapper {
	
	// User마다 한개의 카페가 생성 가능하기 때문에 
	// User의 카페 생성 여부 확인을 위한 getList
	// getList를 통해서 DB의 master 컬럼의 데이터를 가져오고 
	// master 컬럼의 데이터가 해당 User와 동일한 id를 가질시 
	// 카페 생성 불가능, 동일한 id가 없을시 카페 생성가능
	public ArrayList<CafeListVO> getList();
	
	// cafelist Insert(카페 목록에 새로운 카페 추가)
	public void insert(CafeListVO vo);
	
	// 카페 생성하기 CREATE
	public void createTable(CafeListVO vo);

}
