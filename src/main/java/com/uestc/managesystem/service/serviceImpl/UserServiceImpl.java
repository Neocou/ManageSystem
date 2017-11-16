package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.mapper.UserMapper;
import com.uestc.managesystem.service.serviceInter.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	

	
	



	@Override
	public Integer updateUser(User user) {
		try {
			 userMapper.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新用户信息失败,请查看数据是否正确");
		}
		return 1;

	}

	@Override
	public Integer delUser(int id) {
		// TODO Auto-generated method stub
		int i =	userMapper.deleteByPrimaryKey(id);
		return i;
	}


	@Override
	public User getUsersByJobName(String Name) {
		// TODO Auto-generated method stub
		return userMapper.selectByName(Name);
	}

	@Override
	public List<User> getUsersByDepartmentId(int departmentId) {
		// TODO Auto-generated method stub
		return userMapper.selectByDepartmentId(departmentId);
	}


	@Override
	public User login(User user) {
		User userResult=userMapper.selectByUser(user);
			return userResult;

	}

	@Override
	public List<User> getUsers() {
		List<User> users = userMapper.findAllUser();
		
		return users;
	}

	@Override
	public List<User> getUsersByPost(int postId) {
		// TODO Auto-generated method stub
		return userMapper.selectByPostId(postId);
	}

	@Override
	public User addUser(User user) {
		// TODO Auto-generated method stub
		try {
			userMapper.insertSelective(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加用户失败,请查看数据是否正确");
		}
		return user;
	}

	@Override
	public User getUserInfo(int id) {
		// TODO Auto-generated method stub
		User userInfo = userMapper.selectById(id);
		if(userInfo==null){
			throw new RuntimeException("没有查到此用户ID"+id);
		}
		else{
			return userInfo;
		}
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findAllUserResult();
		return users;
	}

	@Override
	public List<User> userSelect(UserSelect userSelect) {
		// TODO Auto-generated method stub
		List<User> result = userMapper.userSelect(userSelect);
		return result;
	}

	@Override
	public User selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}


	@Override
	public int changePassword(User user,String newPassword, String surePassword) {
		// TODO Auto-generated method stub
		if(!newPassword.equals(surePassword)){
			return 0;
		}
		else{
			user.setPassWord(newPassword);
			int i =0;
			try {
				i = userMapper.updateByPrimaryKeySelective(user);
			} catch (Exception e) {
				// TODO: handle exception
				throw new RuntimeException("修改密码失败,请查看数据是否正确");
			}
			
			return i;
		}
	}

	@Override
	public void setOnline(User userResult) {
		// TODO Auto-generated method stub
		try {
			userMapper.setOnline(userResult);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void setOffline(User userResult) {
		// TODO Auto-generated method stub
		try {
			userMapper.setOffline(userResult);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	
}
