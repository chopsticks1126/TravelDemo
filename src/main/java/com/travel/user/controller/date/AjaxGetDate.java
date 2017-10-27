package com.travel.user.controller.date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.user.entity.MsgInfoModel;
import com.travel.user.service.impl.MsgInfoServiceImpl;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/AjaxGetDate") 
public class AjaxGetDate {
	@Autowired
	private  MsgInfoServiceImpl msgInfoService;
	JSONObject jsonObject =null;
	/**
	 * Ôö¼Ó
	 * @param msgInfoModel
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addOrUpdateMsgDate.do",produces="application/json;charset=UTF-8") 
	public JSONObject addOrUpdateMsgDate(MsgInfoModel msgInfoModel ,Model model) {
		jsonObject = msgInfoService.addOrUpdateMsgDate(msgInfoModel);
		return jsonObject;
	}
	/**
	 * É¾³ý
	 * @param msgInfoModel
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteDate.do",produces="application/json;charset=UTF-8") 
	public JSONObject deleteDate(MsgInfoModel msgInfoModel ,Model model) {
		jsonObject = msgInfoService.deleteById(Integer.toString(msgInfoModel.getId()));
		return jsonObject;
	}
	
}
