package com.uestc.managesystem.entity.model;

import java.util.List;

public class EventFirst {
    private Integer eventBId;

    private String eventBName;
    
    private List<EventSecond>  eventSeconds;

    public Integer getEventBId() {
        return eventBId;
    }

    public void setEventBId(Integer eventBId) {
        this.eventBId = eventBId;
    }

    public String getEventBName() {
        return eventBName;
    }

    public void setEventBName(String eventBName) {
        this.eventBName = eventBName == null ? null : eventBName.trim();
    }

	public List<EventSecond> getEventSeconds() {
		return eventSeconds;
	}

	public void setEventSeconds(List<EventSecond> eventSeconds) {
		this.eventSeconds = eventSeconds;
	}

	@Override
	public String toString() {
		return "EventFirst [eventBId=" + eventBId + ", eventBName=" + eventBName + ", eventSeconds=" + eventSeconds
				+ "]";
	}
}