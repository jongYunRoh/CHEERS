package kr.co.dao;

import kr.co.vo.UserVO;

public interface UserDAO {
	// 회원가입
	public void register(UserVO vo) throws Exception;


	// 로그인
	public UserVO login(UserVO vo) throws Exception;

	// 아이디 중복체크
	public String idCheck(UserVO vo) throws Exception;
	//회원 정보 수정
	public void modify(UserVO vo) throws Exception;
	
	public UserVO findId(String u_email)throws Exception;
	
	public int findIdCheck(String u_email)throws Exception;

	// 회원 탈퇴
	public void delete(UserVO vo) throws Exception;
}


