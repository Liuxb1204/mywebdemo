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
		
		// ���÷����ʼ��Ļ�������   
		final Properties props = new Properties();
		//������
		String fa="15732174319@163.com";
		String biaoti="��֤��";
		String neir="9999";
		String shoujr="1139004746@qq.com";
	    // ��ʾSMTP�����ʼ�����Ҫ���������֤  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.host", "smtp.163.com");  
	    // �����˵��˺�  
	    props.put("mail.user",fa);  
	    // ����SMTP����ʱ��Ҫ�ṩ������  
	    props.put("mail.password", "dancer6666");
	    // ������Ȩ��Ϣ�����ڽ���SMTP���������֤  
	    Authenticator authenticator = new Authenticator() {  
	        @Override  
	        protected PasswordAuthentication getPasswordAuthentication() {  
	            // �û���������  
	            String userName = props.getProperty("mail.user");  
	            String password = props.getProperty("mail.password");  
	            return new PasswordAuthentication(userName, password);  
	        }  
	    };  
	    // ʹ�û������Ժ���Ȩ��Ϣ�������ʼ��Ự  
	    Session mailSession = Session.getInstance(props, authenticator);  
	    // �����ʼ���Ϣ  
	    MimeMessage message = new MimeMessage(mailSession);  
	    // ���÷�����  
	    InternetAddress form = new InternetAddress(props.getProperty("mail.user"));  
	    message.setFrom(form);  
	    // �����ռ���  
	    InternetAddress to = new InternetAddress(shoujr);  
	    message.setRecipient(RecipientType.TO, to);  
	    // �����ʼ�����  
	    message.setSubject(biaoti);  
	    // �����ʼ���������  
	    message.setContent(neir,"text/html;charset=UTF-8");  
	    // �����ʼ�  
	    Transport.send(message);  
	}
	
}
