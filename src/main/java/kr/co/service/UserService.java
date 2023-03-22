package kr.co.service;

import javax.servlet.http.HttpSession;
import kr.co.vo.UserVO;

public interface UserService {

	//ȸ������
	public void register(UserVO vo) throws Exception;

	// �α���
	public UserVO login(UserVO vo) throws Exception;
	//���̵� �ߺ�üũ
	public String idCheck(UserVO vo) throws Exception;
	// �α׾ƿ�
	public void signout(HttpSession session) throws Exception;
	// ȸ������ ����
	public void modify(UserVO vo) throws Exception;
	
	public UserVO findId(String u_email)throws Exception;

	public int findIdCheck(String u_email)throws Exception;

	// ȸ�� Ż��
	public void delete(UserVO vo) throws Exception;
	
	
}

