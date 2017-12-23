package com.dancer.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dancer.dao.MovieDao;
import com.dancer.entity.Movie;
import com.dancer.service.Movieservice;

@Service
public class MovieServiceImpl implements Movieservice {
	@Autowired
	private MovieDao moviedao;
	

	public List<Movie> querytAll() {
		// TODO Auto-generated method stub
		List<Movie> all = moviedao.selectAll();
		return all;
	}

	public List<Movie> querycategory(String category) {
		// TODO Auto-generated method stub
		List<Movie> list = moviedao.selectcategory(category);
		return list;
	}

	public void addMovie(Movie movie) {
		// TODO Auto-generated method stub
		moviedao.insertMovie(movie);

	}

	public void removeMovie(Integer[] id) {
		// TODO Auto-generated method stub
		moviedao.deleteMovie(id);
	}

	public Movie queryMovieByName(String name) {
		// TODO Auto-generated method stub
		Movie byName = moviedao.selectByName(name);
		return byName;
	}

	public Movie queryById(Integer id) {
		// TODO Auto-generated method stub
		Movie selectById = moviedao.selectById(id);
		return selectById;
	}

}
