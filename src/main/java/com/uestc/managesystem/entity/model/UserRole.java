package com.uestc.managesystem.entity.model;

public class UserRole {
    private Integer userNumber;

    private Integer roleId;

    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

	@Override
	public String toString() {
		return "UserRole [userNumber=" + userNumber + ", roleId=" + roleId + "]";
	}
}