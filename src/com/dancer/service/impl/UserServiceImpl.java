package com.dancer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dancer.entity.User;
import com.dancer.service.UserService;
import com.dancer.dao.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userdao;
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userdao.insertUser(user);
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public User queryByName(User user) {
		// TODO Auto-generated method stub
		User byName = userdao.selectByName(user);
		return byName;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public User queryName(String username) {
		// TODO Auto-generated method stub
		User selectName = userdao.selectName(username);
		return selectName;
	}
	public void Xiugaipsw(String username, String password) {
		// TODO Auto-generated method stub
		userdao.Changepsw(username, password);	
	}
}
