package com.zc.service.Impl;

import com.zc.dao.UCMapper;
import com.zc.pojo.UC;
import com.zc.service.UCSercive;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UCImpl implements UCSercive {
    @Autowired
    private UCMapper ucMapper;
    @Override
    public List<UC> getAllUC() { return ucMapper.getAllUC();}
    @Override
    public UC getUCById(@Param(value="uid")int uid,@Param(value="cid")int cid) { return ucMapper.getUCById(uid,cid); }
    @Override
    public int addUC(UC uc) { ucMapper.addUC(uc);return 0; }
    @Override
    public int deleteUC(@Param(value="uid")int uid,@Param(value="cid")int cid) { ucMapper.deleteUC(uid,cid);return 0; }
    @Override
    public int selectCid(int uid){ return ucMapper.selectCid(uid);}
}
