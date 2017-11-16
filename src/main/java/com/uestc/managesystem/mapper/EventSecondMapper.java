package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.EventSecond;

public interface EventSecondMapper {
    int deleteByPrimaryKey(Integer eventLId);

    int insert(EventSecond record);

    int insertSelective(EventSecond record);

    EventSecond selectByPrimaryKey(Integer eventLId);

    int updateByPrimaryKeySelective(EventSecond record);

    int updateByPrimaryKey(EventSecond record);

	List<EventSecond> findByFirst(Long i);
}