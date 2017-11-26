package com.uestc.managesystem.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Grid;
import com.uestc.managesystem.mapper.GridMapper;
import com.uestc.managesystem.service.serviceInter.GridService;

@Service
public class GridServiceImpl implements GridService {

	@Autowired
	private GridMapper gridMapper;
	/**
	 * 根据ID查询区块
	 */
	@Override
	public Grid selectByPrimaryKey(Integer gridId) {
		// TODO Auto-generated method stub
		Grid grid = gridMapper.selectByPrimaryKey(gridId);
		return grid;
	}

}
