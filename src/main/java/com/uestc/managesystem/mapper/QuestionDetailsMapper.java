package com.uestc.managesystem.mapper;

import java.util.List;

import com.uestc.managesystem.entity.dto.QuestionSelect;
import com.uestc.managesystem.entity.model.QuestionDetails;

public interface QuestionDetailsMapper {
    int deleteByPrimaryKey(Integer quesLId);

    int insert(QuestionDetails record);

    int insertSelective(QuestionDetails record);

    QuestionDetails selectByPrimaryKey(Integer quesLId);

    int updateByPrimaryKeySelective(QuestionDetails record);

    int updateByPrimaryKeyWithBLOBs(QuestionDetails record);

    int updateByPrimaryKey(QuestionDetails record);

	List<QuestionDetails> select(Long i);

	List<QuestionDetails> selectByName(String str);

	List<QuestionDetails> findAllDetail();

	List<QuestionDetails> questionSelect(QuestionSelect questionSelect);
}