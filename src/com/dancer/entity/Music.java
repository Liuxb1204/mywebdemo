package com.dancer.entity;

import java.io.Serializable;

public class Music implements Serializable{
	private Integer id;
	private String songname;
	private String jmname;
	private String singer;
	private String state;
	private String lyric;
	private String xiazai;
	private String category;
	
	public Music(Integer id, String songname, String jmname, String singer,
			String state, String lyric, String xiazai, String category) {
		super();
		this.id = id;
		this.songname = songname;
		this.jmname = jmname;
		this.singer = singer;
		this.state = state;
		this.lyric = lyric;
		this.xiazai = xiazai;
		this.category = category;
	}

	@Override
	public String toString() {
		return "Music [id=" + id + ", songname=" + songname + ", jmname="
				+ jmname + ", singer=" + singer + ", state=" + state
				+ ", lyric=" + lyric + ", xiazai=" + xiazai + ", category="
				+ category + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSongname() {
		return songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	public String getJmname() {
		return jmname;
	}

	public void setJmname(String jmname) {
		this.jmname = jmname;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getLyric() {
		return lyric;
	}

	public void setLyric(String lyric) {
		this.lyric = lyric;
	}

	public String getXiazai() {
		return xiazai;
	}

	public void setXiazai(String xiazai) {
		this.xiazai = xiazai;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Music(){}
}
