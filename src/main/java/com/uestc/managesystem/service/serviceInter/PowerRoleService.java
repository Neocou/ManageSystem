package com.uestc.managesystem.service.serviceInter;

import java.util.List;

public interface PowerRoleService {

	List<Integer> selectPowers(int roleid);



	int updatePowers(int[] powers, int roleid);

}
