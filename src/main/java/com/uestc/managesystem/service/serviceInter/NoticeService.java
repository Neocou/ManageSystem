package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Notice;

public interface NoticeService {

	List<Notice> findAll();

	Notice selectNotice(int noticeid);

	int update(Notice notice);

	int delete(int noticeid);

	int insert(Notice notice);

}
