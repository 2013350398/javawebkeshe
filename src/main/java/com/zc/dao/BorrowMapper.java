package com.zc.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import com.zc.pojo.Borrow;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BorrowMapper {
    List<Borrow> getAllBorrow(@Param(value = "uid") int uid, @Param(value = "sid") int sid);
    List<Borrow> getOtherBorrow(@Param(value = "uid") int uid, @Param(value = "sid") int sid);
    Borrow getBorrowById(int borrowId);
    List<Borrow> getBorrowByUid(@Param(value = "unit") String unit, @Param(value = "site") String site);
    List<Borrow> getLendByUid(@Param(value = "uid") int uid, @Param(value = "site") String site);
    List<Borrow> checkBorrow(@Param(value = "site") String site, @Param(value = "sid") int sid);
    int addBorrow(Borrow borrows);
    int deleteBorrow(int borrowId);
    int deleteBorrowByUid(int borrowId);
    int updateBorrow(Borrow borrow);
}

