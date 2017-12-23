package com.dancer.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.dancer.util.MD5Util;

import org.springframework.beans.factory.annotation.Autowired;

import com.dancer.entity.Movie;
import com.dancer.service.Movieservice;
	
@Controller
@RequestMapping("/movie")
public class Moviecontroller{
	private String moviename;
	
	@Autowired
	private Movieservice movieservice;
	
	
	@RequestMapping(value="/upload",produces="text/html;charset=utf-8")//防止return返回乱码
	public @ResponseBody String upload(MultipartFile file1,HttpSession session) throws IllegalStateException, IOException{
		// 获取server上的真实路径
		String realPath = session.getServletContext().getRealPath("/uploadfils");
		// 创建 要上传的目标文件对象(文件名 同 原文件名)
		String name = file1.getOriginalFilename();
		
		String[] split = name.split("\\.mp");
		moviename=split[0];
		String JMmoviename= MD5Util.encodeValue(moviename);
		File descFile = new File(realPath + "/" +JMmoviename+".mp4");
		// 文件上传
		file1.transferTo(descFile);
		String JMname=JMmoviename+".mp4";
		System.out.println(JMname);
		return JMname;
		}
	@RequestMapping("/all")
	public @ResponseBody List<Movie> queryAll(){
		List<Movie> all = movieservice.querytAll();
		return all;	
	}
	@RequestMapping("/add")
	public @ResponseBody String addMusic(Movie movie){
		movie.setImg(moviename);
		if(movieservice.queryMovieByName(movie.getImg())==null){
			movieservice.addMovie(movie);
			return "success";
		}else{
			return "no";
		}
	}
	@RequestMapping("/bycategory")
	public @ResponseBody List<Movie> querybycategory(String category){
		List<Movie> list = movieservice.querycategory(category);
		return list;	
	}
	@RequestMapping("/byid")
	public @ResponseBody Movie queryId(Integer id){
	Movie byId = movieservice.queryById(id);
		return byId;	
	}
	@RequestMapping("/remove")
	public @ResponseBody String removeMovie(Integer[] id){
		movieservice.removeMovie(id);
		return "success";	
	}
}