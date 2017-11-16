package com.uestc.managesystem.entity.dto;


/**
 * 用于多条件查询用户
 * @author Administrator
 *
 */
public class UserSelect {
    private Integer userNumber;
    private String userName;
    private String departmentName;
    private String postName;
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}

	@Override
	public String toString() {
		return "UserSelect [userNumber=" + userNumber + ", userName=" + userName + ", departmentName=" + departmentName
				+ ", postName=" + postName + ", roleName=" +  "]";
	}
}
