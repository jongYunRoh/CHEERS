package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.dao.ReplyDAO;
import kr.co.vo.ReplyVO;
import kr.co.vo.UpdateReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject SqlSession sql;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int s_num) throws Exception {
		return sql.selectList("replyMapper.readReply", s_num);
	}//readReply()-end
	
	//댓글 쓰기
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert("replyMapper.writeReply", vo);
	}//writeReply()-end
	
	//파일업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sql.insert("replyMapper.insertFile",map);
		
	}
	
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply", vo);
	}

	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int r_num) throws Exception {
		return sql.selectOne("replyMapper.selectReply", r_num);
	}

	@Override
	public List<Map<String, Object>> replyImage(int r_num) throws Exception {
		return sql.selectList("replyMapper.replyImage",r_num);
	}
	
	@Override
	public Double getRatingAverage(int s_num) {
		return sql.selectOne("replyMapper.getRatingAverage",s_num);
	}

	@Override
	public void updateRating(UpdateReplyDTO dto) {
		sql.update("replyMapper.updateRating", dto);
	}
	

}
