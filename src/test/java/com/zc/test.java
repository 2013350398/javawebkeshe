package com.zc;

import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class test {
    public static void main(String[] args) {
        try {
            sendEmail();
//        sendEmail("smtp.163.com", "m18838032551@163.com",
//                "kcevaojodudbfhcj",  "2013350398@qq.com", "密码找回",
//                "testnumber", "text/html;charset=gb2312");
        }catch(Exception e){}
    }
    public static void sendEmail()throws Exception{
        String from = "cmz020605@163.com";//发送方
        String to = "m18838032551@163.com";//收件方
        String subject = "密码找回";//标题
        String body = "test";
        String smtpHost = "smtp.163.com";//"220.181.12.16"//smtp.qq.com/smtp.sohu.com
        String smtpPort="465";
        Properties props = new Properties();
        props.put("mail.smtp.port",smtpPort); //google使用465或587端口//
        props.put("mail.smtp.ssl.enable", true);//该jar的email对于ssl的支持不对，少设置了一个属性
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", smtpHost); // 发件人的邮箱的 SMTP服务器地址
        props.setProperty("mail.smtp.auth", "true"); // 请求认证，参数名称与具体实现有关
        System.setProperty("java.net.preferIPv4Stack", "true");

        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");

        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        // 创建Session实例对象
        Session session = Session.getDefaultInstance(props);
        // 创建MimeMessage实例对象
        MimeMessage message = new MimeMessage(session);
        // 设置发件人
        message.setFrom(new InternetAddress(from));
        // 设置收件人
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        // 设置发送日期
        message.setSentDate(new Date());
        // 设置邮件主题
        message.setSubject(subject);
        // 设置纯文本内容的邮件正文
        message.setText(body);
        // 保存并生成最终的邮件内容
        message.saveChanges();
        // 设置为debug模式, 可以查看详细的发送 log
        session.setDebug(true);
        // 获取Transport对象
        Transport transport = session.getTransport("smtp");
        // 第2个参数需要填写的是QQ邮箱的SMTP的授权码，什么是授权码，它又是如何设置？
        System.out.println("1");
        transport.connect(smtpHost,from, "NZBMDBLQAFZUGRIV");//kcevaojodudbfhcj
        // 发送，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        System.out.println("2");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        System.out.println("3");

    }
    public static void sendEmail(String smtpHost, String from,
                          String fromUserPassword, String to, String subject,
                          String messageText, String messageType) throws Exception{
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.auth", "true"); // 使用验证
//        props.put("mail.smtp.starttls.enable", "true");// 使用 STARTTLS安全连接
         props.put("mail.smtp.port", "465"); //google使用465或587端口//
        // props.put("mail.debug", "true");
//        Session mailSession = Session.getInstance(props, new Authenticator(){
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(from, fromUserPassword); }});

        //创建Session实例对象
        Session mailSession = Session.getDefaultInstance(props, null);
        //编写消息

        //创建MimeMessage实例对象
        MimeMessage message = new MimeMessage(mailSession);
        //设置发件人
        InternetAddress fromAddress = new InternetAddress(from,"UTF-8");
        message.setFrom(fromAddress);
        //设置收件人
        InternetAddress toAddress = new InternetAddress(to);
        message.addRecipient(MimeMessage.RecipientType.TO, toAddress);
        //设置发送日期
        message.setSentDate(Calendar.getInstance().getTime());
        //设置邮件主题
        message.setSubject(subject);
        //设置纯文本内容的邮件正文
        message.setContent(messageText, messageType);
        //保存并生成最终的邮件内容
        message.saveChanges();

        mailSession.setDebug(true);
        // 第三步：发送消息
        //获取Transport对象
        Transport transport = mailSession.getTransport("smtp");
        //
        System.out.println("message 1");

        transport.connect(from, fromUserPassword);
//        transport.connect(smtpHost, "m18838032551", fromUserPassword);
        System.out.println("message 2");
        //
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
//        transport.send(message, message.getRecipients(MimeMessage.RecipientType.TO));
        System.out.println("message yes");
    }
    //字符串合法性检验
    public static boolean isemail(String email){ return Pattern.matches("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+", email); }
    public static boolean istel(String tel){ return Pattern.matches("^1[3-9]\\d{9}$",tel); }
}
