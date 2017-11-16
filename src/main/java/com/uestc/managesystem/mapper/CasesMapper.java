package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Cases;

public interface CasesMapper {
    int deleteByPrimaryKey(Integer caseId);

    int insert(Cases record);

    int insertSelective(Cases record);

    Cases selectByPrimaryKey(Integer caseId);

    int updateByPrimaryKeySelective(Cases record);

    int updateByPrimaryKey(Cases record);

	List<Cases> findAllNo();

	List<Cases> findAll();
}