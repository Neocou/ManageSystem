package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.RestTime;

public interface RestTimeMapper {
    int deleteByPrimaryKey(Integer restNum);

    int insert(RestTime record);

    int insertSelective(RestTime record);

    RestTime selectByPrimaryKey(Integer restNum);

    int updateByPrimaryKeySelective(RestTime record);

    int updateByPrimaryKey(RestTime record);

	RestTime findNext();

	List<RestTime> findAll();
}