package com.uestc.managesystem.entity.model;

public class Post {
    private Integer postNum;

    private String postName;

    private String pDiscribe;

    public Integer getPostNum() {
        return postNum;
    }

    public void setPostNum(Integer postNum) {
        this.postNum = postNum;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName == null ? null : postName.trim();
    }

    public String getpDiscribe() {
        return pDiscribe;
    }

    public void setpDiscribe(String pDiscribe) {
        this.pDiscribe = pDiscribe == null ? null : pDiscribe.trim();
    }

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", postName=" + postName + ", pDiscribe=" + pDiscribe + "]";
	}
}