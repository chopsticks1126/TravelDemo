package com.travel.user.Util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.travel.user.entity.MsgInfo;
import com.travel.user.service.impl.MsgInfoServiceImpl;


@Component	//申明为spring组件
public class WHTools {
	@Autowired	
	private  MsgInfoServiceImpl msgInfoService;		  //添加所需service的私有成员
	private static WHTools whTools;	//  关键点1   静态初使化 一个工具类  这样是为了在spring初始化之前
	
	public void setMsgInfoService(MsgInfoServiceImpl msgInfoService) {	
		this.msgInfoService = msgInfoService;
	}

	@PostConstruct   //关键二   通过@PostConstruct 和 @PreDestroy 方法 实现初始化和销毁bean之前进行的操作
    public void init() {  
    	whTools = this;  
        whTools.msgInfoService = this.msgInfoService;  		// 初使化时将已静态化的testService实例化
  
    }  
	public static HashMap<String, Object> configMap=new HashMap<String, Object>();

	public String getConfigModify(){
		PropertiesUtil p =null;
		String configModify =null;
		try {
			p = new PropertiesUtil();
			Map<String,String> map =p.readAllProperties();
			configModify = map.get("configModify");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return configModify;
	}
	
	public Boolean isQueryDate(){
		boolean isQueryData =true;
		try {
			File file = new File(getConfigModify());
			if (!file.exists()) {//文件不存在
				synchronized (this) {
					if (!file.exists()) {
						file.createNewFile();
						FileOutputStream out = new FileOutputStream(file);
						out.write("modify file".getBytes());
						out.close();
					}
				}
			}else{//文件存在
				if(WHTools.configMap.containsKey("fileLastModified")){
					if(String.valueOf(file.lastModified()).equals((WHTools.configMap.get("fileLastModified")).toString())){
						isQueryData=false;
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return isQueryData;
	}
		
		//获取配置到内存
		@SuppressWarnings("unchecked")
		public List<MsgInfo> getMapConfig(){
			List<MsgInfo> configlist =null;

			Boolean isQueryData=true; //是否需要查库 true：需要
			try {
				File file =new File(getConfigModify());
				if(!file.exists()){//文件不存在
					synchronized (this) {
						if(!file.exists()){
							file.createNewFile();
							FileOutputStream out = new FileOutputStream(file);
							out.write("modify file".getBytes());
							out.close();
						}
					}
				}else{//文件存在
					if(WHTools.configMap.containsKey("fileLastModified")){
						if(String.valueOf(file.lastModified()).equals((WHTools.configMap.get("fileLastModified")).toString())){
							isQueryData=false;
						}
					}
				}
				if(isQueryData){	//数据文件没有存放到内存当中，需要查询数据库将数据写到内存当中
					WHTools.configMap.put("fileLastModified", String.valueOf(file.lastModified()));
					configlist = whTools.msgInfoService.selectAll();
					WHTools.configMap.put("configlist", configlist);
				}else{			   //数据存在内存中只需要去内存中取即可
					configlist=(ArrayList<MsgInfo>) WHTools.configMap.get("configlist");
				}
				
			} catch (Exception e) {
				configlist = new ArrayList<MsgInfo>();
				WHTools.configMap.clear();
			}
			return configlist;
		}

}
