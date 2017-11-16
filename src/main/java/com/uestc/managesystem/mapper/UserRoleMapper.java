package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.UserRole;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);

	List<Integer> selectRoleId(Integer userNumber);

	int insertAll(List<UserRole> userRoles);
}