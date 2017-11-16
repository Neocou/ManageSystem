package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.RolePower;

public interface RolePowerMapper {
    int insert(RolePower record);

    int insertSelective(RolePower record);

	List<Integer> getPowers(int roleid);

	int removeAll(int roleid);


	int insertAll(List<RolePower> rolePowers);

	List<Integer> selectRight(List<Integer> role);
}