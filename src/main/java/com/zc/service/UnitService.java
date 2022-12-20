package com.zc.service;

import com.zc.pojo.Unit;

import java.util.List;

public interface UnitService {
    List<Unit> getAllUnit();
    Unit getUnitById(int unitId);
    List<Unit> selectUnitByName(String name);
    int addUnit(Unit units);
    int deleteUnit(int unitId);
    int updateUnit(Unit unit);
}
