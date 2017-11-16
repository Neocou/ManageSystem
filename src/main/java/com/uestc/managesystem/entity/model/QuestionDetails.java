package com.uestc.managesystem.entity.model;

public class QuestionDetails {
    private Integer quesLId;

    private Integer quesBId;

    private String quesLName;

    private String answer;

    public Integer getQuesLId() {
        return quesLId;
    }

    public void setQuesLId(Integer quesLId) {
        this.quesLId = quesLId;
    }

    public Integer getQuesBId() {
        return quesBId;
    }

    public void setQuesBId(Integer quesBId) {
        this.quesBId = quesBId;
    }

    public String getQuesLName() {
        return quesLName;
    }

    public void setQuesLName(String quesLName) {
        this.quesLName = quesLName == null ? null : quesLName.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

	@Override
	public String toString() {
		return "QuestionDetails [quesLId=" + quesLId + ", quesBId=" + quesBId + ", quesLName=" + quesLName + ", answer="
				+ answer + "]";
	}
}