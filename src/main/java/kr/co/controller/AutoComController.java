package kr.co.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.service.AutoComService;
import kr.co.service.BoardService;

@Controller
public class AutoComController {
	
	private static final Logger logger = LoggerFactory.getLogger(AutoComController.class);
	
	@Inject
	AutoComService service;
	
	//-----------------------------------
	//추천�??��?��
	//-----------------------------------
	@RequestMapping(value = "/ajax/autocomplete", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		
		logger.info("/ajax/autocomplete");
		
		//model.addAttribute("list",service.list());
		
		// Gson ?��?��
		String json = new Gson().toJson(service.list());
		//System.out.println("?��?��?�� 결과2 = " + json);
		
		model.addAttribute("json",json);
		
		return "/ajax/autocomplete";
	}
	
	//-----------------------------------
	//?��기�??��?��
	//-----------------------------------
	@RequestMapping(value = "/ajax/autocomplete_pop", method = RequestMethod.GET)
	public String list2(Model model) throws Exception{
		
		logger.info("/ajax/autocomplete_pop");
		
		// Gson ?��?��
		String json = new Gson().toJson(service.list2());
		//System.out.println("?��?��?�� 결과2 = " + json);
		
		model.addAttribute("json",json);
		
		return "/ajax/autocomplete_pop";
	}

}