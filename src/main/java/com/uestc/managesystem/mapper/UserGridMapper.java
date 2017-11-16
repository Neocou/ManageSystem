package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.UserGrid;

public interface UserGridMapper {
    int insert(UserGrid record);

    int insertSelective(UserGrid record);

	List<Integer> selectGridId(Integer userNumber);

	List<Integer> getUsers(int i);



	int delete(UserGrid userGrid);

}