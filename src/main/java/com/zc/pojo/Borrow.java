package com.zc.pojo;

import java.util.Date;
//标本借阅
public class Borrow {
    private int bid;
    private int sid;//sidb 标本id
    private String unit;//标本所属单位
    private int uid;//uidb 借阅账户
    private Date btime;//借阅时间
    private Date rtime;//归还时间
    private String reason;//借阅理由
    private String borrowman;//借阅人
    private String tel;//借阅人联系方式
    private String email;
    private String site;//状态
    private String tips;//备注

    @Override
    public String toString() {
        return "Borrow{" +
                "bid=" + bid +
                ", sid=" + sid +
                ", unit='" + unit + '\'' +
                ", uid=" + uid +
                ", btime=" + btime +
                ", rtime=" + rtime +
                ", reason='" + reason + '\'' +
                ", borrowman='" + borrowman + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", site='" + site + '\'' +
                ", tips='" + tips + '\'' +
                '}';
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSite() {
        return site;
    }
    public void setSite(String site) {
        this.site = site;
    }
    public int getBid() {
        return bid;
    }
    public void setBid(int bid) {
        this.bid = bid;
    }
    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }
    public String getUnit() {
        return unit;
    }
    public void setUnit(String unit) {
        this.unit = unit;
    }
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public Date getBtime() {
        return btime;
    }
    public void setBtime(Date btime) {
        this.btime = btime;
    }
    public Date getRtime() {
        return rtime;
    }
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }
    public String getReason() {
        return reason;
    }
    public void setReason(String reason) {
        this.reason = reason;
    }
    public String getBorrowman() {
        return borrowman;
    }
    public void setBorrowman(String borrowman) {
        this.borrowman = borrowman;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getTips() {
        return tips;
    }
    public void setTips(String tips) {
        this.tips = tips;
    }
}
