package com.dancer.service;

import java.util.List;

import com.dancer.entity.Movie;

public interface Movieservice {
	public List<Movie> querytAll();
	public List<Movie> querycategory(String category);//���ݱ�ǩ��ѯ
	public void addMovie(Movie movie);
	public Movie queryMovieByName(String name);
	public Movie queryById(Integer id);
	public void removeMovie(Integer[]id);
}
