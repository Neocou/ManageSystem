package com.uestc.managesystem.entity.model;

import java.util.List;

public class PartsFirst {
    private Integer partBId;

    private String partBName;

    private List<PartsSecond> partsSeconds;
    public Integer getPartBId() {
        return partBId;
    }

    public void setPartBId(Integer partBId) {
        this.partBId = partBId;
    }

    public String getPartBName() {
        return partBName;
    }

    public void setPartBName(String partBName) {
        this.partBName = partBName == null ? null : partBName.trim();
    }

	public List<PartsSecond> getPartsSeconds() {
		return partsSeconds;
	}

	public void setPartsSeconds(List<PartsSecond> partsSeconds) {
		this.partsSeconds = partsSeconds;
	}

	@Override
	public String toString() {
		return "PartsFirst [partBId=" + partBId + ", partBName=" + partBName + ", partsSeconds=" + partsSeconds + "]";
	}


}