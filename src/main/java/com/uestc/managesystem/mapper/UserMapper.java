package com.uestc.managesystem.mapper;

import java.util.List;


import com.uestc.managesystem.entity.dto.UserSelect;
import com.uestc.managesystem.entity.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userNumber);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userNumber);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByName(String name);

	List<User> selectByDepartmentId(int departmentId);

	User selectByUser(User user);

	List<User> findAllUser();

	List<User> selectByPostId(int postId);


	User selectByUser(int id);
	List<User> userSelect(UserSelect userSelect);

	User selectById(int id);





	void setOnline(User userInfo);

	void setOffline(User userInfo);

	List<User> findAllByStatus();

	List<User> userSelectCommon(UserSelect userSelect);

	List<User> findAllUserCommon();

	List<User> findAllUserAdmin();

	List<Integer> findAllUserByRole(Integer id);

	void setStatus(User userinfo);

	List<User> findOffline();

	List<User> findOnline();

}