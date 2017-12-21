package com.travel.user.service;  
  
import java.util.List;

import com.travel.user.entity.User;  
  
public interface UserService {  
	List<User> doUserLogin(User user); 
    List<User> selectAllUser();
}