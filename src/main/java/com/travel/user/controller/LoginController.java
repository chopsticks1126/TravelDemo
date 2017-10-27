
package com.travel.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.user.entity.User;
import com.travel.user.service.impl.MsgInfoServiceImpl;
import com.travel.user.service.impl.UserServiceImpl;


@Controller
@RequestMapping("/loginController") 
public class LoginController {
	@Autowired
	private UserServiceImpl userService;
	private MsgInfoServiceImpl msgInfoService;

@RequestMapping("/dologin.do") //url
//url=http://localhost:8080/TravelDemo/loginController/dologin.do
public String dologin(User user, Model model){
	if(userService.doUserLogin(user)){
		model.addAttribute("successMsg", "");
		model.addAttribute("name", user.getUsername());
		return "/success";//
	}else{
		model.addAttribute("failMsg", "失败");
		return "/fail";
	}	
}

@RequestMapping("/welcomeJsp.do") //url
//url=http://localhost:8080/TravelDemo/loginController/welcomeJsp.do
public String welcomeJsp( Model model){
	return "/welcome/index";
	
}
}

