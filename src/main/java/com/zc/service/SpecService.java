package com.zc.service;

import com.zc.pojo.Spec;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpecService {
    List<Spec> getAllSpec(String unitname);
    List<Spec> showOthers(String unitname);
    List<Spec> showAll();
    Spec getSpecById(int specId);
    List<Spec> selectSpecBySnameAdmin( @Param(value="info")String info);
    List<Spec> selectSpecBySiteAdmin(@Param(value="info")String info);
    List<Spec> selectSpecByMaterialAdmin(@Param(value="info")String info);
    List<Spec> selectSpecByUnitnameAdmin(@Param(value="info")String info);
    List<Spec> selectSpecBySname(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectSpecBySite(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectSpecByMaterial(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectSpecByUnitname(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectOtherSpecBySname(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectOtherSpecBySite(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectOtherSpecByMaterial(@Param(value="unitname")String unitname, @Param(value="info")String info);
    List<Spec> selectOtherSpecByUnitname(@Param(value="unitname")String unitname, @Param(value="info")String info);
    int addSpec(Spec specs);
    int deleteSpec(int specId);
    int updateSpec(Spec spec);
}
//    List<Spec> selectOtherSpec(@Param(value="unitname")String unitname, @Param(value="info")String info);
