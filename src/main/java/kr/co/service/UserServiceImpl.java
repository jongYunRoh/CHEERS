package kr.co.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.dao.UserDAO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject 
	private UserDAO dao;

	//ȸ������
	@Override
	public void register(UserVO vo) throws Exception {

		dao.register(vo);		
	}
	// �α���
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}
	// ���̵� �ߺ� üũ
	@Override
	public String idCheck(UserVO vo) throws Exception {
		String result = dao.idCheck(vo);
		return result;
	}
	// �α׾ƿ�
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();  // ���� ������ ����
	}

	// ȸ������ ����
	@Override
	public void modify(UserVO vo) throws Exception {

		dao.modify(vo);
	}
	
	@Override
	public UserVO findId(String u_email)throws Exception{
		return dao.findId(u_email);
	}
	
	@Override
	public int findIdCheck(String u_email)throws Exception{
		return dao.findIdCheck(u_email);
	}


	// ȸ�� Żȸ
	@Override
	public void delete(UserVO vo) throws Exception {
		dao.delete(vo);
	}
} 

