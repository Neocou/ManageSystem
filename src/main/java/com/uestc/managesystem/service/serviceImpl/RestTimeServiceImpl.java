package com.uestc.managesystem.service.serviceImpl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.RestTime;
import com.uestc.managesystem.mapper.RestTimeMapper;
import com.uestc.managesystem.service.serviceInter.RestTimeService;
@Service
public class RestTimeServiceImpl implements RestTimeService {

	@Autowired
	private RestTimeMapper restTimeMapper;
	@Override
	public String judge() {
		// TODO Auto-generated method stub
		Date today = new Date(System.currentTimeMillis());
		Calendar c= Calendar.getInstance();
		c.setTime(today);
		int weekday =c.get(Calendar.DAY_OF_WEEK);
		if(weekday==1||weekday==7){
			return "今天是休息日";
		}
		RestTime restTime = restTimeMapper.findNext();
		if(today.after(restTime.getStartTime())){
			return "今天是休息日";
		}
		return "今天是工作日";
	}
	@Override
	public List<RestTime> findAll() {
		// TODO Auto-generated method stub
		List<RestTime> restTimes  = restTimeMapper.findAll();
		return restTimes;
	}
	@Override
	public int delete(int restNum) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			i = restTimeMapper.deleteByPrimaryKey(restNum);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除休息日记录编号 "+restNum+ "失败");
		}
		return i;
	}
	@Override
	public int insert(RestTime restTime) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = restTimeMapper.insertSelective(restTime);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加休息日失败,请检查参数");
		}
		return i;
	}
	@Override
	public RestTime selectById(int id) {
		// TODO Auto-generated method stub
		RestTime restTime = restTimeMapper.selectByPrimaryKey(id);
		if(restTime==null){
			throw new RuntimeException("尝试编辑休息日失败");
		}
		return restTime;
	}
	@Override
	public int update(RestTime restTime) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = restTimeMapper.updateByPrimaryKeySelective(restTime);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新休息日失败,请检查参数");
		}
		return i;
	}

}
