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
	public boolean doUserLogin(User user) {
		boolean flag =false;
		List<User> users =userdao.selectId(user.getUsername());
		if(users.get(0).getPassword().equals(user.getPassword())){
			flag =true;
		}
		return flag;
	}

}
