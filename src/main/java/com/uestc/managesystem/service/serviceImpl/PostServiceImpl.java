package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.model.Post;
import com.uestc.managesystem.mapper.PostMapper;
import com.uestc.managesystem.service.serviceInter.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper postMapper;
	
	
	@Override
	public List<Post> findAll() {
		// TODO Auto-generated method stub
		List<Post> posts = postMapper.findAll();
		return posts;
	}

	@Override
	public int insert(Post post) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = postMapper.insertSelective(post);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加岗位失败,请检查参数");
		}
		return i;
	}

	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = postMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除岗位失败,请检查参数");
		}

		return i;
	}

	@Override
	public int update(Post post) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = postMapper.updateByPrimaryKeySelective(post);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新岗位失败,请检查参数");
		}
		return i;
	}

	@Override
	public Post selectById(int id) {
		// TODO Auto-generated method stub
		Post post = postMapper.selectByPrimaryKey(id);
		return post;
	}

}
