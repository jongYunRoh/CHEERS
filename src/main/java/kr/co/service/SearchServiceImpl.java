package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.SearchDAO;
import kr.co.vo.StoreVO;
@Service
public class SearchServiceImpl implements SearchService{

	@Inject
	private SearchDAO dao;
	
	//키워드 검색
	@Override
	public List search(String keyword) throws Exception {
		return dao.search(keyword);
	}//search()-end

}
