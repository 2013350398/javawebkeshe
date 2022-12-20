package com.zc.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import com.zc.pojo.Unit;
@Mapper
public interface UnitMapper {
    List<Unit> getAllUnit();
    Unit getUnitById(int unitId);
    List<Unit> selectUnitByName(String name);
    int addUnit(Unit units);
    int deleteUnit(int unitId);
    int updateUnit(Unit unit);
}

