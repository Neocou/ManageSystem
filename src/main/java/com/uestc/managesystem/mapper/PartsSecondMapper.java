package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.PartsSecond;

public interface PartsSecondMapper {
    int deleteByPrimaryKey(Integer partLId);

    int insert(PartsSecond record);

    int insertSelective(PartsSecond record);

    PartsSecond selectByPrimaryKey(Integer partLId);

    int updateByPrimaryKeySelective(PartsSecond record);

    int updateByPrimaryKey(PartsSecond record);


	List<PartsSecond> findByFirst(Long i);
}