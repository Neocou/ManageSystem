package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.QuestionFirst;

public interface QuestionFirstMapper {
    int deleteByPrimaryKey(Integer quesBId);

    int insert(QuestionFirst record);

    int insertSelective(QuestionFirst record);

    QuestionFirst selectByPrimaryKey(Integer quesBId);

    int updateByPrimaryKeySelective(QuestionFirst record);

    int updateByPrimaryKey(QuestionFirst record);

	List<QuestionFirst> findAll();
}