package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.StoreDAO;
import kr.co.util.FileUtils;
import kr.co.vo.EatVO;
import kr.co.vo.Store_infoVO;
import kr.co.vo.UserVO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private StoreDAO dao;
	
	@Override
	public void register(Store_infoVO infoVO, MultipartHttpServletRequest mpRequest,String u_id) throws Exception{
		dao.register(infoVO);
		dao.userSnum(u_id);
		
		List<Map<String,Object>> list=fileUtils.parseInsertFileInfo(infoVO, mpRequest);
		int size=list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	@Override
	public Store_infoVO storeInfo(int s_num) {
		Store_infoVO vo=dao.storeInfo(s_num);
		return vo;
	}//storeInfo()-end

	@Override
	public List<Map<String, Object>> storeImage(int s_num) throws Exception {
		
		return dao.storeImage(s_num);
	}//storeImage()-end

	//키워드 검색
	@Override
	public List search(String keyword) throws Exception {
		return dao.search(keyword);
	}//search()-end

	//가게 이미지 하나 가져오기(지도에서 사용할것)
	@Override
	public List storeImageOne(int s_num) throws Exception {
		return dao.storeImageOne(s_num);
	}//storeImageOne()-end
	
	//가게리스트
	@Override
	public List<Store_infoVO> storeList() throws Exception {
		
		return dao.storeList();
	}

	//잇딜등록,잇딜 파일업로드
	@Override
	public void eatInsert(EatVO eatVO,MultipartHttpServletRequest mpRequest) throws Exception{
		dao.eatInsert(eatVO);
		
		List<Map<String,Object>> list=fileUtils.parseInsertFileInfoEat(eatVO, mpRequest);
		int size=list.size();
		for(int i=0; i<size; i++) {
			dao.insertFileEat(list.get(i));
		}
		
		
	}
	
	//잇딜리스트
	@Override
	public List<EatVO> eatList() throws Exception {
		
		return dao.eatList();
	}
	
	//잇딜 이미지 가져오기
	@Override
	public List<Map<String, Object>> eatImage(int e_num) throws Exception {
		
		return dao.eatImage(e_num);
	}

	@Override
	public UserVO getSnum(String u_id) {
		
		return dao.getSnum(u_id);
	}

	@Override
	public EatVO eatInfo(int e_num) {
		EatVO vo=dao.eatInfo(e_num);
		return vo;
	}
	
	
}
