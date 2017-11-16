package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;



public interface UserService {
	Integer updateUser(User user);
	List<User> getUsers();
	User getUsersByJobName(String jobName);
	List<User> getUsersByDepartmentId(int departmentId);
	List<User> getUsersByPost(int postId);
	Integer delUser(int id);
	User login(User user);
	User addUser(User user);
	User getUserInfo(int id);
	List<User> selectAll();
	List<User> userSelect(UserSelect userSelect);
	User selectByPrimaryKey(int id);
	int changePassword(User user, String newPassword, String surePassword);
	void setOnline(User userResult);
	void setOffline(User userResult);
}
