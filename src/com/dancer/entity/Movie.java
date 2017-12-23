package com.dancer.entity;

import java.io.Serializable;

public class Movie implements Serializable {
	private Integer id;
	private String  moviename;
	private String  xiazai;
	private String  img;
	private String  category;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getXiazai() {
		return xiazai;
	}
	public void setXiazai(String xiazai) {
		this.xiazai = xiazai;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Movie(Integer id, String moviename, String xiazai, String img,
			String category) {
		super();
		this.id = id;
		this.moviename = moviename;
		this.xiazai = xiazai;
		this.img = img;
		this.category = category;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", moviename=" + moviename + ", xiazai="
				+ xiazai + ", img=" + img + ", category=" + category + "]";
	}
	public Movie(){}
	
}
