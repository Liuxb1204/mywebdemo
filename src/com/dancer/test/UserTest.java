package com.dancer.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import sun.org.mozilla.javascript.internal.ast.ArrayComprehension;
import com.dancer.controller.FileUploadController;
import com.dancer.entity.Music;
import com.dancer.entity.Movie;
import com.dancer.entity.User;
import com.dancer.service.MusicService;
import com.dancer.service.Movieservice;
import com.dancer.service.UserService;
import com.dancer.util.JJEmailutil;
import com.dancer.util.MD5Util;

public class UserTest {
	private ApplicationContext ctx=new ClassPathXmlApplicationContext("/spring.xml");
//	@Test
//	public void test1(){
//		UserService us= (UserService) ctx.getBean("userServiceImpl");
//		us.addUser(new User(null,"admin","111111"));
//	}
	@Test
	public void test11(){
		UserService us= (UserService) ctx.getBean("userServiceImpl");
		us.Xiugaipsw("dancer","000000");
	}
	@Test
	public void test2(){
		MusicService mo=(MusicService)ctx.getBean("musicServiceImpl");
		Integer count = mo.queryCount();
		System.out.println(count);
	}


	@Test
	public void test7(){
		JOptionPane.showMessageDialog(null, "验证码错误，请重新输入！", "提示", JOptionPane.ERROR_MESSAGE); 
	}
////	@Test
////	public void test4(){
////		PinpaiService pd= (PinpaiService) ctx.getBean("pinpaiService");
//////		List<Pingdao> queryAll = pd.queryAll();
//////		for (Pingdao pingdao : queryAll) {
//////			System.out.println(pingdao);
//////		}
////	}
//	@Test
//	public void test67(){
//		WenzhangService us=(WenzhangService) ctx.getBean("wenzhangServiceImpl");
//		List<Wenzhang> likeAllFy = us.queryLikeAllFy("德玛", 1, 3);
//		for (Wenzhang wenzhang : likeAllFy) {
//			System.out.println(wenzhang);
//		}
//	}
	@Test
	public void test68() throws MessagingException{
		JJEmailutil.yanz("1139004746@qq.com", "验证码", "验证码：0000");
	}
	@Test
	public void test69(){
		Md5Hash md5hash =new Md5Hash("666666","yan",1);
		SimpleHash sm=new  SimpleHash("md5","123456","yan",1);
		System.out.println(md5hash);
		System.out.println(sm);
		String encodeValue = MD5Util.encodeValue("666666");
		System.out.println(encodeValue);
	}
	@Test
	public void test77(){
	String oo="lo.ve.mp4";
	boolean endsWith = oo.endsWith(".mp4");
	System.out.println(endsWith);
	String[] split = oo.split("\\.mp4");
	System.out.println(split[0]);
	}
}

