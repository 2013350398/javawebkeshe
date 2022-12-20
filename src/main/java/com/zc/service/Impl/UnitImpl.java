package com.zc.service.Impl;

import com.zc.dao.UnitMapper;
import com.zc.pojo.Unit;
import com.zc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class UnitImpl implements UnitService {//UnitService
    @Autowired
    private UnitMapper unitMapper;
    @Override
    public List<Unit> getAllUnit() {
        return unitMapper.getAllUnit();
    }
    @Override
    public Unit getUnitById(int unitId) { return unitMapper.getUnitById(unitId); }
    @Override
    public List<Unit> selectUnitByName(String name){return unitMapper.selectUnitByName(name);}
    @Override
    public int addUnit(Unit units) { return unitMapper.addUnit(units); }
    @Override
    public int deleteUnit(int unitId) {
        return unitMapper.deleteUnit(unitId);
    }
    @Override
    public int updateUnit(Unit unit) { return unitMapper.updateUnit(unit); }
}