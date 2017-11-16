package com.uestc.managesystem.entity.model;

public class PartsSecond {
    private Integer partLId;

    private Integer partBId;

    private String partLName;

    private String partManageUnit;

    public Integer getPartLId() {
        return partLId;
    }

    public void setPartLId(Integer partLId) {
        this.partLId = partLId;
    }

    public Integer getPartBId() {
        return partBId;
    }

    public void setPartBId(Integer partBId) {
        this.partBId = partBId;
    }

    public String getPartLName() {
        return partLName;
    }

    public void setPartLName(String partLName) {
        this.partLName = partLName == null ? null : partLName.trim();
    }

    public String getPartManageUnit() {
        return partManageUnit;
    }

    public void setPartManageUnit(String partManageUnit) {
        this.partManageUnit = partManageUnit == null ? null : partManageUnit.trim();
    }

	@Override
	public String toString() {
		return "PartsSecond [partLId=" + partLId + ", partBId=" + partBId + ", partLName=" + partLName
				+ ", partManageUnit=" + partManageUnit + "]";
	}
}