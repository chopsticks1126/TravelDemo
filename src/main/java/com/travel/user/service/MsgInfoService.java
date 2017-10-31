package com.travel.user.service;

import java.util.List;
import java.util.Map;

import com.travel.user.entity.MsgInfo;
import com.travel.user.entity.MsgInfoModel;

import net.sf.json.JSONObject;

public interface MsgInfoService {  
	Map<String, Object> selectByPage(String page,String rows);  
	int queryCount();
	JSONObject insertMsg(MsgInfoModel msgInfo);
	JSONObject updateMsg(MsgInfoModel msgInfo);
	List<MsgInfo> queryById(int id);
	Map<String, Object> selectByConditional(String page,String rows,String typeSearch,String content); 
	List<MsgInfo> selectAll();
}