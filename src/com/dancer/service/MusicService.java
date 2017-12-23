package com.dancer.service;

import java.util.List;


import com.dancer.entity.Music;

public interface MusicService {
	public List<Music>queryAllFy(Integer page,Integer rows);
	public List<Music> queryCategory(Integer page,Integer rows,String category);//根据标签查询
	public List<Music> queryLikeName(Integer page,Integer rows,String name);
	public Integer queryCount();//查询多少条数（分页用）
	public Integer categoryQueryCount(String category);
	public void addMusic(Music music);
	public void removeMusic(Integer[]id);
	public Integer querycountName(String name);
	public Music querySongById(Integer id);//id查询歌
	public Music queryByName(String name);
}
