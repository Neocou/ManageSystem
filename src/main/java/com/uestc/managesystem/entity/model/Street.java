package com.uestc.managesystem.entity.model;

import java.util.List;

public class Street {
    private Integer streetId;

    private String streetName;

    private String sInformation;
    
    private List<Community> communitis;

    public Integer getStreetId() {
        return streetId;
    }

    public void setStreetId(Integer streetId) {
        this.streetId = streetId;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName == null ? null : streetName.trim();
    }

    public String getsInformation() {
        return sInformation;
    }

    public void setsInformation(String sInformation) {
        this.sInformation = sInformation == null ? null : sInformation.trim();
    }

	public List<Community> getCommunitis() {
		return communitis;
	}

	public void setCommunitis(List<Community> communitis) {
		this.communitis = communitis;
	}

	@Override
	public String toString() {
		return "Street [streetId=" + streetId + ", streetName=" + streetName + ", sInformation=" + sInformation
				+ ", communitis=" + communitis + "]";
	}
}