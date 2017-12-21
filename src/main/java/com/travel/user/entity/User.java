
package com.travel.user.entity;

import java.util.Date;

public class User {
	private String username;
	private String password;
	private int id;
	private Date daytime;
	private String isdelete;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDaytime() {
		return daytime;
	}
	public void setDaytime(Date daytime) {
		this.daytime = daytime;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password = password;
	}
}

