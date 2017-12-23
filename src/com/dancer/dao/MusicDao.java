package com.dancer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dancer.entity.Music;
public interface MusicDao {
	public List<Music> selectAllFy(@Param("rownum")Integer page,@Param("rownum2")Integer rows);//查询所有（分页）
	public Integer selectCount();//查询多少条数（分页用）
	public Integer categorySelectCount(String category);//根据类别查询
	public List<Music> selectcategory(@Param("rownum")Integer page,@Param("rownum2")Integer rows,@Param("category")String category);//根据标签查询
	public void insertMusic(Music music);
	public List<Music> selectLikeName(@Param("rownum")Integer page,@Param("rownum2")Integer rows,@Param("songname")String name);//根据名字查询
	public Integer selectcountName(@Param("songname")String name);//根据名字查询条数
	public void deleteMusic(@Param("ids")Integer[]id);
	public Music selectSong(Integer id);//id查询歌
	public Music selectByName(@Param("songname")String name);
}
