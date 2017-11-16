package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.OperationRecord;
import com.uestc.managesystem.entity.model.User;
import com.uestc.managesystem.mapper.OperationRecordMapper;
import com.uestc.managesystem.service.serviceInter.OperationService;

@Service
public class OperationServiceImpl implements OperationService {

	@Autowired
	private OperationRecordMapper operationRecordMapper;
	
	@Override
	public List<OperationRecord> findAll() {
		// TODO Auto-generated method stub
		List<OperationRecord> records  = operationRecordMapper.findAll();
		return records;
	}

	@Override
	public List<OperationRecord> findByName(String name) {
		// TODO Auto-generated method stub
		List<OperationRecord> records  = operationRecordMapper.findByName(name);
		return records;
	}

	@Override
	public List<OperationRecord> findById(Integer userNumber) {
		// TODO Auto-generated method stub
		List<OperationRecord> records  = operationRecordMapper.findById(userNumber);
		return records;
	}

	@Override
	public List<OperationRecord> findByUser(User user) {
		// TODO Auto-generated method stub
		List<OperationRecord> records  = operationRecordMapper.findByUser(user);
		return records;
	}

}
