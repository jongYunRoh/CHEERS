package kr.co.dao;

import java.util.List;

import kr.co.vo.AutoComVO;
import kr.co.vo.BoardVO;

public interface AutoComDAO {

	// 추천 검색어 조회
	public List<AutoComVO> list() throws Exception;
	
	// 인기 검색어 조회
	public List<AutoComVO> list2() throws Exception;
	
}