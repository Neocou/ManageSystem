package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Integer powerId);

    int insert(Power record);

    int insertSelective(Power record);

    Power selectByPrimaryKey(Integer powerId);

    int updateByPrimaryKeySelective(Power record);

    int updateByPrimaryKeyWithBLOBs(Power record);

    int updateByPrimaryKey(Power record);

	List<Power> findAll();
}