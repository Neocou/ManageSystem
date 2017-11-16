package com.uestc.managesystem.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uestc.managesystem.entity.dto.QuestionSelect;
import com.uestc.managesystem.entity.model.QuestionDetails;
import com.uestc.managesystem.entity.model.QuestionFirst;
import com.uestc.managesystem.mapper.QuestionDetailsMapper;
import com.uestc.managesystem.mapper.QuestionFirstMapper;
import com.uestc.managesystem.service.serviceInter.QuestionService;
@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDetailsMapper questionDetailsMapper;
	
	@Autowired
	private QuestionFirstMapper questionFirstMapper;

	@Override
	public List<QuestionFirst> findAll() {
		// TODO Auto-generated method stub
		List<QuestionFirst> result = questionFirstMapper.findAll();
		return result;
	}

	@Override
	public List<QuestionDetails> select(String str) {
		// TODO Auto-generated method stub
		List<QuestionDetails> result = questionDetailsMapper.selectByName(str);
		return result;
	}

	@Override
	public QuestionDetails selectById(int questionid) {
		// TODO Auto-generated method stub
		QuestionDetails questions = questionDetailsMapper.selectByPrimaryKey(questionid);
		return questions;
	}

	@Override
	public int update(QuestionDetails questionDetails) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = questionDetailsMapper.updateByPrimaryKeySelective(questionDetails);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("更新问题  "+questionDetails.getQuesLId()+" 失败,请检查参数");
		}
		return i;
	}

	@Override
	public int insert(QuestionDetails questionDetails) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			System.out.println(questionDetails);
			i = questionDetailsMapper.insertSelective(questionDetails);
			System.out.println(i);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("添加问题失败,请检查参数");
		}
		return i;
	}

	@Override
	public int remove(int id) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			i = questionDetailsMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("删除问题失败,请检查参数");
		}
		return i;
	}

	@Override
	public List<QuestionDetails> findAllDetail() {
		// TODO Auto-generated method stub
		List<QuestionDetails> result = questionDetailsMapper.findAllDetail();
		return result;
	}

	@Override
	public List<QuestionDetails> questionSelect(QuestionSelect questionSelect) {
		// TODO Auto-generated method stub
		List<QuestionDetails> result = questionDetailsMapper.questionSelect(questionSelect);
		return result;
	}

}
