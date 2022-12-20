package com.zc.controller;

import com.zc.pojo.Unit;
import com.zc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.zc.tool.changeinfo;
import static com.zc.tool.isemail;
import static com.zc.tool.istel;

@Controller
@RequestMapping("/unit.do")
public class UnitController {
    @Autowired
    private UnitService unitService;
    ModelAndView mav = new ModelAndView();
    @Autowired
    HttpSession session;
    @RequestMapping(params = "method=choseUnit")
    public ModelAndView choseUnit(){
        session.setAttribute("choseUnit",unitService.getAllUnit());
        mav.setViewName("addstaff");
        return mav;
    }
    @RequestMapping(params = "method=allUnit")
    public ModelAndView getAllUnit(HttpSession session) {
        List<Unit> allUnit = unitService.getAllUnit();
        mav.setViewName("showallunit");//jsp路径控制    跳转showdetailinfo
        mav.addObject("allUnit",allUnit);//和test.jsp中的变量名对应
        session.setAttribute("allUnit",allUnit);
        return mav;
    }
    @RequestMapping("/getUnitById")
    public String getUnitById(int id) {//@RequestParam("unitId")
        Unit unitById = unitService.getUnitById(id);
        mav.addObject("unitById", unitById);
        return "getUnitById";
    }
    @RequestMapping(params = "method=selectUnitByName")
    public ModelAndView selectUnitByName(@RequestParam("name") String name){
        List<Unit>units=unitService.selectUnitByName("%"+name+"%");
        mav.addObject("units",units);
        mav.setViewName("selectunit");
        session.setAttribute("units",units);
        return mav;
    }
    @RequestMapping(params = "method=addUnit")
    public ModelAndView addUnit(Unit unit) {
        if(isemail(unit.getEmail())&&istel(unit.getTel())){
            List<Unit> allUnit = unitService.getAllUnit();
            for (Unit u:allUnit){
                if(u.getUnname().equals(unit.getUnname())){//重名
                    mav.setViewName("addunit");//jsp路径控制
                    session.setAttribute("opra",1);
                    session.setAttribute("reason","unitadd");
                    return mav;
                }
            }
            try{
                //更新session
                Object obj=session.getAttribute("allUnit");
                List<Unit>units=new ArrayList<>();
                for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
                units.add(unit);
                session.setAttribute("allUnit",units);
                session.setAttribute("opra",0);
                session.setAttribute("reason","unitadd");
            }catch(Exception e){}
            //增加单位信息
            unitService.addUnit(unit);
            mav.setViewName("adminfunc");//jsp路径控制addunitsucess
            mav.addObject("unitname",unit.getUnname());//和test.jsp中的变量名对应
            return mav;
        }
        session.setAttribute("opra",1);
        session.setAttribute("reason","teloremail");
        mav.setViewName("addunit");
        return mav;
    }

    @RequestMapping(params = "method=deleteUnit")
    public ModelAndView deleteUnit(int id) {
        try{//更新session
            Object obj=session.getAttribute("allUnit");
            List<Unit>units=new ArrayList<>();
            for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
            Unit u=unitService.getUnitById(id);
            units.remove(u);
            session.setAttribute("allUnit",units);
        }catch(Exception e){}
        unitService.deleteUnit(id);
        session.setAttribute("opra",0);
        session.setAttribute("reason","deletunitsucess");
        mav.setViewName("showallunit");//deletunitsucess
        return mav;
    }

    @RequestMapping(params = "method=updateUnit")
    public ModelAndView updateUnit(Unit unit,int id) {
        unit.setUnid(id);
        //判断tel和email合法性
        if(isemail(unit.getEmail())&&istel(unit.getTel())){
            Unit u=unitService.getUnitById(id);
            try{//更新session
                Object obj=session.getAttribute("allUnit");
                List<Unit>units=new ArrayList<>();
                for (Object o: (List<?>) obj){ units.add(Unit.class.cast(o)); }
                units.remove(u);
                session.setAttribute("allUnit",units);
                units.add(unit);
            }catch(Exception e){}
            //更新数据库
            unitService.updateUnit(unit);
            mav.addObject("unit",unit);
            session.setAttribute("unit",unit);
            session.setAttribute("opra",0);
            session.setAttribute("reason","updatesucess");
            mav.setViewName("showallunit");//deletunitsucess
        }
        else{
            session.setAttribute("reason","teloremail");
            session.setAttribute("opra",1);
            mav.setViewName("modifyunitdetailinfo");//重新修改
        }return mav;
    }
}
