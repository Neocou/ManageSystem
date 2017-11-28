package com.uestc.managesystem.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.managesystem.entity.model.UserRole;
import com.uestc.managesystem.mapper.UserRoleMapper;
import com.uestc.managesystem.service.serviceInter.UserRoleService;
@Service
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleMapper userRoleMapper;
	
	/**
	 * 角色批量分配用户
	 */
	@Transactional
	@Override
	public int updateusers(int[] userids, int roleid) {
		// TODO Auto-generated method stub
		userRoleMapper.removeAll(roleid);
		List<UserRole> userRoles = new ArrayList<>();
		for(int userid :userids){
			UserRole userRole = new UserRole();
			userRole.setRoleId(roleid);
			userRole.setUserNumber(userid);
			userRoles.add(userRole);
		}
		int i = userRoleMapper.insertAll(userRoles);
		return i;
	}

	/**
	 * 根据用户ID查看角色
	 */
	@Override
	public List<Integer> selectRoles(int id) {
		// TODO Auto-generated method stub
		List<Integer> roles = userRoleMapper.selectRoleId(id);
		return roles;
	}

	/**
	 * 用户批量分配角色
	 */
	@Transactional
	@Override
	public int updateroles(int[] roleIds, int userid) {
		// TODO Auto-generated method stub
		userRoleMapper.removeAllByUser(userid);
		List<UserRole> userRoles = new ArrayList<>();
		for(int roleId :roleIds){
			UserRole userRole = new UserRole();
			userRole.setRoleId(roleId);
			userRole.setUserNumber(userid);
			userRoles.add(userRole);
		}
		int i = userRoleMapper.insertAll(userRoles);
		return i;
	}

}
