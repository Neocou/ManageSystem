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
	
	@Transactional
	@Override
	public int updateusers(int[] userids, int roleid) {
		// TODO Auto-generated method stub
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

}
