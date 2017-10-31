
package com.travel.user.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.user.Util.WHTools;
import com.travel.user.dao.MsgInfoDao;
import com.travel.user.entity.MsgInfo;
import com.travel.user.entity.MsgInfoModel;
import com.travel.user.service.MsgInfoService;

import net.sf.json.JSONObject;
/**
 * 
 * 
 * @author ck
 *
 */
@Service
public class MsgInfoServiceImpl implements MsgInfoService {
	@Autowired
	private MsgInfoDao<MsgInfo> msgdao;
	private WHTools whtools = new WHTools();
	private JSONObject jsonObject =new JSONObject();
	
	public List<MsgInfo> selectAll(){
		List<MsgInfo> msgInfoListByPage =msgdao.queryAll();
		return msgInfoListByPage;
	}
	/**
	 * 分页查询所有的(暂且没有用到)  做了数据缓存，然后分页显示数据
	 * @param page	
	 * @param rows	
	 * @return		
	 */
	public Map<String, Object> selectByPage(String page,String rows){
		
		Map<String, Object> map =byPage(page, rows);//分页查询封装的参数
		List<MsgInfo> showDataList = new ArrayList<MsgInfo>();
		List<MsgInfo> comfigList =whtools.getMapConfig();
		int total = comfigList.size();//所有数据的总数
		int start = (Integer) map.get("page");//起始i
		int num = (Integer)map.get("page")+(Integer)map.get("rows");//根据每次的条数，最后该截至的数
		int end = num>total?total:num; //结束i
		if (comfigList != null && comfigList.size() > 0) {
			for (int i = start; i < end; i++) {
				showDataList.add(comfigList.get(i));
			}
		}
		Map<String, Object> mapObject = new HashMap<String, Object>();//
		mapObject.put("rows", showDataList);
		mapObject.put("total", comfigList.size());
		return mapObject;
	}
	/**
	 * 查询所有的总数
	 */
	public int queryCount() {
		int countNum = msgdao.queryCount();
		return countNum;
	}
	public JSONObject addOrUpdateMsgDate(MsgInfoModel msgInfoModel){
		if((msgInfoModel.getTagInfo()).equals("newUser")){
			 jsonObject =insertMsg(msgInfoModel);	//
		}else if((msgInfoModel.getTagInfo()).equals("edit")){
			 jsonObject =updateMsg(msgInfoModel);	//
		}
		return jsonObject;
	}
	/**
	 * 添加数据
	 */
	public JSONObject insertMsg(MsgInfoModel msgInfo) {
		MsgInfo msgInfoNew= new MsgInfo();
		msgInfoNew.setEmail(msgInfo.getEmail());
		msgInfoNew.setName(msgInfo.getName());
		msgInfoNew.setPhone(msgInfo.getPhone());
		int num =msgdao.insertMsg(msgInfoNew);
		System.out.println(num+"insert");
		jsonObject =JSONObject.fromObject(getMap(num));
		return jsonObject;
	}
	/**
	 * 更新数据
	 */
	public JSONObject updateMsg(MsgInfoModel msgInfo) {
		List<MsgInfo> msgList =msgdao.queryById(msgInfo.getId());
		MsgInfo msgDtonew =null;
		if(msgList.size()>0){
			msgDtonew=msgList.get(0);
			msgDtonew.setEmail(msgInfo.getEmail());
			msgDtonew.setName(msgInfo.getName());
			msgDtonew.setPhone(msgInfo.getPhone());
		}
		int num = msgdao.updateMsg(msgDtonew);
		System.out.println(num+"update");
		jsonObject =JSONObject.fromObject(getMap(num));
		return jsonObject;
	}
	/**
	 * 根据ID查询数据
	 */
	public List<MsgInfo> queryById(int id) {
		List<MsgInfo> msgInfo = msgdao.queryById(id);
		return msgInfo;
	}
	/**
	 * 根据ID 删除数据
	 * @param id
	 * @return
	 */
	public JSONObject deleteById(String id) {
		int idnum=0;
		if(id!=null && !("").equals(id)){
			idnum = Integer.parseInt(id);
		}
		int num = msgdao.deleteById(idnum);
		System.out.println(num+"delete");
		jsonObject =JSONObject.fromObject(getMap(num));
		return jsonObject;
	}
	
	/**
	 * 
	 * @param num
	 * @return
	 */
	public Map<String, String> getMap(int num){
		Map<String, String> map =new HashMap<String, String>();
		if(num==1){		//
			map.put( "success","1");
		}else{
			map.put("fail","0");
		}
		return map;
	}
	
	/**
	 *  将页码和每页显示的条数封装成一个map
	 * @param page
	 * @param rows
	 * @return
	 */
	public Map<String, Object> byPage(String page,String rows){
		int pageNum = 0;// 
		int pageSizeNum = 0;// 
		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		} else {
			pageNum = 1;
		}
		if (rows != null && !rows.equals("")) {
			pageSizeNum = Integer.parseInt(rows);
		} else {
			pageSizeNum = 10;// 
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page",(pageNum-1)*pageSizeNum);	//
		map.put("rows",pageSizeNum);			//
		return map;
	}
	/**
	 * 根据条件分页查询
	 */
	public Map<String, Object> selectByConditional(String page, String rows, String typeSearch, String content) {
		Map<String, Object> map =byPage(page, rows);
		map.put("type",typeSearch);
		map.put("content",content);
		List<MsgInfo> msgInfoListByPage =msgdao.queryByConditional(map);
		int countNum = msgdao.queryCountConditional(map);
		Map<String, Object> mapObject = new HashMap<String, Object>();//
		mapObject.put("rows", msgInfoListByPage);
		mapObject.put("total", countNum);
		return mapObject;
	}
}

