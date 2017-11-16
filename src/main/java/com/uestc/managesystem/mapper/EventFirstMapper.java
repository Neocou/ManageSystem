package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.EventFirst;

public interface EventFirstMapper {
    int deleteByPrimaryKey(Integer eventBId);

    int insert(EventFirst record);

    int insertSelective(EventFirst record);

    EventFirst selectByPrimaryKey(Integer eventBId);

    int updateByPrimaryKeySelective(EventFirst record);

    int updateByPrimaryKey(EventFirst record);

	List<EventFirst> findAll();
}