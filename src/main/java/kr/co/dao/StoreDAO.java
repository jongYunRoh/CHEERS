package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.EatVO;
import kr.co.vo.Store_infoVO;
import kr.co.vo.UserVO;

public interface StoreDAO {
	
	//가게 등록
	public void register(Store_infoVO infoVO);
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	//키워드에 해당하는 맛집리스트
	public void foodList(String keyword);
	
	//클릭시 가게정보 띄우기
	public Store_infoVO storeInfo(int s_num);
	
	//가게 이미지 조회
	public List<Map<String, Object>> storeImage(int s_num) throws Exception;
	
	//키워드 검색
	public List search(String keyword) throws Exception;
	
	//가게 이미지 하나만 가져오기
	public List storeImageOne(int s_num) throws Exception;
	
	//가게리스트
	public List<Store_infoVO> storeList() throws Exception;
	
	//잇딜등록
	public void eatInsert(EatVO eatVO);
	
	//잇딜 파일업로드
	public void insertFileEat(Map<String, Object> map) throws Exception;
	
	//잇딜리스트
	public List<EatVO> eatList() throws Exception;
	
	//가게 이미지 조회
	public List<Map<String, Object>> eatImage(int e_num) throws Exception;
	
	//유저에 s_num 등록
	public void userSnum(String u_id);
	
	//u_id에 해당하는 s_num
	public UserVO getSnum(String u_id);
	
	//클릭시 잇딜정보 띄우기
	public EatVO eatInfo(int e_num);
}