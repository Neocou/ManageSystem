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
	

	
	



	/**
	 * 更新用户信息
	 */
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

	/**
	 * 根据ID删除用户
	 */
	@Override
	public Integer delUser(int id) {
		// TODO Auto-generated method stub
		int i =	userMapper.deleteByPrimaryKey(id);
		return i;
	}


	/**
	 * 根据姓名查询用户
	 */
	@Override
	public User getUsersByJobName(String Name) {
		// TODO Auto-generated method stub
		return userMapper.selectByName(Name);
	}

	/**
	 * 根据部门ID查询用户
	 */
	@Override
	public List<User> getUsersByDepartmentId(int departmentId) {
		// TODO Auto-generated method stub
		return userMapper.selectByDepartmentId(departmentId);
	}


	/**
	 * 用户登陆查询
	 */
	@Override
	public User login(User user) {
		User userResult=userMapper.selectByUser(user);
			return userResult;

	}

	/**
	 * 查询所有用户
	 */
	@Override
	public List<User> getUsers() {
		List<User> users = userMapper.findAllUser();
		
		return users;
	}

	/**
	 * 根据岗位ID查询用户
	 */
	@Override
	public List<User> getUsersByPost(int postId) {
		// TODO Auto-generated method stub
		return userMapper.selectByPostId(postId);
	}

	/**
	 * 增加用户
	 */
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

	/**
	 * 根据用户ID查询用户信息
	 */
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



	/**
	 * 多条件查询用户
	 */
	@Override
	public List<User> userSelect(UserSelect userSelect) {
		// TODO Auto-generated method stub
		List<User> result = userMapper.userSelect(userSelect);
		return result;
	}

	/**
	 * 根据用户ID查询用户
	 */
	@Override
	public User selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	
	/**
	 * 更改密码
	 */
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

	/**
	 * 设置用户在线
	 */
	@Override
	public void setOnline(User userResult) {
		// TODO Auto-generated method stub
		try {
			userMapper.setOnline(userResult);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	/**
	 * 设置用户离线
	 */
	@Override
	public void setOffline(User userResult) {
		// TODO Auto-generated method stub
		try {
			userMapper.setOffline(userResult);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * 公共多条件查询用户
	 */
	@Override
	public List<User> userSelectCommon(UserSelect userSelect) {
		// TODO Auto-generated method stub
		List<User> result = userMapper.userSelectCommon(userSelect);
		return result;
	}

	/**
	 * 公共查询所有用户
	 */
	@Override
	public List<User> selectAllCommon() {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findAllUserCommon();
		return users;
	}

	/**
	 * 管理员查询所有用户
	 */
	@Override
	public List<User> selectAllAdmin() {
		// TODO Auto-generated method stub
		List<User> users = userMapper.findAllUserAdmin();
		return users;
	}


	
}
