package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.RestTime;

public interface RestTimeService {

	String judge();

	List<RestTime> findAll();

	int delete(int restNum);

	int insert(RestTime restTime);

	RestTime selectById(int id);

	int update(RestTime restTime);

}
