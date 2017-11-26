package com.uestc.managesystem.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.managesystem.entity.model.RolePower;
import com.uestc.managesystem.mapper.RolePowerMapper;
import com.uestc.managesystem.service.serviceInter.PowerRoleService;

@Service
public class PowerRoleServiceImpl implements PowerRoleService {

	@Autowired
	private RolePowerMapper rolePowerMapper;
	
	/**
	 * 根据角色ID查询权限
	 */
	@Override
	public List<Integer> selectPowers(int roleid) {
		// TODO Auto-generated method stub
		List<Integer> powers = rolePowerMapper.getPowers(roleid);
		return powers;

	}

	
	/**
	 * 更新角色权限
	 */
	@Transactional
	@Override
	public int updatePowers(int[] powers, int roleid) {
		// TODO Auto-generated method stub
		 rolePowerMapper.removeAll(roleid);
		 List<RolePower> rolePowers = new ArrayList<>();
			for(int power:powers){
				RolePower rolePower = new RolePower();
				rolePower.setRoleId(roleid);
				rolePower.setPowerId(power);
				rolePowers.add(rolePower);
			}
			int i = rolePowerMapper.insertAll(rolePowers);
			return i;
	}

}
