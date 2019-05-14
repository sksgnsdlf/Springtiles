package com.yedam.www;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/board")
	public String board() {
		return "admin/board/list";
	}
	
	@RequestMapping("/ajaxTest")
	@ResponseBody
	public HashMap<String, Object> ajaxTest() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", "hong");
		map.put("pw", "1234");
		return map;
	}
	
	@RequestMapping("/ajaxBoard")
	@ResponseBody
	public BoardListvo ajaxBoard() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		BoardVO vo = new BoardVO();
		vo.setContent("내용무");
		vo.setTitle("제목");
		vo.setWriter("작성자");
		list.add(vo);
		
		vo = new BoardVO();
		vo.setContent("내용무");
		vo.setTitle("제목");
		vo.setWriter("작성자");
		list.add(vo);
		
		BoardListvo listVO = new BoardListvo(); 
		listVO.setBoardList(list);
		return listVO;
	}
	
	@RequestMapping("/getParam.do")
	@ResponseBody
	public BoardVO getParam(BoardVO vo) {
		//등록처리
		System.out.println("파라미터"+vo);
		return vo;
	}
}
