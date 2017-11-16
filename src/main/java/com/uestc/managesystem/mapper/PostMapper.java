package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Post;

public interface PostMapper {
    int deleteByPrimaryKey(Integer postNum);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postNum);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKeyWithBLOBs(Post record);

    int updateByPrimaryKey(Post record);

	List<Post> findAll();
}