package com.zc.pojo;

public class UC {
    int uid;
    int cid;

    @Override
    public String toString() {
        return "UC{" +
                "uid=" + uid +
                ", cid=" + cid +
                '}';
    }
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public int getCid() {
        return cid;
    }
    public void setCid(int cid) {
        this.cid = cid;
    }
}
