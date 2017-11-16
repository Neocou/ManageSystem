package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Cases;

public interface CasesService {

	List<Cases> findAllNo();

	int setTime(Cases cases);

	List<Cases> findAll();

}
