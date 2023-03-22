package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.AutoComVO;
import kr.co.vo.BoardVO;

public interface AutoComService {
	
	// 추천 검색어 조회
	public List<AutoComVO> list() throws Exception;
	
	// 인기 검색어 조회
	public List<AutoComVO> list2() throws Exception;
	
}