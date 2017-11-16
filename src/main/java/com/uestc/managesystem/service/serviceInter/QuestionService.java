package com.uestc.managesystem.service.serviceInter;

import java.util.List;

import com.uestc.managesystem.entity.dto.QuestionSelect;
import com.uestc.managesystem.entity.model.QuestionDetails;
import com.uestc.managesystem.entity.model.QuestionFirst;

public interface QuestionService {

	List<QuestionFirst> findAll();

	List<QuestionDetails> select(String str);

	QuestionDetails selectById(int questionid);

	int update(QuestionDetails questionDetails);

	int insert(QuestionDetails questionDetails);

	int remove(int id);

	List<QuestionDetails> findAllDetail();

	List<QuestionDetails> questionSelect(QuestionSelect questionSelect);




}
