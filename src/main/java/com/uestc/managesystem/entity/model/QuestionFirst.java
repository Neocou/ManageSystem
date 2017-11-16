package com.uestc.managesystem.entity.model;

import java.util.List;

public class QuestionFirst {
    private Integer quesBId;

    private String quesBName;
    
    private List<QuestionDetails> questionDetails;

    public Integer getQuesBId() {
        return quesBId;
    }

    public void setQuesBId(Integer quesBId) {
        this.quesBId = quesBId;
    }

    public String getQuesBName() {
        return quesBName;
    }

    public void setQuesBName(String quesBName) {
        this.quesBName = quesBName == null ? null : quesBName.trim();
    }

	public List<QuestionDetails> getQuestionDetails() {
		return questionDetails;
	}

	public void setQuestionDetails(List<QuestionDetails> questionDetails) {
		this.questionDetails = questionDetails;
	}

	@Override
	public String toString() {
		return "QuestionFirst [quesBId=" + quesBId + ", quesBName=" + quesBName + ", questionDetails=" + questionDetails
				+ "]";
	}


}