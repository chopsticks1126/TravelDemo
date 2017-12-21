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


@Component	//����Ϊspring���
public class WHTools {
	@Autowired	
	private  MsgInfoServiceImpl msgInfoService;		  //�������service��˽�г�Ա
	private static WHTools whTools;	//  �ؼ���1   ��̬��ʹ�� һ��������  ������Ϊ����spring��ʼ��֮ǰ
	
	public void setMsgInfoService(MsgInfoServiceImpl msgInfoService) {	
		this.msgInfoService = msgInfoService;
	}

	@PostConstruct   //�ؼ���   ͨ��@PostConstruct �� @PreDestroy ���� ʵ�ֳ�ʼ��������bean֮ǰ���еĲ���
    public void init() {  
    	whTools = this;  
        whTools.msgInfoService = this.msgInfoService;  		// ��ʹ��ʱ���Ѿ�̬����testServiceʵ����
  
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
			if (!file.exists()) {//�ļ�������
				synchronized (this) {
					if (!file.exists()) {
						file.createNewFile();
						FileOutputStream out = new FileOutputStream(file);
						out.write("modify file".getBytes());
						out.close();
					}
				}
			}else{//�ļ�����
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
		
		//��ȡ���õ��ڴ�
		@SuppressWarnings("unchecked")
		public List<MsgInfo> getMapConfig(){
			List<MsgInfo> configlist =null;

			Boolean isQueryData=true; //�Ƿ���Ҫ��� true����Ҫ
			try {
				File file =new File(getConfigModify());
				if(!file.exists()){//�ļ�������
					synchronized (this) {
						if(!file.exists()){
							file.createNewFile();
							FileOutputStream out = new FileOutputStream(file);
							out.write("modify file".getBytes());
							out.close();
						}
					}
				}else{//�ļ�����
					if(WHTools.configMap.containsKey("fileLastModified")){
						if(String.valueOf(file.lastModified()).equals((WHTools.configMap.get("fileLastModified")).toString())){
							isQueryData=false;
						}
					}
				}
				if(isQueryData){	//�����ļ�û�д�ŵ��ڴ浱�У���Ҫ��ѯ���ݿ⽫����д���ڴ浱��
					WHTools.configMap.put("fileLastModified", String.valueOf(file.lastModified()));
					configlist = whTools.msgInfoService.selectAll();
					WHTools.configMap.put("configlist", configlist);
				}else{			   //���ݴ����ڴ���ֻ��Ҫȥ�ڴ���ȡ����
					configlist=(ArrayList<MsgInfo>) WHTools.configMap.get("configlist");
				}
				
			} catch (Exception e) {
				configlist = new ArrayList<MsgInfo>();
				WHTools.configMap.clear();
			}
			return configlist;
		}

}
