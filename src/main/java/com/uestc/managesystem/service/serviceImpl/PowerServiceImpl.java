package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Power;
import com.uestc.managesystem.mapper.PowerMapper;
import com.uestc.managesystem.service.serviceInter.PowerService;

@Service
public class PowerServiceImpl implements PowerService {

	@Autowired
	private PowerMapper  powerMapper;
	/**
	 * 查询所有权限
	 */
	@Override
	public List<Power> findAll() {
		// TODO Auto-generated method stub
		List<Power> powers = powerMapper.findAll();
		return powers;
	}

}
