package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.mapper.UserMapper;
import com.uestc.managesystem.service.serviceInter.OnlineService;

@Service
public class OnlineServiceImpl implements OnlineService {

	@Autowired
	private UserMapper userMapper;
	/**
	 * 查询所有用户
	 */
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findAllUser();
		return users;
	}

	/**
	 * 根据状态查询用户
	 */
	@Override
	public List<User> findByStatus(String status) {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findByStatus(status);
		return users;
	}

	/**
	 * 查询所有用户状态
	 */
	@Override
	public List<User> findAllByStatus() {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findAllByStatus();
		return users;
	}

}
