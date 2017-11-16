package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.EventFirst;
import com.uestc.managesystem.entity.model.EventSecond;

public interface EventService {

	List<EventFirst> findAll();

	EventSecond selectById(int eventid);

	int update(EventSecond eventSecond);

	int remove(int id);

	int insert(EventSecond eventSecond);

}
