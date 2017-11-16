package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.model.Post;



public interface PostService {
	List<Post> findAll();
	int insert(Post post);
	int remove(int id);
	int update(Post post);
	Post selectById(int id);
}
