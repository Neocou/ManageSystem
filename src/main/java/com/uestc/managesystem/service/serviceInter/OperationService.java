package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.OperationRecord;
import com.uestc.managesystem.entity.model.User;

public interface OperationService {

	List<OperationRecord> findAll();

	List<OperationRecord> findByName(String name);

	List<OperationRecord> findById(Integer userNumber);

	List<OperationRecord> findByUser(User user);

}
