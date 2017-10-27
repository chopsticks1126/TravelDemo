package com.travel.user.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.travel.user.entity.MsgInfo;

@Repository
public interface MsgInfoDao<MsgDao>{
	/**
	 * 查询总数
	 * @return
	 */
	int queryCount();
	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	List<MsgInfo> queryAll(Map<String, Integer> map);
	/**
	 * 插入单条数据
	 * @param msgInfo
	 */
	int insertMsg(MsgInfo msgInfo);
	/**
	 * 更新单条数据
	 * @return
	 */
	int updateMsg(MsgInfo msgInfo);
	/**
	 * 根据ID查询数据
	 * @param id
	 * @return
	 */
	List<MsgInfo> queryById(int id);
	/**
	 * 根据ID删除对象
	 * @param id
	 * @return
	 */
	int deleteById(int id);
}