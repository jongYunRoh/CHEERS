package kr.co.service;

public interface KakaoLoginService {
	//카카오 로그인
	public String getAccessToken (String authorize_code) throws Exception;
}
