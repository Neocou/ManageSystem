package com.uestc.managesystem.entity.model;

import java.sql.Timestamp;

public class OperationRecord {
    private Integer operationId;

    private Integer operationUser;

    private String operationContext;

    private String operationName;

    private Timestamp operationTime;

    public Integer getOperationId() {
        return operationId;
    }

    public void setOperationId(Integer operationId) {
        this.operationId = operationId;
    }

    public Integer getOperationUser() {
        return operationUser;
    }

    public void setOperationUser(Integer operationUser) {
        this.operationUser = operationUser;
    }

    public String getOperationContext() {
        return operationContext;
    }

    public void setOperationContext(String operationContext) {
        this.operationContext = operationContext == null ? null : operationContext.trim();
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName == null ? null : operationName.trim();
    }

    public Timestamp getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Timestamp operationTime) {
        this.operationTime = operationTime;
    }

	@Override
	public String toString() {
		return "OperationRecord [operationId=" + operationId + ", operationUser=" + operationUser
				+ ", operationContext=" + operationContext + ", operationName=" + operationName + ", operationTime="
				+ operationTime + "]";
	}
}