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
@RequestMapping(value="/upload",produces="text/html;charset=utf-8")//��ֹreturn��������
public @ResponseBody String upload(MultipartFile file1,HttpSession session) throws IllegalStateException, IOException{
	// ��ȡserver�ϵ���ʵ·��
	//System.out.println(file1+"2222222222222222222222222");
	String realPath = session.getServletContext().getRealPath("/uploadfils");
	// ���� Ҫ�ϴ���Ŀ���ļ�����(�ļ��� ͬ ԭ�ļ���)
	String name = file1.getOriginalFilename();
	File descFile = new File(realPath + "/" +name);
	// �ļ��ϴ�
	file1.transferTo(descFile);
	return name;
	}
}



