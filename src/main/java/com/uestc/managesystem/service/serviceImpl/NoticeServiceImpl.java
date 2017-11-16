package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Notice;
import com.uestc.managesystem.mapper.NoticeMapper;
import com.uestc.managesystem.service.serviceInter.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<Notice> findAll() {
		// TODO Auto-generated method stub
		List<Notice> notices = noticeMapper.findAll();
		return notices;
	}

	@Override
	public Notice selectNotice(int noticeid) {
		// TODO Auto-generated method stub
		Notice notice  = noticeMapper.selectByPrimaryKey(noticeid);
		return notice;
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = noticeMapper.updateByPrimaryKeySelective(notice);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新公告失败,请检查参数");
		}
		return i;
	}

	@Override
	public int delete(int noticeid) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = noticeMapper.deleteByPrimaryKey(noticeid);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除公告失败,请检查参数");
		}
		return i;
	}

	@Override
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = noticeMapper.insertSelective(notice);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加公告失败,请检查参数");
		}
		return i;
	}

}
