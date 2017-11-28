package com.uestc.managesystem.service.serviceInter;

import java.util.List;

public interface UserRoleService {

	int updateusers(int[] userids, int roleid);

	List<Integer> selectRoles(int id);

	int updateroles(int[] roleId, int userid);

}
