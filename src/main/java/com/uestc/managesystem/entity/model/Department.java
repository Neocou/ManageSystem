package com.uestc.managesystem.entity.model;

public class Department {
    private Integer departmentNum;

    private String departmentName;

    private String address;

    private String depDescribe;

    public Integer getDepartmentNum() {
        return departmentNum;
    }

    public void setDepartmentNum(Integer departmentNum) {
        this.departmentNum = departmentNum;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getDepDescribe() {
        return depDescribe;
    }

    public void setDepDescribe(String depDescribe) {
        this.depDescribe = depDescribe == null ? null : depDescribe.trim();
    }

	@Override
	public String toString() {
		return "Department [departmentNum=" + departmentNum + ", departmentName=" + departmentName + ", address="
				+ address + ", depDescribe=" + depDescribe + "]";
	}
}