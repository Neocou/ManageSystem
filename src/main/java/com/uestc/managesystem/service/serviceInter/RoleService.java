package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Role;

public interface RoleService {

	List<Role> findAll();

	int insert(Role role);

	int remove(int id);

	Role selectById(int id);

	int update(Role role);






}
