package com.uestc.managesystem.mapper;

import com.uestc.managesystem.entity.model.Grid;

public interface GridMapper {
    int deleteByPrimaryKey(Integer gridId);

    int insert(Grid record);

    int insertSelective(Grid record);

    Grid selectByPrimaryKey(Integer gridId);

    int updateByPrimaryKeySelective(Grid record);

    int updateByPrimaryKeyWithBLOBs(Grid record);

    int updateByPrimaryKey(Grid record);
}