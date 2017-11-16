package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.model.OperationRecord;
import com.uestc.managesystem.entity.model.User;

public interface OperationRecordMapper {
    int deleteByPrimaryKey(Integer operationId);

    int insert(OperationRecord record);

    int insertSelective(OperationRecord record);

    OperationRecord selectByPrimaryKey(Integer operationId);

    int updateByPrimaryKeySelective(OperationRecord record);

    int updateByPrimaryKey(OperationRecord record);

	List<OperationRecord> findAll();

	List<OperationRecord> findByName(String name);

	List<OperationRecord> findById(Integer userNumber);

	List<OperationRecord> findByUser(User user);
}