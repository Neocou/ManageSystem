package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Street;
import com.uestc.managesystem.entity.model.UserGrid;
import com.uestc.managesystem.mapper.StreetMapper;
import com.uestc.managesystem.mapper.UserGridMapper;
import com.uestc.managesystem.service.serviceInter.UserGridService;
@Service
public class UserGridServiceImpl implements UserGridService {

	@Autowired
	private UserGridMapper userGridMapper;
	@Autowired
	private StreetMapper streetMapper;



	/**
	 * 删除一条负责区块记录
	 */
	@Override
	public int delete(int userid, int grid) {
		// TODO Auto-generated method stub
		UserGrid userGrid = new UserGrid();
		userGrid.setGridId(grid);
		userGrid.setUserNumber(userid);
		int i = 0;
		try {
			i = userGridMapper.delete(userGrid);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除数据UserId:"+userid+" Grid"+grid+"失败");
		}
		return i;
	}

	/**
	 * 增加一条负责区块记录
	 */
	@Override
	public int add(int grid, int userid) {
		// TODO Auto-generated method stub
		UserGrid userGrid = new UserGrid();
		userGrid.setGridId(grid);
		userGrid.setUserNumber(userid);
		int i =0;
		try {
			 i = userGridMapper.insert(userGrid);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("分配用户:"+userid+"到区块Grid"+userid+"失败");
		}
		return i;
	}

	/**
	 * 查询所有街道信息
	 */
	@Override
	public List<Street> findAll() {
		// TODO Auto-generated method stub
		List<Street> streets = streetMapper.findAll();
		return streets;
	}

	/**
	 * 根据区块ID查询负责人
	 */
	@Override
	public List<Integer> selectUser(int grid) {
		// TODO Auto-generated method stub
		List<Integer> users = userGridMapper.getUsers(grid);
		return users;
	}

	/**
	 * 增加区块负责人
	 */
	@Override
	public int add(UserGrid userGrid) {
		// TODO Auto-generated method stub
		int i =0;
		try {
			 i = userGridMapper.insert(userGrid);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("分配用户:"+userGrid.getUserNumber()+"到区块Grid"+userGrid.getGridId()+"失败");
		}
		return i;
	}

}
