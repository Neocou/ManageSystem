package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKeyWithBLOBs(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> findAll();

	List<Integer> getPower(Integer id);


	List<Integer> selectRight(List<Integer> role);
}