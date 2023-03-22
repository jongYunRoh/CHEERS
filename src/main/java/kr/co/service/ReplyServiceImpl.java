package kr.co.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.ReplyDAO;
import kr.co.dao.StoreDAO;
import kr.co.util.FileUtils;
import kr.co.vo.ReplyVO;
import kr.co.vo.UpdateReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int s_num) throws Exception {
		return dao.readReply(s_num);
	}

	@Override
	public void writeReply(ReplyVO vo,MultipartHttpServletRequest mpRequest) throws Exception {
		dao.writeReply(vo);
		
		List<Map<String,Object>> list=fileUtils.parseInsertFileInfo2(vo, mpRequest);
		int size=list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	@Override
	public ReplyVO selectReply(int r_num) throws Exception {
		return dao.selectReply(r_num);
	}

	@Override
	public List<Map<String, Object>> replyImage(int r_num) throws Exception {
		return dao.replyImage(r_num);
	}
	
	public Double setRating(int s_num) {
	
	Double ratingAvg = dao.getRatingAverage(s_num);	
	
	if(ratingAvg == null) {
		ratingAvg = 0.0;
	}	
	
	ratingAvg = (double) (Math.round(ratingAvg*10));
	ratingAvg = ratingAvg / 10;
	
	UpdateReplyDTO urd = new UpdateReplyDTO();
	urd.setS_num(s_num);
	urd.setRatingAvg(ratingAvg);	
	
	dao.updateRating(urd);		
	return ratingAvg;
	}

	
	
}
