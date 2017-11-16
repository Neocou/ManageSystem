package com.uestc.managesystem.entity.model;

import java.sql.Date;

public class Notice {
    private Integer noticeId;

    private String noticeOrganization;

    private Date noticeTime;

    private String noticeContent;

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeOrganization() {
        return noticeOrganization;
    }

    public void setNoticeOrganization(String noticeOrganization) {
        this.noticeOrganization = noticeOrganization == null ? null : noticeOrganization.trim();
    }

    public Date getNoticeTime() {
        return noticeTime;
    }

    public void setNoticeTime(Date noticeTime) {
        this.noticeTime = noticeTime;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent == null ? null : noticeContent.trim();
    }

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeOrganization=" + noticeOrganization + ", noticeTime="
				+ noticeTime + ", noticeContent=" + noticeContent + "]";
	}
}