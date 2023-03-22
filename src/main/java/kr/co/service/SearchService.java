package kr.co.service;

import java.util.List;

import kr.co.vo.StoreVO;

public interface SearchService {
	
	//키워드 검색
	public List search(String keyword) throws Exception;
}