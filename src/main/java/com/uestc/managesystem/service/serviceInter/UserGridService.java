package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Street;
import com.uestc.managesystem.entity.model.UserGrid;

public interface UserGridService {





	int delete(int userid, int grid);

	int add(int grid, int userid);

	List<Street> findAll();

	List<Integer> selectUser(int grid);

	int add(UserGrid userGrid);

}
