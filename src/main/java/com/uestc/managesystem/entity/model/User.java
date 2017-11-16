package com.uestc.managesystem.entity.model;

import java.util.List;

public class User {
    private Integer userNumber;
    private String departmentName;
    private String postName;
    private String passWord;
    private String userName;
    private String gender;
    private Integer age;
    private String phoneNum;
    private Integer departmentNum;
    private Integer postNum;
    private String userStatus;
    private List<Power> right;
    private List<Role> roles;
    private List<Grid> grids;
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
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
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public List<Power> getRight() {
		return right;
	}
	public void setRight(List<Power> right) {
		this.right = right;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<Grid> getGrids() {
		return grids;
	}
	public void setGrids(List<Grid> grids) {
		this.grids = grids;
	}
	public Integer getDepartmentNum() {
		return departmentNum;
	}
	public void setDepartmentNum(Integer departmentNum) {
		this.departmentNum = departmentNum;
	}
	public Integer getPostNum() {
		return postNum;
	}
	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	@Override
	public String toString() {
		return "User [userNumber=" + userNumber + ", departmentName=" + departmentName + ", postName=" + postName
				+ ", passWord=" + passWord + ", userName=" + userName + ", gender=" + gender + ", age=" + age
				+ ", phoneNum=" + phoneNum + ", departmentNum=" + departmentNum + ", postNum=" + postNum
				+ ", userStatus=" + userStatus + ", right=" + right + ", roles=" + roles + ", grids=" + grids + "]";
	}



}