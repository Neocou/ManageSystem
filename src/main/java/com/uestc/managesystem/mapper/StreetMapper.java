package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Street;

public interface StreetMapper {
    int deleteByPrimaryKey(Integer streetId);

    int insert(Street record);

    int insertSelective(Street record);

    Street selectByPrimaryKey(Integer streetId);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKeyWithBLOBs(Street record);

    int updateByPrimaryKey(Street record);

	List<Street> findAll();
}