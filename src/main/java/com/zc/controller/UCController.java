package com.zc.controller;

import com.zc.pojo.UC;
import com.zc.service.UCSercive;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/uc.do")
public class UCController {

    @Autowired
    private UCSercive ucSercive;
    @RequestMapping(params = "method=getAllUC")
    public List<UC> getAllUC() { return ucSercive.getAllUC(); }
    @RequestMapping(params = "method=getUCById")
    public UC getUCById(@Param(value="uid")int uid,@Param(value="cid")int cid) { return ucSercive.getUCById(uid,cid); }
    @RequestMapping(params = "method=addUC")
    public void addUC(UC uc) { ucSercive.addUC(uc); }
    @RequestMapping(params = "method=deleteUC")
    public void deleteUC(@Param(value="uid")int uid,@Param(value="cid")int cid) { ucSercive.deleteUC(uid,cid); }
    @RequestMapping(params = "method=selectCid")
    public int selectCid(int uid) { return ucSercive.selectCid(uid); }

}
