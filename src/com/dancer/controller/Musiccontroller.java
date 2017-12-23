package com.dancer.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.dancer.entity.Music;
import com.dancer.entity.fy.Musicfy;
import com.dancer.service.MusicService;
import com.dancer.util.MD5Util;
@Controller
@RequestMapping("/music")
public class Musiccontroller {
	@Autowired
	private MusicService musicservice;
	private String name2;
	
	@RequestMapping(value="/upload",produces="text/html;charset=utf-8")//��ֹreturn��������
	public @ResponseBody String upload(MultipartFile file1,HttpSession session) throws IllegalStateException, IOException{
		// ��ȡserver�ϵ���ʵ·��
		//System.out.println(file1+"2222222222222222222222222");
		String realPath = session.getServletContext().getRealPath("/uploadfils");
		// ���� Ҫ�ϴ���Ŀ���ļ�����(�ļ��� ͬ ԭ�ļ���)
		String name = file1.getOriginalFilename();
		String[] split = name.split("\\.mp");
		String jmname=split[0];
		String JMmusicname= MD5Util.encodeValue(jmname);
		File descFile = new File(realPath + "/" +JMmusicname+".mp3");
		// �ļ��ϴ�
		file1.transferTo(descFile);
		name2=JMmusicname+".mp3";
		return jmname;
		}
	
	@RequestMapping("/all")
	@RequiresPermissions("user:query")
	public @ResponseBody Musicfy queryAll(String name,Integer page,Integer rows){
		int shouye=page*rows-(rows-1);
		int weiye=page*rows;	
			if(name==null){
				Integer total=musicservice.queryCount();
					List<Music> list = musicservice.queryAllFy(shouye, weiye);
					//System.out.println("��ʾ"+rows+"��"+page+"ҳ"+"��"+total+"������--��"+shouye+"������"+weiye+"��");
					return new Musicfy(list,total);
			}else{
				List<Music> list = musicservice.queryLikeName(shouye, weiye, name);
				Integer total = musicservice.querycountName(name);
				return new Musicfy(list,total);
			}
			
		}	
	@RequestMapping("/add")
	public @ResponseBody String addMusic(Music music){
		music.setJmname(name2);
		System.out.println(musicservice.queryByName(music.getSongname())+"===============");
		if(musicservice.queryByName(music.getSongname())==null){
			musicservice.addMusic(music);
			return"success";
		}
		System.out.println(musicservice.queryByName(music.getSongname())+"----------------");
		return "error";
	}
	@RequestMapping("/remove")
	public @ResponseBody String removeMusic(Integer[]id){		
		musicservice.removeMusic(id);
		return "success";
	}
	@RequestMapping("/biaoqianselcet")
	public @ResponseBody Musicfy selectbiaoqian(Integer page,@RequestParam(value="rows", defaultValue="5")Integer rows,String category){
		//rows=5;
		int shouye=page*rows-(rows-1);
		int weiye=page*rows;
		if(category.equals("my")){
			category="��ҥ����";
		}else if(category.equals("lx")){
			category="��������";
		}else if(category.equals("dy")){
			category="����֮��";
		}else{
			category="�й��ŷ�";
		}
		List<Music> list = musicservice.queryCategory(shouye,weiye,category);
		Integer total = musicservice.categoryQueryCount(category);
		//System.out.println("��ʾ"+rows+"��"+page+"ҳ"+"��"+total+"������--��"+shouye+"������"+weiye+"��"+category+"-----------controller");
		return new Musicfy(list,total);
	}
	@RequestMapping("/querybyid")
	public @ResponseBody String queryById(Integer id,HttpSession session){		
		Music music = musicservice.querySongById(id);
		String jmName=music.getJmname();
		String songname=music.getSongname()+"-"+music.getSinger();
		session.setAttribute("jmname",jmName);
		session.setAttribute("songname",songname);
		return "ok";
	}
}
