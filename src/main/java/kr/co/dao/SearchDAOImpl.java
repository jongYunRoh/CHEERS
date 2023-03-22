package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.StoreVO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	//키워드 검색
	@Override
	public List search(String keyword) throws Exception {
		List list=sqlSession.selectList("search.searchName",keyword);
		return list;
	}

}