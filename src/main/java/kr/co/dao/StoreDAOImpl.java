package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.EatVO;
import kr.co.vo.Store_infoVO;
import kr.co.vo.UserVO;

@Repository
public class StoreDAOImpl implements StoreDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	//매퍼
	private static String namespace="store";
	
	//가게등록
	@Override
	public void register(Store_infoVO infoVO) {
		sqlSession.insert("store.register",infoVO);
	}

	//파일업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("store.insertFile",map);
		
	}
	
	//키워드에 해당하는 맛집리스트
	@Override
	public void foodList(String keyword) {
		// TODO Auto-generated method stub
		
	}
	
	//가게 정보 조회
	@Override
	public Store_infoVO storeInfo(int s_num) {
		Store_infoVO vo=sqlSession.selectOne("store.storeInfo", s_num);
		return vo;
	}//storeInfo()-end

	//가게 이미지 조회
	@Override
	public List<Map<String, Object>> storeImage(int s_num) throws Exception {
		return sqlSession.selectList("store.storeImage",s_num);
	}
	
	//키워드 검색
	@Override
	public List search(String keyword) throws Exception {
		List list=sqlSession.selectList("store.searchName",keyword);
		return list;
	}//searchInfo()-end

	//가게 이미지 하나 가져오기(지도에서 사용할것)
	@Override
	public List storeImageOne(int s_num) throws Exception {
		return sqlSession.selectOne("store.imageOne",s_num);
	}
	
	//가게리스트
	@Override
	public List<Store_infoVO> storeList() throws Exception {
		
		return sqlSession.selectList("store.storeList");
	}

	//잇딜등록
	@Override
	public void eatInsert(EatVO eatVO) {
		sqlSession.insert("store.eatInsert", eatVO);
		
	}
	//잇딜 파일업로드
	@Override
	public void insertFileEat(Map<String, Object> map) throws Exception {
		sqlSession.insert("store.insertFileEat",map);
		
	}
	
	//잇딜리스트
	@Override
	public List<EatVO> eatList() throws Exception {
		
		return sqlSession.selectList("store.eatList");
	}

	@Override
	public List<Map<String, Object>> eatImage(int e_num) throws Exception {
		return sqlSession.selectList("store.storeImageEat",e_num);
	}
	
	//유저에 s_num 등록
	@Override
	public void userSnum(String u_id) {
		sqlSession.update("store.userSnum",u_id);
	}
	
	//u_id에 해당하는 s_num
	@Override
	public UserVO getSnum(String u_id) {
		return sqlSession.selectOne("store.getSnum",u_id);
		
	}
	
	//클릭시 잇딜정보 띄우기
	@Override
	public EatVO eatInfo(int e_num) {
		EatVO vo=sqlSession.selectOne("store.eatInfo", e_num);
		return vo;
	}
	

}