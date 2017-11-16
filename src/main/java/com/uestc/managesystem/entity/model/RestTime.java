package com.uestc.managesystem.entity.model;

import java.sql.Date;

public class RestTime {
    private Integer restNum;

    private Date startTime;

    private Date endTime;

    public Integer getRestNum() {
        return restNum;
    }

    public void setRestNum(Integer restNum) {
        this.restNum = restNum;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

	@Override
	public String toString() {
		return "RestTime [restNum=" + restNum + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
}