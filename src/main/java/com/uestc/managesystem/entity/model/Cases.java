package com.uestc.managesystem.entity.model;

public class Cases {
    private Integer caseId;

    private Integer eventLId;

    private Integer partLId;

    private Integer gridId;

    private String stage;

    private Integer timeLimit;

    private String caseDescribe;

    public Integer getCaseId() {
        return caseId;
    }

    public void setCaseId(Integer caseId) {
        this.caseId = caseId;
    }

    public Integer getEventLId() {
        return eventLId;
    }

    public void setEventLId(Integer eventLId) {
        this.eventLId = eventLId;
    }

    public Integer getPartLId() {
        return partLId;
    }

    public void setPartLId(Integer partLId) {
        this.partLId = partLId;
    }

    public Integer getGridId() {
        return gridId;
    }

    public void setGridId(Integer gridId) {
        this.gridId = gridId;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage == null ? null : stage.trim();
    }

    public Integer getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(Integer timeLimit) {
        this.timeLimit = timeLimit;
    }

    public String getCaseDescribe() {
        return caseDescribe;
    }

    public void setCaseDescribe(String caseDescribe) {
        this.caseDescribe = caseDescribe == null ? null : caseDescribe.trim();
    }

	@Override
	public String toString() {
		return "Cases [caseId=" + caseId + ", eventLId=" + eventLId + ", partLId=" + partLId + ", gridId=" + gridId
				+ ", stage=" + stage + ", timeLimit=" + timeLimit + ", caseDescribe=" + caseDescribe + "]";
	}
}