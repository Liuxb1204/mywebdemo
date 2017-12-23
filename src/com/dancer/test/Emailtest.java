package com.dancer.test;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Emailtest {
	public static void main(String[] args)throws MessagingException{
		
		// 配置发送邮件的环境属性   
		final Properties props = new Properties();
		//发件人
		String fa="15732174319@163.com";
		String biaoti="验证码";
		String neir="9999";
		String shoujr="1139004746@qq.com";
	    // 表示SMTP发送邮件，需要进行身份验证  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.host", "smtp.163.com");  
	    // 发件人的账号  
	    props.put("mail.user",fa);  
	    // 访问SMTP服务时需要提供的密码  
	    props.put("mail.password", "dancer6666");
	    // 构建授权信息，用于进行SMTP进行身份验证  
	    Authenticator authenticator = new Authenticator() {  
	        @Override  
	        protected PasswordAuthentication getPasswordAuthentication() {  
	            // 用户名、密码  
	            String userName = props.getProperty("mail.user");  
	            String password = props.getProperty("mail.password");  
	            return new PasswordAuthentication(userName, password);  
	        }  
	    };  
	    // 使用环境属性和授权信息，创建邮件会话  
	    Session mailSession = Session.getInstance(props, authenticator);  
	    // 创建邮件消息  
	    MimeMessage message = new MimeMessage(mailSession);  
	    // 设置发件人  
	    InternetAddress form = new InternetAddress(props.getProperty("mail.user"));  
	    message.setFrom(form);  
	    // 设置收件人  
	    InternetAddress to = new InternetAddress(shoujr);  
	    message.setRecipient(RecipientType.TO, to);  
	    // 设置邮件标题  
	    message.setSubject(biaoti);  
	    // 设置邮件的内容体  
	    message.setContent(neir,"text/html;charset=UTF-8");  
	    // 发送邮件  
	    Transport.send(message);  
	}
	
}
