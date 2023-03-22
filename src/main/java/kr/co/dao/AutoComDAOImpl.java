package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.AutoComVO;
import kr.co.vo.BoardVO;

@Repository
public class AutoComDAOImpl implements AutoComDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 추천 검색어 조회
	@Override
	public List<AutoComVO> list() throws Exception {
		
		return sqlSession.selectList("keyword.autocomplete");

	}
	
	// 인기 검색어 조회
	@Override
	public List<AutoComVO> list2() throws Exception {
		return sqlSession.selectList("keyword.autocomplete_pop");
	}

}