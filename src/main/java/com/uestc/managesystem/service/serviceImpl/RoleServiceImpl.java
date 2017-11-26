package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Role;
import com.uestc.managesystem.mapper.RoleMapper;
import com.uestc.managesystem.service.serviceInter.RoleService;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	/**
	 * 查询所有角色
	 */
	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		List<Role> roles = roleMapper.findAll();
		return roles;
	}

	/**
	 * 新增角色
	 */
	@Override
	public int insert(Role role) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = roleMapper.insertSelective(role);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加角色失败,请检查参数");
		}
		return i;
	}

	/**
	 * 根据ID删除角色
	 */
	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = roleMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除角色失败,请检查参数");
		}
		return i;
	}

	/**
	 * 根据ID查询角色
	 */
	@Override
	public Role selectById(int id) {
		// TODO Auto-generated method stub
		Role role = roleMapper.selectByPrimaryKey(id);

		return role;
	}

	/**
	 * 更新角色
	 */
	@Override
	public int update(Role role) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = roleMapper.updateByPrimaryKeySelective(role);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新角色失败,请检查参数");
		}
		return i;
	}



}
