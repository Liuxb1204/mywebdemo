package com.dancer.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dancer.util.Captcha;

@Controller
@RequestMapping("/image")
public class ImageController {
	
	@RequestMapping("/img")
	public void createImage(HttpServletResponse response,HttpSession session) throws IOException{
		Captcha cap = Captcha.getInstance();
		cap.set(100,40);//设置图片的宽高
		String code = cap.generateCheckcode();//获得随机码
		
		// 往session中存验证码
		session.setAttribute("code", code);
		
		BufferedImage img = cap.generateCheckImg(code);//验证码图片
		
		//ImageIO(被写出的图片,图片类型JPG,输出流);//
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(img, "JPG", out);
	}
}
