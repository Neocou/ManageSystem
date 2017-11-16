package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.User;

public interface OnlineService {

	List<User> findAll();

	List<User> findByStatus(String status);

	List<User> findAllByStatus();

}
