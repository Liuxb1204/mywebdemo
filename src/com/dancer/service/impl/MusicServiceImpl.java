package com.dancer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dancer.dao.MusicDao;
import com.dancer.entity.Music;
import com.dancer.service.MusicService;
@Service
@Transactional
public class MusicServiceImpl implements MusicService {
	@Autowired
	private MusicDao musicdao;
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Music> queryAllFy(Integer page, Integer rows) {
		// TODO Auto-generated method stub
		List<Music> allFy = musicdao.selectAllFy(page, rows);
		return allFy;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Integer queryCount() {
		// TODO Auto-generated method stub
		Integer count = musicdao.selectCount();
		return count;
	}
	public void addMusic(Music music) {
		// TODO Auto-generated method stub
		musicdao.insertMusic(music);
		
	}
	public void removeMusic(Integer[]id) {
		// TODO Auto-generated method stub
		musicdao.deleteMusic(id);
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Music> queryCategory(Integer page,Integer rows,String category) {
		// TODO Auto-generated method stub
		List<Music> list = musicdao.selectcategory(page,rows,category);
		System.out.println(page+rows+category+"-------------service");
		return list;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Integer categoryQueryCount(String category) {
		// TODO Auto-generated method stub
		Integer count = musicdao.categorySelectCount(category);
		return count;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Music> queryLikeName(Integer page, Integer rows, String name) {
		// TODO Auto-generated method stub
		List<Music> list = musicdao.selectLikeName(page, rows, name);
		return list;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Integer querycountName(String name) {
		// TODO Auto-generated method stub
		Integer integer = musicdao.selectcountName(name);
		return integer;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Music querySongById(Integer id) {
		// TODO Auto-generated method stub
		Music music = musicdao.selectSong(id);
		return music;
	}
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Music queryByName(String name) {
		// TODO Auto-generated method stub
		Music music = musicdao.selectByName(name);
		return music;
	}
}
