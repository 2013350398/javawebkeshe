package com.zc.controller;

//import com.opensymphony.xwork2.ActionContext;
import com.zc.pojo.Borrow;
import com.zc.pojo.Spec;
import com.zc.pojo.User;
import com.zc.service.BorrowService;
import com.zc.service.SpecService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/borrow.do")
public class BorrowController {
    ModelAndView mav = new ModelAndView();
    @Autowired
    private SpecService specService;
    @Autowired
    private BorrowService borrowService;
    @Autowired
    HttpSession session;
    //处理借阅申请
    @RequestMapping(params = "method=allBorrow")
    public ModelAndView getAllBorrow() {
        User u=(User)session.getAttribute("user");
        List<Borrow>b1=borrowService.getBorrowByUid(u.getUnitname(),"待审核");//待审核
        List<Borrow>b2=borrowService.getBorrowByUid(u.getUnitname(),"已借出");//待归还
        List<Borrow>b3=borrowService.getBorrowByUid(u.getUnitname(),"已结束");//已结束
        List<Borrow>b4=borrowService.getBorrowByUid(u.getUnitname(),"归还");
        mav.setViewName("showallborrow");
        mav.addObject("allBorrowf",b1);
        session.setAttribute("allBorrowf",b1);
        mav.addObject("allBorrows",b2);
        session.setAttribute("allBorrows",b2);
        mav.addObject("allBorrowt",b3);
        session.setAttribute("allBorrowt",b3);
        mav.addObject("allBorrowfo",b4);
        session.setAttribute("allBorrowfo",b4);
        return mav;
    }
    //删除之前检查是否被借阅
    public boolean checkBorrow(int uid,int sid){
        List<Borrow> b=borrowService.checkBorrow("归还", sid);
        List<Borrow> b1=borrowService.checkBorrow("已借出", sid);
        if((b.size()==0)&&(b1.size()==0)){
            b=borrowService.checkBorrow("待审核", sid);
            b1=borrowService.checkBorrow("已结束", sid);
            for(Borrow bs:b1){b.add(bs);}//把要删除的借阅记录汇总
            session.setAttribute("deleteborrow",b);
            return false;//可以删除
        }
        return true;//正被借阅
    }
    //查看借阅进度
    @RequestMapping(params = "method=OtherBorrow")
    public ModelAndView getOtherBorrow() {
        User u=(User)session.getAttribute("user");
        List<Borrow>b1=borrowService.getLendByUid(u.getUid(),"已借出");//待归还
        List<Borrow>b2=borrowService.getLendByUid(u.getUid(),"已结束");
        List<Borrow>b3=borrowService.getLendByUid(u.getUid(),"待审核");//待审核
        List<Borrow>b4=borrowService.getLendByUid(u.getUid(),"归还");//归还待确认
        mav.setViewName("showalllend");
        mav.addObject("allLendf",b1);
        session.setAttribute("allLendf",b1);
        mav.addObject("allLends",b2);
        session.setAttribute("allLends",b2);
        mav.addObject("allLendt",b3);
        session.setAttribute("allLendt",b3);
        mav.addObject("allLendfo",b4);
        session.setAttribute("allLendfo",b4);
        return mav;
    }
    @RequestMapping("/getBorrowById")
    public void getBorrowById(int id) {//@RequestParam("borrowId")
        Borrow borrowById = borrowService.getBorrowById(id);
        mav.addObject("borrowById", borrowById);
    }

    @RequestMapping(params = "method=addBorrow")
    public ModelAndView addBorrow(Borrow borrow,@Param(value = "id") int id,@Param(value = "cnt") int cnt) {
//        System.out.println(cnt+" "+id);
        //获取标本信息
        Object obj=session.getAttribute("otherSpec");
        List<Spec> specs=new ArrayList<>();
        for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
        Spec spec=specs.get(cnt);
        User user=(User)session.getAttribute("user");
        //查询是否已被借走
        List<Borrow> borrows1=borrowService.getOtherBorrow(user.getUid(),spec.getSid());//其他人也借阅
        if(borrows1.size()!=0){
            for(Borrow b:borrows1){
                if((b.getSite().equals("已借出"))||b.getSite().equals("归还")){//(!b.getSite().equals("已结束"))||!b.getSite().equals("待审核")
                    mav.setViewName("showotherspec");//已借出borrowaddotherfail
                    session.setAttribute("opra",1);
                    session.setAttribute("reason","otherlend");
                    return mav;
                }
            }
        }
        //查询是否已同一个用户已经提交借阅申请
        List<Borrow> borrows2=borrowService.getAllBorrow(user.getUid(),spec.getSid());//只能为已结束
        if(borrows2.size()!=0){
            for(Borrow b:borrows2){
                if(!b.getSite().equals("已结束")){//&&!b.getSite().equals("待审核")
                    session.setAttribute("opra",1);
                    session.setAttribute("reason","sendborrowagain");
                    mav.setViewName("showotherspec");//已经   待审核/已借出/归还  不能再提交借阅申请borrowaddfail
                    return mav;
                }
            }
        }
        borrow.setSid(spec.getSid());
//        System.out.println("sid"+spec.getSid());//add时候有问题
        borrow.setUnit(spec.getUnitname());
        borrow.setUid(id);
        borrow.setSite("待审核");
//        System.out.println(borrow.toString());
        //增加
        Date date=new Date();
        borrow.setBtime(date);
        borrowService.addBorrow(borrow);
        mav.addObject("borrow",borrow);
        session.setAttribute("opra",0);
        session.setAttribute("reason","sendborrowsucess");
        mav.setViewName("showotherspec");//jsp路径控制borrowaddsucess
//        System.out.println(borrowService.addBorrow(borrow));
        return mav;
    }

    @RequestMapping(params = "method=deleteBorrow")
    public void deleteBorrow(int id) {//@PathVariable("borrowId")
        borrowService.deleteBorrow(id);
//        mav.setViewName("deletborrowsucess");
//        return mav;
    }

    @RequestMapping(params = "method=updateBorrow")
    public ModelAndView updateBorrow(@Param(value = "cnt") int cnt, @Param(value = "site") String site) {
//        System.out.println(site);
        Object obj;
        Borrow b;
        List<Borrow> bs=new ArrayList<>();
        //用try-catch容易报错obj为null，改用if-else
        if(site.equals("归还")){obj=session.getAttribute("allLendchange");}
        else{obj=session.getAttribute("allBorrow");}
        for (Object o: (List<?>) obj){
//            System.out.println(Borrow.class.cast(o));
            bs.add(Borrow.class.cast(o)); }
        b=bs.get(cnt);
        Date date=new Date();
        mav.setViewName("showallborrow");
        if(site.equals("审核通过")){
            //查询是否已经借出
            List<Borrow> borrows1=borrowService.checkBorrow("已借出",b.getSid());
            List<Borrow> borrows2=borrowService.checkBorrow("归还",b.getSid());
            if(!(borrows1.size()==0)||!(borrows2.size()==0)){
                session.setAttribute("opra",1);
                session.setAttribute("reason","hadborrow");//"updateborrowfail"不能通过，已经被借出
                return mav;
            }//可以删除
            //可以借阅
            session.setAttribute("reason","borrowsucess");
            b.setSite("已借出");
            b.setBtime(date);
        }
        else if (site.equals("审核不通过")){//要不要删除记录？
            session.setAttribute("reason","refuse");
            b.setSite("已结束");}
        else if(site.equals("归还")){
            session.setAttribute("reason","return");
            mav.setViewName("showalllend");
            b.setSite("归还");
        }
        else if(site.equals("已归还")){
            session.setAttribute("reason","finish");
            b.setSite("已结束");
            b.setRtime(date);
        }
        session.setAttribute("opra",0);
        borrowService.updateBorrow(b);
        return mav;
    }

    @RequestMapping(params = "method=sum")
    public ModelAndView sum(){
        User u=(User)session.getAttribute("user");
        List<Borrow>b1=borrowService.getBorrowByUid(u.getUnitname(),"已借出");//待归还
        List<Borrow>b2=borrowService.getBorrowByUid(u.getUnitname(),"归还");//待归还
        int sumlend=b1.size()+b2.size();//借出的标本
        List<Spec> allSpec = specService.getAllSpec(u.getUnitname());
        int sum=allSpec.size();//总数
        int inunit=sum-sumlend;//在库
        mav.setViewName("shownum");
        mav.addObject("sum",sum);
        mav.addObject("inunit",inunit);
        List<Borrow>b3=borrowService.getBorrowByUid(u.getUnitname(),"待审核");
        List<Borrow>b5=borrowService.getBorrowByUid(u.getUnitname(),"已结束");
        List<Borrow>b4=new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        for (Borrow b:b1){ b4.add(b); }
        for (Borrow b:b2){ b4.add(b); }
        for (Borrow b:b3){ b4.add(b); }
        for (Borrow b:b5){ if(b.getRtime()!=null){b4.add(b);} }
        //按年
        TreeMap<String,Integer>map=new TreeMap<>();
        List<String>yearl=new ArrayList<>();
        List<Integer>cnty=new ArrayList<>();
        for (Borrow b:b4){
            String year=sdf.format(b.getBtime()).substring(0,4);
            //重复次数计算
            if(map.containsKey(year)){
                int cnt=map.get(year);
                cnt++;
                map.put(year,cnt);
            }
            else{
                map.put(year,1);
            }
        }
        for (Map.Entry<String, Integer> m : map.entrySet()){
            yearl.add(m.getKey());
            cnty.add(m.getValue());
        }
        //按月
        TreeMap<String,Integer>map1=new TreeMap<>();//自动sort
        List<String>monl=new ArrayList<>();
        List<Integer>cntm=new ArrayList<>();
        for (Borrow b:b4){
            if(sdf.format(b.getBtime()).substring(0,4).equals("2022")){
                String mon=sdf.format(b.getBtime()).substring(5,7);
//                System.out.println("mon:"+mon);
                if(map1.containsKey(mon)){
                    int cnt=map1.get(mon);
                    cnt++;
                    map1.put(mon,cnt);
                }
                else{
                    map1.put(mon,1);
                }
            }
        }
        for (Map.Entry<String, Integer> m : map1.entrySet()){
            monl.add(m.getKey());
            cntm.add(m.getValue());
        }
        session.setAttribute("yearl",yearl);
        session.setAttribute("cnty",cnty);
        session.setAttribute("monl",monl);
        session.setAttribute("cntm",cntm);
//        session.setAttribute("mon",map1);
//获取数据存入session
//        List<Borrow> borrowList=borrowService.getBorrowByUid();
        return mav;
    }


}
