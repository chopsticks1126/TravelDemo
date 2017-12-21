package com.travel.user.controller.commtentController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.user.entity.Commtent;
import com.travel.user.entity.User;
import com.travel.user.service.impl.CommtentServiceImpl;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/CommtentController") 
public class CommtentCOntroller {
	
	@Autowired
	private CommtentServiceImpl commtentService;
	
	@ResponseBody
	@RequestMapping(value="/loadComments.do") //produces="application/json;charset=UTF-8"  //针对动态内容评论
	public List<Commtent> loadComments(HttpServletRequest request, HttpServletResponse response) {
		String dcComID = request.getParameter("dcComID").trim();//取得动态内容该条的id
		int dcComIDt =0;
		if(dcComID!=null && !("").equals(dcComID)){
			dcComIDt = Integer.parseInt(dcComID);//转成int
		}
		List<Commtent> ctlist= commtentService.selectAllCommtent(dcComIDt);//评论回复表先查询的是前3条
		return ctlist;
	}
	/**
	 * 评论增加评论数据
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addComments.do") //produces="application/json;charset=UTF-8"  //针对动态内容评论
	public Object addComments(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("userLogin");
		String dcComID = request.getParameter("dcComID");//动态内容表的主键ID
		String replyContent = request.getParameter("replyContent");//评论动态内容
		int dcComIDt =0;
		if(dcComID!=null && !("").equals(dcComID)){
			dcComIDt = Integer.valueOf(dcComID);
		}
		Commtent cmt = new Commtent();
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid);
//		cmt.setComID(Integer.parseInt(uuid));
		cmt.setDcComID(dcComIDt);
		cmt.setCmtUserId(user.getId());//当前登录用户为回复/评论人
		System.out.println(user.getId()+"~~~~~~~~~~~~~~~");
		cmt.setReplyContent(replyContent.trim());
		cmt.setDatetimect(new Date());
		cmt.setIsagree("N");
		cmt.setReplyTag("P");
		cmt.setIsdelete("N");
		commtentService.insertComment(cmt);
//		System.out.println(cmt.getComID()+"111111111");
		JSONObject obj = new JSONObject();
		obj.put("flag", "ok");
		return obj;
	}

	/**
	 * 校验用户是否登录
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/ajaxCheckLogin.do") //,produces="application/json;charset=UTF-8"  
	public Object ajaxCheckLogin(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("userLogin");
		JSONObject jsonObject = new JSONObject();
		String flag = "islogin";
		if (user != null) {
			jsonObject.put("username", user.getUsername());
			jsonObject.put("flag", flag);// 处于登录状态
		} else {
			flag = "signOut";
			jsonObject.put("flag", flag);// 标识登录状态 ： 退出
		}
		return jsonObject;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxGetAll.do") //,produces="application/json;charset=UTF-8"  
	public Object ajaxGetAll(HttpServletRequest request, HttpServletResponse response) {
//		String str =" {
//			    	"oid":"qwerty",
//			        "startx_axis": "104.06",
//			        "starty_axis": "30.57",
//			        "startcityName": "cd",
//			        "startcityName_zh": "成都",
//			        "passx_axis": "114.27",
//			        "passy_axis": "30.58",
//			        "passcityName": "wh",
//			        "startimgName":"cd",
//			        "passcityName_zh": "武汉",
//			        "direction": "cd-wh",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
//			    }, {
//			    	"oid":"qwesdf",
//			        "startx_axis": "108.88",
//			        "starty_axis": "34.34",
//			        "startcityName": "xa",
//			        "startcityName_zh": "西安",
//			        "startimgName":"xa",
//			        "passx_axis": "114.49",
//			        "passy_axis": "38.01",
//			        "passcityName": "sjz",
//			        "passcityName_zh": "石家庄",
//			        "direction": "xa-sjz",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
//			    },{
//			    	"oid":"qwengf",
//			        "startx_axis": "114.27",
//			        "starty_axis": "30.58",
//			        "startcityName": "wh",
//			        "startcityName_zh": "武汉",
//			        "startimgName":"wh",
//			        "passx_axis": "108.88",
//			        "passy_axis": "34.34",
//			        "passcityName": "xa",
//			        "passcityName_zh": "西安",
//			        "direction": "wh-xa",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
//			    },{
//			    		"oid":"qwenltrg",
//				        "startx_axis": "114.27",
//				        "starty_axis": "30.58",
//				        "startcityName": "wh",
//				        "startcityName_zh": "武汉",
//				        "startimgName":"wh",
//				        "passx_axis": "113.42",
//				        "passy_axis": "34.44",
//				        "passcityName": "zz",
//				        "passcityName_zh": "郑州",
//				        "direction": "wh-xa",
//				        "DeviceNam": "OSL6200",
//				        "deviceInfo": "OSL6200的相关一些信息，后续扩展"
//				    }
//			    
			
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("DeviceNam", "OSL6200");
		return jsonObject;
	}
	@ResponseBody
	@RequestMapping(value="/ajaxEditInfo.do") //,produces="application/json;charset=UTF-8"  
	public Object ajaxEditInfo(HttpServletRequest request, HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("DeviceNam", "OSL6200");
		System.out.println("编辑");
		return jsonObject;
	}
}
