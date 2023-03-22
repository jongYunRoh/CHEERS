package kr.co.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.ReplyService;
import kr.co.service.StoreService;
import kr.co.vo.EatVO;
import kr.co.vo.ReplyVO;
import kr.co.vo.Store_infoVO;
import kr.co.vo.UserVO;

@RequestMapping("store")
@Controller
public class StoreController {


	@Inject
	StoreService service;

	@Inject
	ReplyService replyService;

	//媛�寃� �벑濡� 酉�
	@RequestMapping("registerForm")
	public String registerForm() {
		return ".main.store.registerForm";
	}//registerForm()-end

	//媛�寃� �벑濡� 濡쒖쭅
	@RequestMapping(value="registerPro",method=RequestMethod.POST)
	public String registerPro(Store_infoVO infoVO, 
			MultipartHttpServletRequest mpRequest,String u_id) throws Exception{

		service.register(infoVO, mpRequest,u_id);

		return "redirect:/";
	}//registerPro()-end

	//留쏆쭛 由ъ뒪�듃 (�궎�썙�뱶蹂� 踰좎뒪�듃)
	@RequestMapping("bestList")
	public String bestList() {

		return ".main.store.bestList";
	}//bestList()-end

	//�궎�썙�뱶蹂� 由ъ뒪�듃
	@RequestMapping("foodList")
	public String foodList(String keyword,Model model) throws Exception{

		Store_infoVO infoVO=new Store_infoVO();
		List list=service.search(keyword);

		JSONArray req_array=new JSONArray();

		Iterator<Store_infoVO> iterator=list.iterator();
		while(iterator.hasNext()) {
			JSONObject data=new JSONObject();//JSON�뿉 �떞�쓣 �닔 �엳�쓬

			infoVO=iterator.next();
			String s_addr=infoVO.getS_addr()+infoVO.getS_addr_detail();//由ъ뒪�듃�뿉�꽌 二쇱냼,�긽�꽭二쇱냼 爰쇰궡�꽌 臾띠뼱�꽌 �떎�떆 由ъ뒪�듃2�뿉 �떞湲�
			System.out.println();
			int s_num=infoVO.getS_num();//�궎�썙�뱶�뿉 �빐�떦�븯�뒗 踰덊샇媛��졇���꽌 store_detail�뿉�꽌 �젙蹂� 媛��졇�삤湲�
			String s_name=infoVO.getS_name();//媛�寃� �씠由�
			Double ratingAvg=replyService.setRating(s_num);
			
			List<Map<String, Object>> imageList=service.storeImage(s_num);//s_num�뿉 �빐�떦�븯�뒗 �씠誘몄� 媛��졇�삤湲�
			String image="";
			
			if(imageList.size()!=0) {
				image=imageList.get(0).get("f_STORED_FILE_NAME").toString();//�뙆�씪 �썝蹂몄씠由꾨뱾留� 爰쇰궡�삤湲�
			}
			//System.out.println(image);
			data.put("s_num", s_num);
			data.put("image", image);
			data.put("s_addr", s_addr);
			data.put("s_name", s_name);
			data.put("ratingAvg", ratingAvg);
			
			req_array.add(data);
		}//while-end

		model.addAttribute("list",req_array);
		model.addAttribute("size", list.size());

		return ".main.store.foodList";
	}//foodList()-end

	//媛�寃� �겢由��떆 酉�
	@RequestMapping("storeInfo")
	public String storeInfo(int s_num,Model model) throws Exception{
		
		Double ratingAvg=replyService.setRating(s_num);
		model.addAttribute("ratingAvg", ratingAvg);
		
		model.addAttribute("storeInfo", service.storeInfo(s_num));
		List<Map<String, Object>> imageList=service.storeImage(s_num);
		model.addAttribute("imageList", imageList);

		//---------------------------------------------------------------------
		//由щ럭 遺�遺�
		List<ReplyVO> replyList=replyService.readReply(s_num);
		JSONArray req_array=new JSONArray();

		ReplyVO replyVO=new ReplyVO();

		Iterator<ReplyVO> iterator=replyList.iterator();

		while(iterator.hasNext()) {
			JSONObject data=new JSONObject();//JSON�뿉 �떞�쓣 �닔 �엳�쓬

			replyVO=iterator.next();

			int r_num=replyVO.getR_num();
			String u_id=replyVO.getU_id();
			Date r_regdate=replyVO.getR_regdate();
			String r_content=replyVO.getR_content();
			int r_grade=replyVO.getR_grade();

			List<Map<String, Object>> replyImage=replyService.replyImage(r_num);

			String image="";

			if(replyImage.size()!=0) {
				image=replyImage.get(0).get("f_STORED_FILE_NAME").toString();//�뙆�씪 �썝蹂몄씠由꾨뱾留� 爰쇰궡�삤湲�
			}//if-end

			data.put("u_id", u_id);
			data.put("r_regdate", r_regdate);
			data.put("r_content", r_content);
			data.put("image", image);
			data.put("r_grade", r_grade);

			req_array.add(data);
		}//while-end

		model.addAttribute("replyList",req_array);
		//model.addAttribute("replyList", replyList);


		return ".main.store.storeInfo";
	}//storeInfo()-end

	@RequestMapping("search")
	public String matchingHome() {
		return ".main.store.search";
	}//matchingHome()-end

	@RequestMapping(value="map",method=RequestMethod.POST)
	public String map(Model model, String keyword) throws Exception{
		
		Store_infoVO infoVO=new Store_infoVO();
		List list=service.search(keyword);
		
		JSONArray req_array=new JSONArray();

		Iterator<Store_infoVO> iterator=list.iterator();
		while(iterator.hasNext()) {
			JSONObject data=new JSONObject();//JSON�뿉 �떞�쓣 �닔 �엳�쓬

			infoVO=iterator.next();
			String s_addr=infoVO.getS_addr()+infoVO.getS_addr_detail();//由ъ뒪�듃�뿉�꽌 二쇱냼,�긽�꽭二쇱냼 爰쇰궡�꽌 臾띠뼱�꽌 �떎�떆 由ъ뒪�듃2�뿉 �떞湲�

			int s_num=infoVO.getS_num();//�궎�썙�뱶�뿉 �빐�떦�븯�뒗 踰덊샇媛��졇���꽌 store_detail�뿉�꽌 �젙蹂� 媛��졇�삤湲�
			String s_name=infoVO.getS_name();//媛�寃� �씠由�
			String image="";
			
			List<Map<String, Object>> imageList=service.storeImage(s_num);//s_num�뿉 �빐�떦�븯�뒗 �씠誘몄� 媛��졇�삤湲�
			
			if(imageList.size()!=0) {
				image=imageList.get(0).get("f_STORED_FILE_NAME").toString();//�뙆�씪 �썝蹂몄씠由꾨뱾留� 爰쇰궡�삤湲�
			}//if-end
			
			data.put("image", image);
			data.put("s_addr", s_addr);
			data.put("s_name", s_name);


			req_array.add(data);


		}//while-end

		model.addAttribute("list",req_array);
		//model.addAttribute("size", list.size());

		return ".main.store.map";

		//�엲�뵜 �벑濡앺뤌	
	}
	@RequestMapping("eatRegister")
	public String eatdealRegister(String u_id,Model model) {
		
		UserVO userVO=service.getSnum(u_id);
		int s_num=userVO.getS_num();
		System.out.println(s_num);
		
		Store_infoVO infoVO=service.storeInfo(s_num);

		String s_name=infoVO.getS_name();
		String s_addr=infoVO.getS_addr();
		String s_menu=infoVO.getS_menu();
		
		model.addAttribute("s_num", s_num);
		model.addAttribute("s_name", s_name);
		model.addAttribute("s_addr", s_addr);
		model.addAttribute("s_menu", s_menu);


		return ".main.store.eatRegister";
	}

	//�엲�뵜 �벑濡앺븯湲�,�엲�뵜 �뙆�씪�뾽濡쒕뱶
	@RequestMapping("eatdealPro")
	public String eatdealPro(EatVO eatVO,MultipartHttpServletRequest mpRequest) throws Exception{


		service.eatInsert(eatVO,mpRequest);

		return "redirect:/store/eatList";
	}

	//�엲�뵜由ъ뒪�듃
	@RequestMapping("eatList")
	public String eatList(EatVO eatVO,Model model) throws Exception{
		List<EatVO> list=service.eatList();

		JSONArray req_array=new JSONArray();
		Iterator<EatVO> iterator=list.iterator();

		while(iterator.hasNext()) {
			JSONObject data=new JSONObject();//JSON�뿉 �떞�쓣 �닔 �엳�쓬

			eatVO=iterator.next();

			int e_price=eatVO.getE_price();
			String e_name=eatVO.getE_name();
			String e_addr=eatVO.getE_addr();
			String e_menu=eatVO.getE_menu();

			int e_num=eatVO.getE_num();
			System.out.println(e_num);
			List<Map<String, Object>> imageList=service.eatImage(e_num);//e_num�뿉 �빐�떦�븯�뒗 �씠誘몄� 媛��졇�삤湲�
			String image="";
			
			if(imageList.size()!=0) {
				image=imageList.get(0).get("f_STORED_FILE_NAME").toString();//�뙆�씪 �썝蹂몄씠由꾨뱾留� 爰쇰궡�삤湲�
			}
			
			data.put("e_price", e_price);
			data.put("e_name", e_name);
			data.put("e_addr", e_addr);
			data.put("e_menu", e_menu);
			data.put("e_num", e_num);

			data.put("image", image);

			req_array.add(data);

		}//while-end

		model.addAttribute("list",req_array);
		return ".main.store.eatList";
	}

	//�엲�뵜 �겢由��떆 酉�
	@RequestMapping("eatInfo")
	public String eatInfo(int e_num,Model model) throws Exception{
		model.addAttribute("eatInfo", service.eatInfo(e_num));
		List<Map<String, Object>> imageList=service.eatImage(e_num);
		model.addAttribute("imageList", imageList);

		return ".main.store.eatInfo";
	}
	// 댓글 작성
	   @RequestMapping(value="/replyWrite", method=RequestMethod.POST)
	   public String replyWrite(ReplyVO replyVO,MultipartHttpServletRequest mpRequest,Model model) throws Exception{
		   
	      replyService.writeReply(replyVO,mpRequest);
	      int s_num=replyVO.getS_num();
	      
	      model.addAttribute("s_num", s_num);
	      
	      return "redirect:/store/storeInfo";
	   }

}//class-end