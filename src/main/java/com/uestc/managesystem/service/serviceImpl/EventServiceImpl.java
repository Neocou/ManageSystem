package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.EventFirst;
import com.uestc.managesystem.entity.model.EventSecond;
import com.uestc.managesystem.mapper.EventFirstMapper;
import com.uestc.managesystem.mapper.EventSecondMapper;
import com.uestc.managesystem.service.serviceInter.EventService;


@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventSecondMapper eventSecondMapper;
	
	@Autowired
	private EventFirstMapper eventFirstMapper;
	

	/**
	 * 查询所有事件分类
	 */
	@Override
	public List<EventFirst> findAll() {
		// TODO Auto-generated method stub
		List<EventFirst> result = eventFirstMapper.findAll();

		return result;
	}

	/**
	 * 根据Id查询事件分类
	 */
	@Override
	public EventSecond selectById(int eventid) {
		// TODO Auto-generated method stub
		EventSecond event = eventSecondMapper.selectByPrimaryKey(eventid);
		return event;
	}

	/**
	 * 更新事件分类
	 */
	@Override
	public int update(EventSecond eventSecond) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = eventSecondMapper.updateByPrimaryKeySelective(eventSecond);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新事件失败,请检查数据");
		}
		return i;
	}

	/**
	 * 删除事件分类
	 */
	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = eventSecondMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除事件失败,请检查数据");
		}
		return i;
	}

	/**
	 * 新增事件分类
	 */
	@Override
	public int insert(EventSecond eventSecond) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = eventSecondMapper.insertSelective(eventSecond);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加事件失败,请检查数据");
		}

		return i;
	}

}
