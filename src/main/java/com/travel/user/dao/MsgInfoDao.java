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
	 * 查询所有
	 * @param map
	 * @return
	 */
	List<MsgInfo> queryAll();
	/**
	 * 添加插入数据
	 * @param msgInfo
	 */
	int insertMsg(MsgInfo msgInfo);
	/**
	 * 更新数据
	 * @return
	 */
	int updateMsg(MsgInfo msgInfo);
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	List<MsgInfo> queryById(int id);
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	int deleteById(int id);
	/**
	 * 根据条件筛选信息
	 * @param map
	 * @return
	 */
	List<MsgInfo> queryByConditional(Map<String, Object> map);
	/**
	 * 根据条件筛选信息总量
	 * @param map
	 * @return
	 */
	int queryCountConditional(Map<String, Object> map);
}