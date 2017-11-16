package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Department;
import com.uestc.managesystem.mapper.DepartmentMapper;
import com.uestc.managesystem.service.serviceInter.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	/**
	 * 查询所有部门信息
	 */
	@Override
	public List<Department> findAll() {
		// TODO Auto-generated method stub
		List<Department> departments = departmentMapper.findAll();
		return departments;
	}

	/**
	 * 增加部门信息
	 * @param 部门信息
	 */
	@Override
	public int insert(Department department) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i  = departmentMapper.insertSelective(department);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加部门失败,请检查参数");
		}

		return i;
	}

	/**
	 * 删除部门模块
	 * @param 删除部门id
	 */
	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = departmentMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除部门失败,请检查参数");
		}

		return i;
	}

	
	/**
	 * 更新部门信息
	 * @param 更新的部门信息
	 */
	@Override
	public int update(Department department) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = departmentMapper.updateByPrimaryKeySelective(department);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新部门失败,请检查参数");
		}

		return i;
	}

	
	/**
	 * 查询指定部门信息
	 * @param 查询部门id
	 */
	@Override
	public Department selectById(int id) {
		// TODO Auto-generated method stub
		Department department = departmentMapper.selectByPrimaryKey(id);
		return department;
	}

}
