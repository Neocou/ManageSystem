package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.RolePower;

public interface PowerRoleService {

	List<Integer> selectPowers(int roleid);


	Integer countPower(int roleid);


	Integer removeAll(int roleid);


	int insert(RolePower rolePower);


	int updatePowers(int[] powers, int roleid);

}
