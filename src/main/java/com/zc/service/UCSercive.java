package com.zc.service;

import com.zc.pojo.UC;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UCSercive {
    List<UC> getAllUC();
    UC getUCById(@Param(value="uid")int uid,@Param(value="cid")int cid);
    int addUC(UC users);
    int deleteUC(@Param(value="uid")int uid,@Param(value="cid")int cid);
    int selectCid(int uid);
}
