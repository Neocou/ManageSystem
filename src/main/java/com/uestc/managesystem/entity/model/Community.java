package com.uestc.managesystem.entity.model;

import java.util.List;

public class Community {
    private Integer communityId;

    private Integer streetId;

    private String commName;

    private String commInformation;
    private List<Grid> grids;

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public Integer getStreetId() {
        return streetId;
    }

    public void setStreetId(Integer streetId) {
        this.streetId = streetId;
    }

    public String getCommName() {
        return commName;
    }

    public void setCommName(String commName) {
        this.commName = commName == null ? null : commName.trim();
    }

    public String getCommInformation() {
        return commInformation;
    }

    public void setCommInformation(String commInformation) {
        this.commInformation = commInformation == null ? null : commInformation.trim();
    }

	public List<Grid> getGrids() {
		return grids;
	}

	public void setGrids(List<Grid> grids) {
		this.grids = grids;
	}

	@Override
	public String toString() {
		return "Community [communityId=" + communityId + ", streetId=" + streetId + ", commName=" + commName
				+ ", commInformation=" + commInformation + ", grids=" + grids + "]";
	}
}