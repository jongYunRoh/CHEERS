package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject 
	private SqlSession sql;

	// 매퍼
	private static String namespace = "userMapper";

	//회원가입
	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert(namespace + ".register",vo);

	}
	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne("userMapper.login", vo);
	}
	// 아이디 중복 체크
	@Override
	public String idCheck(UserVO vo) throws Exception {
		String result = sql.selectOne("userMapper.idCheck", vo);
		return result;
	}
	
	@Override
	public UserVO findId(String u_email)throws Exception{
		return sql.selectOne("userMapper.findId", u_email);
	}
	
	@Override
	public int findIdCheck(String u_email)throws Exception{
		return sql.selectOne("userMapper.findIdCheck", u_email);
	}
	
	// 회원정보 수정
	@Override
	public void modify(UserVO vo) throws Exception {
		sql.update(namespace + ".modify",  vo);
	}
	// 회원 탈퇴
	@Override
	public void delete(UserVO vo) throws Exception {
		sql.delete(namespace + ".delete", vo);
	}

}
