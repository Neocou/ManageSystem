package com.uestc.managesystem.mapper;

import com.uestc.managesystem.entity.model.Community;

public interface CommunityMapper {
    int deleteByPrimaryKey(Integer communityId);

    int insert(Community record);

    int insertSelective(Community record);

    Community selectByPrimaryKey(Integer communityId);

    int updateByPrimaryKeySelective(Community record);

    int updateByPrimaryKeyWithBLOBs(Community record);

    int updateByPrimaryKey(Community record);
}