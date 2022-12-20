package com.zc.controller;

import com.zc.pojo.*;
import com.zc.service.BorrowService;
import com.zc.service.UnitService;
import com.zc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.zc.tool.*;

@Controller
@RequestMapping("/user.do")
public class UserController{
    @Autowired
    private UserService userService;
    @Autowired
    private UnitService unitService;
    @Autowired
    private BorrowService borrowService;
    @Autowired
    private CharaController charaController;
    @Autowired
    private  UCController ucController;

    ModelAndView mav=new ModelAndView();
    @Autowired
    HttpSession session;
    @RequestMapping(params = "method=login")
    public ModelAndView login(User user){
        List<User> allUser = userService.getAllUser();
        List<Unit> allUnit=unitService.getAllUnit();
        session.setAttribute("allUnit",allUnit);
        if(user.getUsername().equals("admin")&&user.getPassword().equals("123")){//管理员
            String str="";
            for (User u:allUser){ str+=(u.getUid()+"\t\t"+u.getUsername()+"<br>"); }
            session.setAttribute("user",userService.getUserByName("admin"));
            mav.addObject("str",str);
            session.setAttribute("opra",0);
            session.setAttribute("reason","login");
            mav.setViewName("adminfunc");
            return mav;
        }
        else{//普通用户
            for (User u:allUser){
                if(u.getUsername().equals(user.getUsername())&&u.getPassword().equals(user.getPassword())){//登录成功
                    UC uc=ucController.getUCById(u.getUid(),0);//等会把cid修改一下细节
                    Chara c=charaController.getCharaById(uc.getCid());
                    Date date=new Date();
                    u.setLasttime(date);//更新登陆时间
                    userService.updateUser(u);
                    if(c.getCname().equals("工作人员")){mav.setViewName("stafffunc"); }//工作人员页面
                    else{mav.setViewName("loginsucess");}//普通用户页面
                    mav.addObject("user",u);//和test.jsp中的变量名对应
                    session.setAttribute("opra",0);
                    session.setAttribute("reason","login");
                    session.setAttribute("user",u);
                    return mav;
                }
            }
            session.setAttribute("opra",1);
            session.setAttribute("reason","loginfail");//registeragain
            mav.setViewName("login");//登录失败
        }
        return mav;
    }
    @RequestMapping(params = "method=allUser")
    public ModelAndView getAllUser(){
        List<User> allUser = userService.getAllUser();
        mav.setViewName("showalluser");//jsp路径控制    跳转showdetailinfo
        mav.addObject("allUser",allUser);//和test.jsp中的变量名对应
        session.setAttribute("allUser",allUser);
        return mav;
    }
    @RequestMapping("/getUserById")
    public User getUserById(int id) {
        User userById = userService.getUserById(id);
        mav.addObject("userById",userById);
        return userById;
    }
    @RequestMapping(params = "method=addUser")
    public ModelAndView addUser(MultipartFile head, User user){
        if(user.getUnitname()==null){ user.setUnitname("null"); }//普通用户单位设置null
        if(isemail(user.getEmail())&&istel(user.getTel())){
            List<User> allUser = userService.getAllUser();
            for (User u:allUser){
                if(u.getUsername().equals(user.getUsername())){//重名
//                    mav.setViewName("");//jsp路径控制
                    session.setAttribute("opra",1);
                    session.setAttribute("reason","useradd");//registeragain
                    mav.setViewName("register");
                    return mav;//跳转到留言页面
                }
            }
            addf(user,"普通用户");
            mav.setViewName("loginsucess");//普通用户登录
            mav.addObject("username",user.getUsername());//和test.jsp中的变量名对应
            session.setAttribute("user",user);
            session.setAttribute("opra",0);
            session.setAttribute("reason","register");//registeragain
            return mav;
        }
        session.setAttribute("opra",1);
        session.setAttribute("reason","teloremail");//registeragain
        mav.setViewName("register");
        return mav;//详细信息注册
    }
    @RequestMapping(params = "method=addStaff")
    public ModelAndView addStaff(MultipartFile head, User user) {
        if(user.getUnitname()==null){ user.setUnitname("null"); }//普通用户单位设置null
        if(isemail(user.getEmail())&&istel(user.getTel())){
            List<User> allUser = userService.getAllUser();
            for (User u:allUser){
                if(u.getUsername().equals(user.getUsername())){//重名
                    mav.setViewName("addstaff");//jsp路径控制addstaffagain
                    session.setAttribute("opra",1);
                    session.setAttribute("reason","useradd");
                    return mav;
                }
            }
            user.setNum(user.getUsername());//设置工作编号
            if(user.getPassword().equals("")){user.setPassword(user.getUsername().substring(user.getUsername().length()-4,user.getUsername().length()));}//设置默认密码：num后四位
            addf(user,"工作人员");
            mav.setViewName("adminfunc");//jsp路径控制addstaffsucess
            mav.addObject("username",user.getUsername());//和test.jsp中的变量名对应
            session.setAttribute("opra",0);
            session.setAttribute("reason","useradd");
            session.setAttribute("userin",user);
            return mav;
        }
        session.setAttribute("opra",1);
        session.setAttribute("reason","teloremail");
        mav.setViewName("addstaff");//
        return mav;
    }
    @RequestMapping(params = "method=deleteUser")
    public ModelAndView deleteUser(int id) {
        //如果还有没归还的标本则提示不能删除
        List<Borrow>b1=borrowService.getLendByUid(id,"已借出");//待归还
        List<Borrow>b2=borrowService.getLendByUid(id,"归还");//归还待确认
        if(b1.size()==0&&b2.size()==0){//可以删除
            deldetef(id);
            session.setAttribute("opra",0);
            session.setAttribute("reason","userdel");
        }else{
            session.setAttribute("opra",1);
            session.setAttribute("reason","userdel");
        }//不能删除
        mav.setViewName("showalluser");
        return mav;
    }
    @RequestMapping(params="method=updateUser")
    public ModelAndView updateUser(User user) {
        User u=(User)session.getAttribute("user");
        //判断tel和email合法性
        if(isemail(user.getEmail())&&istel(user.getTel())){
            User temp=userService.getUserByName(user.getUsername());//原属性
            user.setUid(temp.getUid());
            user=changeinfo(user,temp);//非空属性不变
            try{
                //更新session
                Object obj=session.getAttribute("allUser");
                List<User>users=new ArrayList<>();
                for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
                users.remove(temp);
                session.setAttribute("allUser",users);
                users.add(user);
            }catch(Exception e){}
            //更新数据库
            userService.updateUser(user);
            mav.addObject("user",user);
            if(!u.getState().equals("admin")){session.setAttribute("user",user);}//在这里user被改了
            session.setAttribute("opra",0);
            session.setAttribute("reason","userupdate");//修改成功
        }
        else{
            session.setAttribute("opra",1);
            session.setAttribute("reason","telormail");//电话或邮箱格式非法或为空……
            mav.setViewName("modifydetailinfo");//
            return mav;
        }
        //页面跳转
        if(u.getState().equals("admin")){mav.setViewName("showalluser");}
        else if(u.getState().equals("工作人员")){mav.setViewName("stafffunc");}
        else if(u.getState().equals("普通用户")){mav.setViewName("loginsucess");}
        return mav;
    }

    @RequestMapping(params="method=findpassword")
    public ModelAndView findpassword(@Param("username") String username, @Param("answer") String answer){
        List<User> allUser = userService.getAllUser();
        for (User u:allUser){
            if((u.getUsername()).equals(username)){
                if((u.getAnswer()).equals(answer)){
                    //产生四位随机数进入session
//                    Random r=new Random();
//                    int findpwdkey=r.nextInt(9000)+1000;
//                    session.setAttribute("findpwdkey",findpwdkey);
                    //发送随机数到邮件
//                    sendEmail();
                    //跳转新页面输入随机数进行验证
                    session.setAttribute("user",u);
                    mav.setViewName("findpwd");//匹配成功 验证邮箱
                    return mav;
                }
                else{
                    mav.setViewName("findpassword");
                    session.setAttribute("reason","密保问题答案错误");
                    session.setAttribute("opra",1);
                    return mav;
                }//邮箱不匹配
            }
        }
        session.setAttribute("reason","不存在该用户");
        session.setAttribute("opra",1);
        mav.setViewName("findpassword");
        return mav;
    }

    @RequestMapping(params="method=findpwd")
    public ModelAndView findpwd(@Param("newpassword") String newpassword, @Param("id") int id){
        User u=userService.getUserById(id);
        session.setAttribute("userid",id);
        u.setPassword(newpassword);
        userService.updateUser(u);
        session.setAttribute("opra",0);
        session.setAttribute("reason","findpassword");
        if(u.getState().equals("工作人员")){mav.setViewName("stafffunc");}
        else if(u.getState().equals("普通用户")){mav.setViewName("loginsucess");}
        else if(u.getState().equals("admin")){mav.setViewName("adminfunc");}
        return mav;
    }
    @RequestMapping(params="method=modifyPassword")
    public ModelAndView modifyPassword(@Param("oldpassword") String oldpassword, @Param("newpassword") String newpassword, @Param("id") int id) {
        User u=userService.getUserById(id);
        session.setAttribute("userid",id);
        if(u.getPassword().equals(oldpassword)){
            u.setPassword(newpassword);
            userService.updateUser(u);
            session.setAttribute("opra",0);
            session.setAttribute("reason","passwordmodify");
            if(u.getState().equals("工作人员")){mav.setViewName("stafffunc");}
            else if(u.getState().equals("普通用户")){mav.setViewName("loginsucess");}
            else if(u.getState().equals("admin")){mav.setViewName("adminfunc");}
        }
        else{
            session.setAttribute("opra",1);
            session.setAttribute("reason","olderror");//旧密码错误
            mav.setViewName("modifypassword");
        }
        return mav;
    }

    //上传图片(只在modify里面用)
    @RequestMapping(params="method=uploadhead")
    public ModelAndView upload(MultipartFile head, HttpSession session)throws  Exception{
        //判断用户是否上传了文件
        if(!head.isEmpty()){
            //文件上传的地址
            String realPath = session.getServletContext().getRealPath("/pic");
            //获取文件的名称
            final String fileName = head.getOriginalFilename();
            //限制文件上传的类型
            String contentType = head.getContentType();
//            if("image/jpeg".equals(contentType)){
            if(("image/jpeg".equals(contentType))||"image/png".equals(contentType)){
                File file = new File(realPath,fileName);
                //存储文件名
                User user=(User)session.getAttribute("user");
                if(user.getUsername().equals("admin")){
                    user=(User)session.getAttribute("userin");//获取管理员现在操作的用户
                }
                user.setHead(fileName);
                updateUser(user);//存入数据库
//                session.setAttribute("head",fileName);
                //完成文件的上传
                head.transferTo(file);
                mav.addObject("filename",fileName);
                mav.setViewName("uploadpicsuccess");
                return mav;
            }
        }
        session.setAttribute("opra",1);
        session.setAttribute("reason","jpgorpng");
        mav.setViewName("modifyheadpic");
        //跳转到成功页面
        return mav;
    }

    private void addf(User u,String type){
        //更新session
        try{
            Object obj=session.getAttribute("allUser");
            List<User>users=new ArrayList<>();
            for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
            users.add(u);
            session.setAttribute("allUser",users);}
        catch(Exception e){}
        Date date = new Date();
        //users
        u.setLasttime(date);//更新登陆时间
        u.setCreattime(date);
        u.setState(type);
        u.setHead("初始头像.jpg");
        u.setRegist("是");//默认设置
        userService.addUser(u);
        //chara
        Chara c=new Chara();
        c.setCname(type);
        c.setCreattime(date);
        charaController.addChara(c);
        //uc
        List<User> allUser = userService.getAllUser();
        List<Chara> allChara = charaController.getAllChara();
        UC uc=new UC();
        uc.setUid(allUser.get(allUser.size()-1).getUid());
        uc.setCid(allChara.get(allChara.size()-1).getCid());
        ucController.addUC(uc);
    }

    private void deldetef(int uid){
        //更新session
        Object obj=session.getAttribute("allUser");
        List<User>users=new ArrayList<>();
        for (Object o: (List<?>) obj){ users.add(User.class.cast(o)); }
        User u=userService.getUserById(uid);
        users.remove(u);
        session.setAttribute("allUser",users);
        //users
        userService.deleteUser(uid);
        //uc
        int cid=ucController.selectCid(uid);
        ucController.deleteUC(uid,0);
        //chara
        charaController.deleteChara(cid);
        //borrow
        borrowService.deleteBorrowByUid(uid);
    }
}
