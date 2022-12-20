package com.zc.pojo;

import java.util.Date;

public class Chara {
    public int cid;
    public String cname;
    public Date creattime;//创建时间
    public String state;//角色状态
    public String tips;//备注

    @Override
    public String toString() {
        return "Chara{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", creattime='" + creattime + '\'' +
                ", state='" + state + '\'' +
                ", tips='" + tips + '\'' +
                '}';
    }
    public int getCid() {
        return cid;
    }
    public void setCid(int cid) {
        this.cid = cid;
    }
    public String getCname() {
        return cname;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public Date getCreattime() {
        return creattime;
    }
    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String getTips() {
        return tips;
    }
    public void setTips(String tips) {
        this.tips = tips;
    }
}
