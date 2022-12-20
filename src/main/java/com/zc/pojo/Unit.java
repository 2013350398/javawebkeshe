package com.zc.pojo;
//单位
public class Unit {
    public int unid;
    public String unname;
    public String linkman;//联系人
    public String tel;
    public String email;
    public String site;//联系地址
    public String unittype;//单位性质

    @Override
    public String toString() {
        return "Unit{" +
                "unid='" + unid + '\'' +
                ", unname='" + unname + '\'' +
                ", linkman='" + linkman + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", site='" + site + '\'' +
                ", unittype='" + unittype + '\'' +
                '}';
    }
    public String getUnittype() { return unittype; }
    public void setUnittype(String unittype) { this.unittype = unittype; }
    public int getUnid() {
        return unid;
    }
    public void setUnid(int unid) {
        this.unid = unid;
    }
    public String getUnname() {
        return unname;
    }
    public void setUnname(String unname) {
        this.unname = unname;
    }
    public String getLinkman() {
        return linkman;
    }
    public void setLinkman(String linkman) {
        this.linkman = linkman;
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
    public String getSite() {
        return site;
    }
    public void setSite(String site) {
        this.site = site;
    }
}
