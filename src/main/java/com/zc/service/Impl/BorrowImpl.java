package com.zc.service.Impl;

import com.zc.dao.BorrowMapper;
import com.zc.pojo.Borrow;
import com.zc.service.BorrowService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class BorrowImpl implements BorrowService {//BorrowService
    @Autowired
    private BorrowMapper borrowMapper;
    @Override
    public List<Borrow> getAllBorrow(@Param(value = "uid") int uid, @Param(value = "sid") int sid) { return borrowMapper.getAllBorrow(uid,sid); }
    @Override
    public List<Borrow> getOtherBorrow(@Param(value = "uid") int uid, @Param(value = "sid") int sid) { return borrowMapper.getOtherBorrow(uid,sid); }
    @Override
    public Borrow getBorrowById(int borrowId) { return borrowMapper.getBorrowById(borrowId); }
    @Override
    public List<Borrow> checkBorrow(@Param(value = "site") String site, @Param(value = "sid") int sid) { return borrowMapper.checkBorrow(site, sid); }
    @Override
    public List<Borrow> getBorrowByUid(@Param(value = "unit") String unit, @Param(value = "site") String site) {return borrowMapper.getBorrowByUid(unit,site); }
    @Override
    public List<Borrow> getLendByUid(int uid, String site) { return borrowMapper.getLendByUid(uid,site); }
    @Override
    public int addBorrow(Borrow borrows) {
        return borrowMapper.addBorrow(borrows);
    }
    @Override
    public int deleteBorrow(int borrowId) {
        return borrowMapper.deleteBorrow(borrowId);
    }
    @Override
    public int deleteBorrowByUid(int borrowId) {
        return borrowMapper.deleteBorrowByUid(borrowId);
    }
    @Override
    public int updateBorrow(Borrow borrow) { return borrowMapper.updateBorrow(borrow); }
}
//    @Override
//    public List<Borrow> getAllBorrow() {
//        return borrowMapper.getAllBorrow();
//    }