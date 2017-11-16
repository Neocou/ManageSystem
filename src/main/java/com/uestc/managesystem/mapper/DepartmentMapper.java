package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer departmentNum);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer departmentNum);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

	List<Department> findAll();
}