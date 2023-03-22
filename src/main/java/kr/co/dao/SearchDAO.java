package kr.co.dao;

import java.util.List;

import kr.co.vo.StoreVO;

public interface SearchDAO {
	
	//키워드 검색
	public List search(String keyword) throws Exception;
}