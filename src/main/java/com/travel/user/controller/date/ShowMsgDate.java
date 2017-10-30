
package com.travel.user.controller.date;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.user.service.impl.MsgInfoServiceImpl;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/ShowMsgDate") 
public class ShowMsgDate {
	@Autowired
	private  MsgInfoServiceImpl msgInfoService;
	JSONObject jsonObject =null;
	
	
	/*
	@RequestMapping(value="/showMsgInfoDate.do",produces="application/json;charset=UTF-8") 
	// url=http://localhost:8080/TravelDemo/ShowMsgDate/showMsgInfoDate.do
	public void showMsgInfoDate(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");// 椤电爜
		Map<String, Object> map = msgInfoService.selectByPage(page, rows);
		jsonObject = JSONObject.fromObject(map);
		try {
			response.getWriter().write(jsonObject.toString());// 灏嗗緱鍒扮殑鏁版嵁鍐欏埌椤甸潰
			System.out.println(jsonObject.toString());
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	*/
	/**
	 * 查询所有（暂且没有用）
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/showMsgInfoDate.do",produces="application/json;charset=UTF-8") 
	public JSONObject showMsgInfoDate(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");// 
		String rows = request.getParameter("rows");// 
		Map<String, Object> mapObject = msgInfoService.selectByPage(page, rows);
		jsonObject = JSONObject.fromObject(mapObject);
		return jsonObject;
	}
	
	/**
	 * 根据(条件)查询所有
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showMsgByConditional.do", produces = "application/json;charset=UTF-8")
	public JSONObject showMsgByConditional(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		String typeSearch = request.getParameter("typeSearch");
		String content = request.getParameter("inputContent");
		Map<String, Object> mapObject = msgInfoService.selectByConditional(page, rows, typeSearch, content);
		JSONObject jsonObject = JSONObject.fromObject(mapObject);
		return jsonObject;
	}
}
