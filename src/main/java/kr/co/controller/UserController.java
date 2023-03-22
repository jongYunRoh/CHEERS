package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.KakaoLoginService;
import kr.co.service.UserService;
import kr.co.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	@Inject
	KakaoLoginService kakaoService;
	

	// �쉶�썝媛��엯 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("get register");
		return ".main.user.register";
	}
	
	
	// �쉶�썝媛��엯 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(Model model, UserVO vo, HttpServletRequest req) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return "redirect:/";
	}
	
	//�븘�씠�뵒 以묐났泥댄겕
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String postIdCheck(Model model, UserVO vo, HttpServletRequest req) throws Exception {
		
		logger.info("postIdCheck");
		String id = req.getParameter("u_id");
		//System.out.println("id:"+id);
		
		int check=-1;//�궗�슜以묒씤 �븘�씠�뵒
		
		String result = service.idCheck(vo);
		
		//System.out.println(result);
		if(result==null) {
			check=1;//�궗�슜 媛��뒫�븳 �븘�씠�뵒
		}else if(result.equals(id)) {
			check=-1;
		}
		//System.out.println("check"+check);
		model.addAttribute("check",check);
		
		return "/user/idCheck";
	}
	
	//濡쒓렇�씤
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		logger.info("get login");
		
		return ".main.user.login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo,HttpServletRequest req, RedirectAttributes rttr, Model model,HttpSession session) throws Exception{
		logger.info("post login");
		UserVO login = service.login(vo);
		if(login == null) {
			session.setAttribute("msg", "false");
			return "redirect:/user/login";
		}
		else { //id�뒗 留욎쓬
			if(!login.getU_pw().equals(vo.getU_pw())) { //鍮꾨�踰덊샇�뒗 ��由�
				session.setAttribute("msg", "false");
				 return "redirect:/user/login";
			}else { //鍮꾨�踰덊샇�룄 留욎쓬
				if(!login.getU_type().equals(vo.getU_type())) {
					session.setAttribute("msg", "false");
					 return "redirect:/user/login";
				}else {
					
					session.setAttribute("user", login);
				}
			return "redirect:/";
			}
		}
	}
	
	@RequestMapping(value="/findIdView", method=RequestMethod.GET)
	public String findIdView() throws Exception{
		return".main.user.findIdView";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findId() throws Exception{
		return "redirect:/";
	}
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(UserVO vo,Model model) throws Exception{
		if(service.findIdCheck(vo.getU_email())==0) {
		model.addAttribute("msg", "이메일을 확인해주세요");
		return ".main.user.findIdView";
		}else {
			vo=service.findId(vo.getU_email());
			String u_id=vo.getU_id();
		model.addAttribute("u_id", u_id);
		return".main.user.findId";
		}
	}
	
	// 濡쒓렇�븘�썐
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");
		
		service.signout(session);  // �꽭�뀡 �젙蹂대�� �젣嫄�
				
		return "redirect:/";
	}
	
	// �쉶�썝�젙蹂� �닔�젙 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify() throws Exception {
		logger.info("get modify");
		
		return ".main.user.modify";
	}

	// �쉶�썝�젙蹂� �닔�젙 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, UserVO vo) throws Exception {
		logger.info("post modify");
		
		service.modify(vo);
		
		return ".main.layout";
	}
		
	
	// �쉶�썝 �깉�눜 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete() throws Exception {
		logger.info("get delete");
		
	}
		
	// �쉶�썝 �깉�눜 post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(HttpSession session, UserVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post withdrawal");
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		String oldPass = user.getU_pw();
		String newPass = vo.getU_pw();
						
		if(!(oldPass.equals(newPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/delete";
		}
		
		service.delete(vo);
		
		session.invalidate();
			
		return ".main.layout";
	}
	
}