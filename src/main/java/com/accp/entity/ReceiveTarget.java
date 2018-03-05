package com.accp.entity;


import java.util.Date;

/**
 * 接待对象表
 */
public class ReceiveTarget {

    private Integer receivetargetId; //'接待对象ID',
    private Integer targetTypeID; //'Integer',
    private String principal; //'负责人',
    private String teamName; //'团队名称',
    private String teamCode; //'团队编号',
    private Date registerTime;//'登记时间',
    private String contactPhoneNUmber; //'联系电话',

    public Integer getReceivetargetId() {
        return receivetargetId;
    }

    public void setReceivetargetId(Integer receivetargetId) {
        this.receivetargetId = receivetargetId;
    }

    private String targetTypeName;//'团队名称',

    public String getTargetTypeName() {
        return targetTypeName;
    }

    public void setTargetTypeName(String targetTypeName) {
        this.targetTypeName = targetTypeName;
    }


    public Integer getTargetTypeID() {
        return targetTypeID;
    }

    public void setTargetTypeID(Integer targetTypeID) {
        this.targetTypeID = targetTypeID;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamCode() {
        return teamCode;
    }

    public void setTeamCode(String teamCode) {
        this.teamCode = teamCode;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getContactPhoneNUmber() {
        return contactPhoneNUmber;
    }

    public void setContactPhoneNUmber(String contactPhoneNUmber) {
        this.contactPhoneNUmber = contactPhoneNUmber;
    }
}
