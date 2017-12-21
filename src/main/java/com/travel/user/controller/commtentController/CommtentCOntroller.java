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
	@RequestMapping(value="/loadComments.do") //produces="application/json;charset=UTF-8"  //��Զ�̬��������
	public List<Commtent> loadComments(HttpServletRequest request, HttpServletResponse response) {
		String dcComID = request.getParameter("dcComID").trim();//ȡ�ö�̬���ݸ�����id
		int dcComIDt =0;
		if(dcComID!=null && !("").equals(dcComID)){
			dcComIDt = Integer.parseInt(dcComID);//ת��int
		}
		List<Commtent> ctlist= commtentService.selectAllCommtent(dcComIDt);//���ۻظ����Ȳ�ѯ����ǰ3��
		return ctlist;
	}
	/**
	 * ����������������
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addComments.do") //produces="application/json;charset=UTF-8"  //��Զ�̬��������
	public Object addComments(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("userLogin");
		String dcComID = request.getParameter("dcComID");//��̬���ݱ������ID
		String replyContent = request.getParameter("replyContent");//���۶�̬����
		int dcComIDt =0;
		if(dcComID!=null && !("").equals(dcComID)){
			dcComIDt = Integer.valueOf(dcComID);
		}
		Commtent cmt = new Commtent();
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid);
//		cmt.setComID(Integer.parseInt(uuid));
		cmt.setDcComID(dcComIDt);
		cmt.setCmtUserId(user.getId());//��ǰ��¼�û�Ϊ�ظ�/������
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
	 * У���û��Ƿ��¼
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
			jsonObject.put("flag", flag);// ���ڵ�¼״̬
		} else {
			flag = "signOut";
			jsonObject.put("flag", flag);// ��ʶ��¼״̬ �� �˳�
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
//			        "startcityName_zh": "�ɶ�",
//			        "passx_axis": "114.27",
//			        "passy_axis": "30.58",
//			        "passcityName": "wh",
//			        "startimgName":"cd",
//			        "passcityName_zh": "�人",
//			        "direction": "cd-wh",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200�����һЩ��Ϣ��������չ"
//			    }, {
//			    	"oid":"qwesdf",
//			        "startx_axis": "108.88",
//			        "starty_axis": "34.34",
//			        "startcityName": "xa",
//			        "startcityName_zh": "����",
//			        "startimgName":"xa",
//			        "passx_axis": "114.49",
//			        "passy_axis": "38.01",
//			        "passcityName": "sjz",
//			        "passcityName_zh": "ʯ��ׯ",
//			        "direction": "xa-sjz",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200�����һЩ��Ϣ��������չ"
//			    },{
//			    	"oid":"qwengf",
//			        "startx_axis": "114.27",
//			        "starty_axis": "30.58",
//			        "startcityName": "wh",
//			        "startcityName_zh": "�人",
//			        "startimgName":"wh",
//			        "passx_axis": "108.88",
//			        "passy_axis": "34.34",
//			        "passcityName": "xa",
//			        "passcityName_zh": "����",
//			        "direction": "wh-xa",
//			        "DeviceNam": "OSL6200",
//			        "deviceInfo": "OSL6200�����һЩ��Ϣ��������չ"
//			    },{
//			    		"oid":"qwenltrg",
//				        "startx_axis": "114.27",
//				        "starty_axis": "30.58",
//				        "startcityName": "wh",
//				        "startcityName_zh": "�人",
//				        "startimgName":"wh",
//				        "passx_axis": "113.42",
//				        "passy_axis": "34.44",
//				        "passcityName": "zz",
//				        "passcityName_zh": "֣��",
//				        "direction": "wh-xa",
//				        "DeviceNam": "OSL6200",
//				        "deviceInfo": "OSL6200�����һЩ��Ϣ��������չ"
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
		System.out.println("�༭");
		return jsonObject;
	}
}
