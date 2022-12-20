package com.zc.pojo;

import java.util.Date;

//标本
public class Spec {
    private int sid;
    private String sname;
    private String site;//出土地点
    private String excavatetime;//出土时间
    private String material;//材质
    private String ages;//所属年代
    private String entryman;//string 录入人
    private String descr;//描述
    private Date entrytime;//入库时间 add时加入
    private String pic;//标本图片路径
    private String state;//是否对外开发
    private String unitname;//所属单位
    private String code;//标本编号

    @Override
    public String toString() {
        return "Spec{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", site='" + site + '\'' +
                ", excavatetime='" + excavatetime + '\'' +
                ", material='" + material + '\'' +
                ", ages='" + ages + '\'' +
                ", entryman='" + entryman + '\'' +
                ", descr='" + descr + '\'' +
                ", entrytime=" + entrytime +
                ", pic='" + pic + '\'' +
                ", state='" + state + '\'' +
                ", unitname='" + unitname + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
    public String getUnitname() {
        return unitname;
    }
    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }
    public String getSname() {
        return sname;
    }
    public void setSname(String sname) {
        this.sname = sname;
    }
    public String getSite() {
        return site;
    }
    public void setSite(String site) {
        this.site = site;
    }
    public String getExcavatetime() {
        return excavatetime;
    }
    public void setExcavatetime(String excavatetime) {
        this.excavatetime = excavatetime;
    }
    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
    }
    public String getAges() {
        return ages;
    }
    public void setAges(String ages) {
        this.ages = ages;
    }
    public String getEntryman() { return entryman; }
    public void setEntryman(String entryman) { this.entryman = entryman; }
    public String getDescr() { return descr; }
    public void setDescr(String descr) { this.descr = descr; }
    public Date getEntrytime() { return entrytime; }
    public void setEntrytime(Date entrytime) { this.entrytime = entrytime; }
    public String getPic() { return pic; }
    public void setPic(String pic) { this.pic = pic; }
}
