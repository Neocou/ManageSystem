package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.PartsFirst;
import com.uestc.managesystem.entity.model.PartsSecond;

public interface PartService {

	List<PartsFirst> findAll();

	PartsSecond selectById(int partid);

	int update(PartsSecond partsSecond);

	int insert(PartsSecond partsSecond);

	int remove(int id);

}
