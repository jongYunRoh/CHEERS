package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.AutoComDAO;
import kr.co.vo.AutoComVO;

@Service
public class AutoComServiceImpl implements AutoComService {
	
	@Inject
	private AutoComDAO dao;
	
	//추천 검색어 조회
	@Override
	public List<AutoComVO> list() throws Exception {
		
		return dao.list();
	}
	
	//인기 검색어 조회
	@Override
	public List<AutoComVO> list2() throws Exception {
		
		return dao.list2();
	}
	
}
