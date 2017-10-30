package com.travel.user.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.travel.user.entity.MsgInfo;

@Repository
public interface MsgInfoDao<MsgDao>{
	/**
	 * ��ѯ����
	 * @return
	 */
	int queryCount();
	/**
	 * ��ѯ����
	 * @param map
	 * @return
	 */
	List<MsgInfo> queryAll(Map<String, Object> map);
	/**
	 * ��Ӳ�������
	 * @param msgInfo
	 */
	int insertMsg(MsgInfo msgInfo);
	/**
	 * ��������
	 * @return
	 */
	int updateMsg(MsgInfo msgInfo);
	/**
	 * ����ID��ѯ
	 * @param id
	 * @return
	 */
	List<MsgInfo> queryById(int id);
	/**
	 * ����IDɾ��
	 * @param id
	 * @return
	 */
	int deleteById(int id);
	/**
	 * ��������ɸѡ��Ϣ
	 * @param map
	 * @return
	 */
	List<MsgInfo> queryByConditional(Map<String, Object> map);
	/**
	 * ��������ɸѡ��Ϣ����
	 * @param map
	 * @return
	 */
	int queryCountConditional(Map<String, Object> map);
}