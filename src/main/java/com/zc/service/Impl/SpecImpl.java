package com.zc.service.Impl;

import com.zc.dao.SpecMapper;
import com.zc.pojo.Spec;
import com.zc.service.SpecService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class SpecImpl implements SpecService {//SpecService
    @Autowired
    private SpecMapper specMapper;
    @Override
    public List<Spec> getAllSpec(String unitname) {
        return specMapper.getAllSpec(unitname);
    }
    @Override
    public List<Spec> showOthers(String unitname){return specMapper.showOthers(unitname);}
    @Override
    public List<Spec> showAll(){return specMapper.showAll();}
    @Override
    public Spec getSpecById(int specId) { return specMapper.getSpecById(specId); }
    @Override
    public List<Spec> selectSpecBySnameAdmin(String info) { return specMapper.selectSpecBySnameAdmin(info); }
    @Override
    public List<Spec> selectSpecBySiteAdmin(String info) { return specMapper.selectSpecBySiteAdmin(info); }
    @Override
    public List<Spec> selectSpecByMaterialAdmin(String info) { return specMapper.selectSpecByMaterialAdmin(info); }
    @Override
    public List<Spec> selectSpecByUnitnameAdmin(String info) { return specMapper.selectSpecByUnitnameAdmin(info); }
    @Override
    public List<Spec> selectSpecBySname(String unitname, String info) { return specMapper.selectSpecBySname(unitname, info); }
    @Override
    public List<Spec> selectSpecBySite(String unitname, String info) { return specMapper.selectSpecBySite(unitname, info); }
    @Override
    public List<Spec> selectSpecByMaterial(String unitname, String info) { return specMapper.selectSpecByMaterial(unitname, info); }
    @Override
    public List<Spec> selectSpecByUnitname(String unitname, String info) { return specMapper.selectSpecByUnitname(unitname, info); }
    @Override
    public List<Spec> selectOtherSpecBySname(String unitname, String info) { return specMapper.selectOtherSpecBySname(unitname, info); }
    @Override
    public List<Spec> selectOtherSpecBySite(String unitname, String info) { return specMapper.selectOtherSpecBySite(unitname, info); }
    @Override
    public List<Spec> selectOtherSpecByMaterial(String unitname, String info) { return specMapper.selectOtherSpecByMaterial(unitname, info); }
    @Override
    public List<Spec> selectOtherSpecByUnitname(String unitname, String info) { return specMapper.selectOtherSpecByUnitname(unitname, info); }
    @Override
    public int addSpec(Spec specs) {
        return specMapper.addSpec(specs);
    }
    @Override
    public int deleteSpec(int specId) {
        return specMapper.deleteSpec(specId);
    }
    @Override
    public int updateSpec(Spec spec) { return specMapper.updateSpec(spec); }
}

//    public List<Spec> selectOtherSpec(@Param(value="unitname")String unitname, @Param(value="info")String info) { return specMapper.selectOtherSpec(unitname, info); }