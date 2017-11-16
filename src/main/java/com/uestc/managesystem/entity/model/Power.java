package com.uestc.managesystem.entity.model;

public class Power {
    private Integer powerId;

    private String powerName;

    private String powerDescribe;

    public Integer getPowerId() {
        return powerId;
    }

    public void setPowerId(Integer powerId) {
        this.powerId = powerId;
    }

    public String getPowerName() {
        return powerName;
    }

    public void setPowerName(String powerName) {
        this.powerName = powerName == null ? null : powerName.trim();
    }

    public String getPowerDescribe() {
        return powerDescribe;
    }

    public void setPowerDescribe(String powerDescribe) {
        this.powerDescribe = powerDescribe == null ? null : powerDescribe.trim();
    }

	@Override
	public String toString() {
		return "Power [powerId=" + powerId + ", powerName=" + powerName + ", powerDescribe=" + powerDescribe + "]";
	}
}