package com.dancer.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.dancer.entity.Movie;

public interface MovieDao {
	public List<Movie> selectAll();
	public List<Movie> selectcategory(@Param("category")String category);//根据标签查询
	public void insertMovie(Movie movie);
	public Movie selectByName(@Param("img")String name);
	public Movie selectById(Integer id);
	public void deleteMovie(@Param("ids")Integer[]id);
}
