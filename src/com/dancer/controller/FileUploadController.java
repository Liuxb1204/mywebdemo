package com.dancer.controller;


import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.dancer.util.MD5Util;

@Controller
@RequestMapping("/file")
public class FileUploadController {
@RequestMapping(value="/upload",produces="text/html;charset=utf-8")//防止return返回乱码
public @ResponseBody String upload(MultipartFile file1,HttpSession session) throws IllegalStateException, IOException{
	// 获取server上的真实路径
	//System.out.println(file1+"2222222222222222222222222");
	String realPath = session.getServletContext().getRealPath("/uploadfils");
	// 创建 要上传的目标文件对象(文件名 同 原文件名)
	String name = file1.getOriginalFilename();
	File descFile = new File(realPath + "/" +name);
	// 文件上传
	file1.transferTo(descFile);
	return name;
	}
}



