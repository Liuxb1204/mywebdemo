package com.dancer.service;

import com.dancer.entity.User;

public interface UserService {
	public void addUser(User user);
	public User queryName(String username);
	public void Xiugaipsw(String username,String password);
}
