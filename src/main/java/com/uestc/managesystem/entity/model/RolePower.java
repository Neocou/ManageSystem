package com.uestc.managesystem.entity.model;

public class RolePower {
    private Integer roleId;

    private Integer powerId;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPowerId() {
        return powerId;
    }

    public void setPowerId(Integer powerId) {
        this.powerId = powerId;
    }

	@Override
	public String toString() {
		return "RolePower [roleId=" + roleId + ", powerId=" + powerId + "]";
	}
}