package com.dancer.entity.fy;

import java.io.Serializable;
import java.util.List;

import com.dancer.entity.Music;

public class Musicfy implements Serializable{
	private List<Music> rows;
	private Integer total;
	@Override
	public String toString() {
		return "Musicfy [rows=" + rows + ", total=" + total + "]";
	}
	public Musicfy(List<Music> rows, Integer total) {
		super();
		this.rows = rows;
		this.total = total;
	}
	public List<Music> getRows() {
		return rows;
	}
	public void setRows(List<Music> rows) {
		this.rows = rows;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Musicfy(){};
}
