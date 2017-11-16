package com.uestc.managesystem.entity.model;

public class EventSecond {
    private Integer eventLId;

    private Integer eventBId;

    private String eventLName;

    private String eManagemetUnit;

    public Integer getEventLId() {
        return eventLId;
    }

    public void setEventLId(Integer eventLId) {
        this.eventLId = eventLId;
    }

    public Integer getEventBId() {
        return eventBId;
    }

    public void setEventBId(Integer eventBId) {
        this.eventBId = eventBId;
    }

    public String getEventLName() {
        return eventLName;
    }

    public void setEventLName(String eventLName) {
        this.eventLName = eventLName == null ? null : eventLName.trim();
    }

    public String geteManagemetUnit() {
        return eManagemetUnit;
    }

    public void seteManagemetUnit(String eManagemetUnit) {
        this.eManagemetUnit = eManagemetUnit == null ? null : eManagemetUnit.trim();
    }

	@Override
	public String toString() {
		return "EventSecond [eventLId=" + eventLId + ", eventBId=" + eventBId + ", eventLName=" + eventLName
				+ ", eManagemetUnit=" + eManagemetUnit + "]";
	}
}