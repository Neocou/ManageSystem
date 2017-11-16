package com.uestc.managesystem.entity.dto;

public class QuestionSelect {

    private Integer quesLId;

    private String quesLName;

    private String answer;

	public Integer getQuesLId() {
		return quesLId;
	}

	public void setQuesLId(Integer quesLId) {
		this.quesLId = quesLId;
	}

	public String getQuesLName() {
		return quesLName;
	}

	public void setQuesLName(String quesLName) {
		this.quesLName = quesLName;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "QuestionSelect [quesLId=" + quesLId + ", quesLName=" + quesLName + ", answer=" + answer + "]";
	}
    
}
