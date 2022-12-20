package com.zc.pojo;

import java.util.Date;

//用户    工作人员
public class User {
    private int uid;
    private String username;
    private String password;
    private String realname;
    private String tel;//电话 11位
    private String email;//格式控制
    private String home;//住址
    private String regist;//是否注册
    private Date creattime;//创建时间
    private String sexy;//
    private String head;//头像路径
    private String state;//账号状态     工作人员or普通用户
    private Date lasttime;//上次登陆时间
    private String unitname;//所属单位名称
    private String num;//工作编号
    private String answer;//密保问题答案
    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", home='" + home + '\'' +
                ", unitname='" + unitname + '\'' +
                ", num='" + num + '\'' +
                ", regist='" + regist + '\'' +
                ", creattime=" + creattime +
                ", sexy='" + sexy + '\'' +
                ", head='" + head + '\'' +
                ", state='" + state + '\'' +
                ", lasttime=" + lasttime +
                '}';
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getRealname() {
        return realname;
    }
    public void setRealname(String realname) {
        this.realname = realname;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getHome() {
        return home;
    }
    public void setHome(String home) {
        this.home = home;
    }
    public int getUid() { return uid; }
    public void setUid(int uid) { this.uid = uid; }
    public String getUnitname() { return unitname; }
    public void setUnitname(String unitname) { this.unitname = unitname; }
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
    }
    public String getRegist() {
        return regist;
    }
    public void setRegist(String regist) {
        this.regist = regist;
    }
    public Date getCreattime() {
        return creattime;
    }
    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }
    public String getSexy() {
        return sexy;
    }
    public void setSexy(String sexy) {
        this.sexy = sexy;
    }
    public String getHead() {
        return head;
    }
    public void setHead(String head) {
        this.head = head;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public Date getLasttime() {
        return lasttime;
    }
    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
}
