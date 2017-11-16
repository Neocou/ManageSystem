package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Department;



public interface DepartmentService {
	List<Department> findAll();
	int insert(Department department);
	int remove(int id);
	int update(Department department);
	Department selectById(int id);
}
