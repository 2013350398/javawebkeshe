package com.zc.controller;


import com.zc.pojo.Borrow;
import com.zc.pojo.Spec;
import com.zc.pojo.User;
import com.zc.service.SpecService;
import jxl.Sheet;
import jxl.Workbook;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/spec.do")
public class SpecController {
    ModelAndView mav = new ModelAndView();
    @Autowired
    private SpecService specService;
    @Autowired
    private BorrowController borrowController;
    @Autowired
    HttpSession session;
    @RequestMapping(params = "method=adminshow")
    public ModelAndView showAll(){
        List<Spec> allSpec = specService.showAll();
        mav.setViewName("showallspec");//admin show
        mav.addObject("allSpec",allSpec);
        session.setAttribute("allSpec",allSpec);
        return mav;
    }
    @RequestMapping(params = "method=allSpec")
    public ModelAndView getAllSpec() {//自己单位的所有标本
        User u=(User)session.getAttribute("user");
        List<Spec> allSpec = specService.getAllSpec(u.getUnitname());
        mav.setViewName("showallspec");
        mav.addObject("allSpec",allSpec);
        session.setAttribute("allSpec",allSpec);
        return mav;
    }

    @RequestMapping(params = "method=showOthers")
    public ModelAndView showOthers() {
        User u=(User)session.getAttribute("user");
        List<Spec> allSpec = specService.showOthers(u.getUnitname());
        mav.setViewName("showotherspec");
        mav.addObject("otherSpec",allSpec);
        session.setAttribute("otherSpec",allSpec);
        return mav;
    }
    @RequestMapping("/getSpecById")
    public void getSpecById(int id) {//@RequestParam("specId")
        Spec specById = specService.getSpecById(id);
        mav.addObject("specById", specById);
    }
    @RequestMapping(params = "method=selectSpec")
    public ModelAndView selectSpec(@RequestParam("info") String info,@RequestParam("selecttype") String selecttype){
        User u=(User)session.getAttribute("user");
        String unitname=u.getUnitname();
        List<Spec>specs=new ArrayList<>();
        if(u.getUsername().equals("admin")){//管理员
            if(selecttype.equals("sname")){ specs=specService.selectSpecBySnameAdmin("%"+info+"%");}
            else if(selecttype.equals("site")){specs=specService.selectSpecBySiteAdmin("%"+info+"%");}
            else if(selecttype.equals("material")){specs=specService.selectSpecByMaterialAdmin("%"+info+"%");}
            else if(selecttype.equals("unitname")){specs=specService.selectSpecByUnitnameAdmin("%"+info+"%");}
        }
        else{//工作人员
            if(selecttype.equals("sname")){ specs=specService.selectSpecBySname(unitname,"%"+info+"%");}
            else if(selecttype.equals("site")){specs=specService.selectSpecBySite(unitname,"%"+info+"%");}
            else if(selecttype.equals("material")){specs=specService.selectSpecByMaterial(unitname,"%"+info+"%");}
            else if(selecttype.equals("unitname")){specs=specService.selectSpecByUnitname(unitname,"%"+info+"%");}
        }
        mav.addObject("username",u.getUsername());
        mav.addObject("specs",specs);
        session.setAttribute("specs",specs);
        session.setAttribute("user",u);
        mav.setViewName("selectspec");//工作人员--自己的标本
        return mav;
    }
    @RequestMapping(params = "method=selectOthersSpec")
    public ModelAndView selectOthersSpec(@RequestParam("info") String info,@RequestParam("selecttype") String selecttype){
        User u=(User)session.getAttribute("user");
        String unitname=u.getUnitname();
//        System.out.println(unitname);
        List<Spec>specs=new ArrayList<>();
        if(selecttype.equals("sname")){specs=specService.selectOtherSpecBySname(unitname,"%"+info+"%");}
        else if(selecttype.equals("site")){specs=specService.selectOtherSpecBySite(unitname,"%"+info+"%");}
        else if(selecttype.equals("material")){specs=specService.selectOtherSpecByMaterial(unitname,"%"+info+"%");}
        else if(selecttype.equals("unitname")){specs=specService.selectOtherSpecByUnitname(unitname,"%"+info+"%");}
        mav.addObject("username",u.getUsername());
        mav.addObject("otherspecs",specs);
        session.setAttribute("otherspecs",specs);
        session.setAttribute("user",u);
        mav.setViewName("selectotherspec");//工作人员--其他单位的标本
        return mav;
    }
    @RequestMapping(params = "method=addSpec")
    public ModelAndView addSpec(Spec spec) {
        //标本编号重复判断
        User u=(User)session.getAttribute("user");
        List<Spec>s=specService.getAllSpec(u.getUnitname());
        for(Spec ss:s){
            System.out.println(ss.toString());
            if(ss.getCode().equals(spec.getCode())){//编号重复
                mav.setViewName("addspec");
                session.setAttribute("opra",1);
                session.setAttribute("reason","specadd");
                return mav;
            }
        }
        //更新session
        try{
            Object obj=session.getAttribute("allSpec");
            List<Spec>specs=new ArrayList<>();
            for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
            specs.add(spec);
            session.setAttribute("allSpec",specs);
        }
        catch(Exception e){}
        //增加
        Date date=new Date();
        spec.setEntrytime(date);//设置入库时间
        specService.addSpec(spec);
//        List<Spec> speclist=specService.showAll();
//        Spec temp=speclist.get(speclist.size()-1);
////        System.out.println(temp.toString());
//        session.setAttribute("modifyspec",temp);
        session.setAttribute("opra",0);
        session.setAttribute("reason","specadd");
        mav.setViewName("stafffunc");//回到staff主页面addspecsucess
        return mav;//详细信息注册
    }
    //excel上传
    @RequestMapping(params = "method=addExcel")
    public ModelAndView addExcel(@Param("road") String road, @Param("entryman") String entryman, @Param("unitname") String unitname) throws Exception{
        Workbook wb = Workbook.getWorkbook(new File(road));
        Sheet sheet = wb.getSheet("Sheet1");
        Spec spec=new Spec();
        for (int i = 1; i < sheet.getRows(); i++) {
            for (int j = 0; j < sheet.getColumns(); j++) {
                String s=sheet.getCell(j,i).getContents();
                switch (j){
                    case 0:
                        spec.setCode(s);
                    case 1:
                        spec.setSname(s);
                        break;
                    case 2:
                        spec.setSite(s);
                        break;
                    case 3:
                        spec.setExcavatetime(s);
                        break;
                    case 4:
                        spec.setMaterial(s);
                        break;
                    case 5:
                        spec.setAges(s);
                        break;
                    case 6:
                        spec.setDescr(s);
                        break;
                    case 7:
                        spec.setState(s);
                        break;
                    default:
                        break;
                }
            }
            Date date=new Date();
            spec.setEntrytime(date);//设置入库时间
            spec.setEntryman(entryman);
            spec.setUnitname(unitname);
            specService.addSpec(spec);
            session.setAttribute("opra",0);
            session.setAttribute("reason","excelload");//修改成功
            mav.setViewName("stafffunc");//addexcelsucess
        }

        return mav;//详细信息注册
    }
    @RequestMapping(params = "method=deleteSpec")
    public ModelAndView deleteSpec(int id) {//@PathVariable("specId")
        User user=(User)session.getAttribute("user");
        Spec u=specService.getSpecById(id);
        if(borrowController.checkBorrow(user.getUid(),id)){
            session.setAttribute("opra",1);
            session.setAttribute("reason","deletefail");//标本删除失败！正在被借阅中……
        }
        else{
            try{
                //更新session
                Object obj=session.getAttribute("allSpec");
                List<Spec>specs=new ArrayList<>();
                for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
                specs.remove(u);
                session.setAttribute("allSpec",specs);
            }catch(Exception e){}
            //先删除borrow的相关记录
            Object obj=session.getAttribute("deleteborrow");
            List<Borrow> bs=new ArrayList<>();
            for (Object o: (List<?>) obj){
                borrowController.deleteBorrow(Borrow.class.cast(o).getBid());
                bs.add(Borrow.class.cast(o));//不用写
            }
            specService.deleteSpec(id);
            session.setAttribute("reason","deletesucess");
            session.setAttribute("opra",0);
        }
        mav.setViewName("showallspec");
        return mav;
    }
    @RequestMapping(params = "method=updateSpec")
    public ModelAndView updateSpec(Spec spec,@Param(value="id") int id) {
        Spec temp=specService.getSpecById(id);
        spec.setEntrytime(temp.getEntrytime());//设置入库时间
        try{//更新session
            Object obj=session.getAttribute("allSpec");
            List<Spec>specs=new ArrayList<>();
            for (Object o: (List<?>) obj){ specs.add(Spec.class.cast(o)); }
            specs.remove(temp);
            specs.add(spec);
            session.setAttribute("allSpec",specs);
        }catch(Exception e){}
        //更新数据库
        spec.setSid(id);
        specService.updateSpec(spec);
        mav.setViewName("showallspec");//modifyspecsucess
        mav.addObject("spec",spec);
        session.setAttribute("spec",spec);
        session.setAttribute("opra",0);
        session.setAttribute("reason","modifysucess");
        return mav;
    }

    //上传图片(只在modify里面用)
    @RequestMapping(params="method=uploadhead")
    public ModelAndView upload(MultipartFile head, HttpSession session){
        //判断用户是否上传了文件
        if(!head.isEmpty()){
            //文件上传的地址
            String realPath = session.getServletContext().getRealPath("/pic");
            //获取文件的名称
            final String fileName = head.getOriginalFilename();
            //限制文件上传的类型
            String contentType = head.getContentType();
            if(("image/jpeg".equals(contentType))||"image/png".equals(contentType)){
                File file = new File(realPath,fileName);
                Spec spec=(Spec)session.getAttribute("modifyspec");
                spec.setPic(fileName);
                updateSpec(spec,spec.getSid());
                //完成文件的上传
                try{head.transferTo(file);}catch (Exception e){}
                mav.addObject("filename",fileName);
                mav.setViewName("uploadpicsuccess");
                return mav;
            }
        }
        session.setAttribute("opra",1);
        session.setAttribute("reason","jpgorpng");
        mav.setViewName("modifyspecpic");
        return mav;
    }
}
