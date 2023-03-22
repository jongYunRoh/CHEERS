package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.ReplyVO;

public interface ReplyService {

	//´ñ±Û Á¶È¸
	public List<ReplyVO> readReply(int b_num) throws Exception;
	
	//´ñ±Û ÀÛ¼º
	public void writeReply(ReplyVO vo,MultipartHttpServletRequest mpRequest) throws Exception;
	
	//´ñ±Û ¼öÁ¤
	public void updateReply(ReplyVO vo) throws Exception;
	
	//´ñ±Û »èÁ¦
	public void deleteReply(ReplyVO vo) throws Exception;
	
	//¼±ÅÃµÈ ´ñ±Û Á¶È¸
	public ReplyVO selectReply(int r_num) throws Exception;
	
	//´ñ±Û ÀÌ¹ÌÁö Á¶È¸
	public List<Map<String, Object>> replyImage(int r_num) throws Exception;
	
	public Double setRating(int s_num) throws Exception;
}
