package com.zc;
import java.awt.*;
import java.io.File;
import com.zc.pojo.User;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//工具类
public class tool {
    //字符串合法性检验
    public static boolean isemail(String email){ return Pattern.matches("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+", email); }
    public static boolean istel(String tel){ return Pattern.matches("^1[3-9]\\d{9}$",tel); }
    //用户修改：空白不改
    public static User changeinfo(User a, User b){
        if(a.getPassword()==null||a.getPassword().equals("\\s*")){ a.setPassword(b.getPassword()); }
        if(a.getRealname()==null||a.getRealname().equals("\\s*")){ a.setRealname(b.getRealname()); }
        if(a.getTel()==null||a.getTel().equals("\\s*")){ a.setTel(b.getTel()); }
        if(a.getEmail()==null||a.getEmail().equals("\\s*")){ a.setEmail(b.getEmail()); }
        if(a.getHome()==null||a.getHome().equals("\\s*")){ a.setHome(b.getHome()); }
        if(a.getNum()==null||a.getNum().equals("\\s*")){ a.setNum(b.getNum()); }
        if(a.getRegist()==null||a.getRegist().equals("\\s*")){ a.setRegist(b.getRegist()); }
        if(a.getCreattime()==null||a.getCreattime().equals("\\s*")){ a.setCreattime(b.getCreattime()); }
        if(a.getSexy()==null||a.getSexy().equals("\\s*")){ a.setSexy(b.getSexy()); }
        if(a.getHead()==null||a.getHead().equals("\\s*")){ a.setHead(b.getHead()); }
        if(a.getState()==null||a.getState().equals("\\s*")){ a.setState(b.getState()); }
        if(a.getLasttime()==null||a.getLasttime().equals("\\s*")){ a.setLasttime(b.getLasttime()); }
        if(a.getUnitname()==null||a.getUnitname().equals("\\s*")){ a.setUnitname(b.getUnitname()); }
        if(a.getAnswer()==null||a.getAnswer().equals("\\s*")){a.setAnswer(b.getAnswer());}
        return a;
    }
    //发送邮件
    public void sendEmail(String smtpHost, String from,
                          String fromUserPassword, String to, String subject,
                          String messageText, String messageType) throws Exception{
        Properties props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.starttls.enable", "true");// 使用 STARTTLS安全连接
        // props.put("mail.smtp.port", "25"); //google使用465或587端口
        props.put("mail.smtp.auth", "true"); // 使用验证
        // props.put("mail.debug", "true");
        Session mailSession = Session.getInstance(props, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, fromUserPassword); }});
        //编写消息
        InternetAddress fromAddress = new InternetAddress(from);
        InternetAddress toAddress = new InternetAddress(to);

        MimeMessage message = new MimeMessage(mailSession);

        message.setFrom(fromAddress);
        message.addRecipient(MimeMessage.RecipientType.TO, toAddress);

        message.setSentDate(Calendar.getInstance().getTime());
        message.setSubject(subject);
        message.setContent(messageText, messageType);
        // 第三步：发送消息
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(smtpHost, "chaofeng19861126", fromUserPassword);
        transport.send(message, message.getRecipients(MimeMessage.RecipientType.TO));
        System.out.println("message yes");

//f2
//            SimpleMailMessage message = new SimpleMailMessage();
//            message.setSubject("密码找回");
//            message.setFrom("2013350398@qq.com");
//            message.setTo(email);
//            message.setSentDate(new Date());
//            message.setText(findpwdkey);
//            javaMailSender.send(message);


    }
}
