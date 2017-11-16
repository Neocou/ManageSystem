package com.uestc.managesystem.entity.model;

public class UserGrid {
    private Integer gridId;

    private Integer userNumber;

    public Integer getGridId() {
        return gridId;
    }

    public void setGridId(Integer gridId) {
        this.gridId = gridId;
    }

    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }

	@Override
	public String toString() {
		return "UserGrid [gridId=" + gridId + ", userNumber=" + userNumber + "]";
	}
}