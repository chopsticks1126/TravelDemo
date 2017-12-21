package com.travel.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.user.dao.UserDao;
import com.travel.user.entity.User;
import com.travel.user.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao<User> userdao;
	public List<User> doUserLogin(User user) {
		List<User> users =userdao.selectId(user.getUsername());
		return  users;
	}
	public List<User> selectAllUser() {
		List<User> users =userdao.selectAllUser();
		return users;
	}

}
