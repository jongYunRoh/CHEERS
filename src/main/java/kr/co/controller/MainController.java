package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;

@Controller
@RequestMapping("/main/*")
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//@Inject
	//BoardService service;
	
	// 메인화면 맵핑
	@RequestMapping(value = "/main/view", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info(".main.main.view");
		
	}
	
}