package com.uestc.managesystem.entity.model;

public class Grid {
    private Integer gridId;

    private Integer communityId;

    private String gridInformation;

    public Integer getGridId() {
        return gridId;
    }

    public void setGridId(Integer gridId) {
        this.gridId = gridId;
    }

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public String getGridInformation() {
        return gridInformation;
    }

    public void setGridInformation(String gridInformation) {
        this.gridInformation = gridInformation == null ? null : gridInformation.trim();
    }

	@Override
	public String toString() {
		return gridId + "" ;
	}
}