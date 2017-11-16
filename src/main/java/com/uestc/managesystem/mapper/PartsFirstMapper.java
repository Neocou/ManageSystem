package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.PartsFirst;

public interface PartsFirstMapper {
    int deleteByPrimaryKey(Integer partBId);

    int insert(PartsFirst record);

    int insertSelective(PartsFirst record);

    PartsFirst selectByPrimaryKey(Integer partBId);

    int updateByPrimaryKeySelective(PartsFirst record);

    int updateByPrimaryKey(PartsFirst record);

	List<PartsFirst> findAll();
}