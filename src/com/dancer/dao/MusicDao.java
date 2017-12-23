package com.dancer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dancer.entity.Music;
public interface MusicDao {
	public List<Music> selectAllFy(@Param("rownum")Integer page,@Param("rownum2")Integer rows);//��ѯ���У���ҳ��
	public Integer selectCount();//��ѯ������������ҳ�ã�
	public Integer categorySelectCount(String category);//��������ѯ
	public List<Music> selectcategory(@Param("rownum")Integer page,@Param("rownum2")Integer rows,@Param("category")String category);//���ݱ�ǩ��ѯ
	public void insertMusic(Music music);
	public List<Music> selectLikeName(@Param("rownum")Integer page,@Param("rownum2")Integer rows,@Param("songname")String name);//�������ֲ�ѯ
	public Integer selectcountName(@Param("songname")String name);//�������ֲ�ѯ����
	public void deleteMusic(@Param("ids")Integer[]id);
	public Music selectSong(Integer id);//id��ѯ��
	public Music selectByName(@Param("songname")String name);
}
