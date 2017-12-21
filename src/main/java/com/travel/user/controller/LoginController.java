
package com.travel.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.user.entity.Commtent;
import com.travel.user.entity.DynamicContent;
import com.travel.user.entity.User;
import com.travel.user.service.impl.CommtentServiceImpl;
import com.travel.user.service.impl.DynamicContentServiceImpl;
import com.travel.user.service.impl.UserServiceImpl;


@Controller
@RequestMapping("/loginController") 
public class LoginController {
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private DynamicContentServiceImpl dynamicContentService;
	@Autowired
	private CommtentServiceImpl commtentService;
	

@RequestMapping("/dologin.do") //url
//url=http://localhost:8080/TravelDemo/loginController/dologin.do
public String dologin(User user, Model model){
//	if(userService.doUserLogin(user)){
//		model.addAttribute("successMsg", "");
//		model.addAttribute("name", user.getUsername());
//		return "/success";//
//	}else{
//		model.addAttribute("failMsg", "失败");
		return "/fail";
//	}	
}

@RequestMapping("/welcomeJsp.do") //url
//url=http://localhost:8080/TravelDemo/loginController/welcomeJsp.do
public String welcomeJsp( Model model){
	return "/welcome/index";
	
}

@RequestMapping("/commentJsp.do") //url
//url=http://localhost:8080/TravelDemo/loginController/commentJsp.do?username=wh&password=wh
public String commentJsp(HttpServletRequest request, HttpServletResponse response){
	String username = request.getParameter("username");//当前登录用户
	String password = request.getParameter("password");//密码
	User user = new User();
	user.setPassword(password);
	user.setUsername(username);
	List<User> userList =userService.doUserLogin(user);
	User userLogin = null;
	if(userList!=null&& userList.size()>0){
		userLogin = userList.get(0);
		if((userLogin.getPassword()).equals(password.trim())){//对的
			request.getSession().setAttribute("userLogin", userLogin);
			request.setAttribute("flag", "true");
		}else{
			request.setAttribute("flag", "false");
		}
	}

	List<DynamicContent> dclist = dynamicContentService.selectAllColumn();//动态内容表
	List<Commtent> ctlist= commtentService.selectAllCommtent(1);//评论回复表
	List<User> users = userService.selectAllUser();//用户表
	Map<Integer, String> userMap = new HashMap<Integer, String>();
	for(User u:users){
		userMap.put(u.getId(), u.getUsername());
	}
	request.setAttribute("userMap", userMap);
	request.setAttribute("dclist", dclist);//动态内容表
	request.setAttribute("ctlist", ctlist);//评论回复表
	return "/welcome/comment";
}
@RequestMapping("/mapJsp.do") //url
//url=http://localhost:8080/TravelDemo/loginController/mapJsp.do
public String mapJsp(HttpServletRequest request, HttpServletResponse response){
	return "/map/map";
}
}

