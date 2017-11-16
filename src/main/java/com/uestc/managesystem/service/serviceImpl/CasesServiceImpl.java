package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Cases;
import com.uestc.managesystem.mapper.CasesMapper;
import com.uestc.managesystem.service.serviceInter.CasesService;

@Service
public class CasesServiceImpl implements CasesService {

	@Autowired
	private CasesMapper casesMapper;
	
	/**
	 * 查询所有未进行的案件
	 */
	@Override
	public List<Cases> findAllNo() {
		// TODO Auto-generated method stub
		List<Cases> cases = casesMapper.findAllNo();
		return cases;
	}

	/**
	 * 设置案件限时
	 * @param 案件信息
	 */
	@Override
	public int setTime(Cases cases) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			 i = casesMapper.updateByPrimaryKeySelective(cases);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;
	}

	/**
	 * 查询所有案件(任何状态)
	 */
	@Override
	public List<Cases> findAll() {
		// TODO Auto-generated method stub
		List<Cases> cases = casesMapper.findAll();
		return cases;
	}

}
