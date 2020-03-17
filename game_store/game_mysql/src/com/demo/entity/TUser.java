package com.demo.entity;

public class TUser {
    private Integer id;
    private String loginName;
    private String oldLoginName;
    private String qqNum;
    private String passWord;
    private String phoneNum;
    private Integer roleType;
    private String roleTypeStr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getOldLoginName() {
		return oldLoginName;
	}
	public void setOldLoginName(String oldLoginName) {
		this.oldLoginName = oldLoginName;
	}
	public String getQqNum() {
		return qqNum;
	}
	public void setQqNum(String qqNum) {
		this.qqNum = qqNum;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public Integer getRoleType() {
		return roleType;
	}
	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}
	public String getRoleTypeStr() {
		return roleTypeStr;
	}
	public void setRoleTypeStr(String roleTypeStr) {
		this.roleTypeStr = roleTypeStr;
	}
	
    
}
