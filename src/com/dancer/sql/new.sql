

select book_xl.nextval from dual
create table txjh_userlogin(
  id integer primary key,
  name varchar2(32),
  password varchar2(64)
);
create sequence book_xl;
select * from jh_user
where name='dancer';
insert into jh_user values(book_xl.nextval,'dancer','666666','1139004746@qq.com');



create table pingdao(
	id integer primary key,
	name varchar2(32)
)
select * from pingdao
where name like'%��%';
select count(id) from pingdao
insert into pingdao values(book_xl.nextval,'���Ż');

select id,name,rn
			from
				(select e1.id,e1.name,rownum rn
				from
				(select id,name from pingdao 
				where name like'%��Ϸ%' 
				order by id) e1)
				where rn>=1 and rn<=3
select count(id) from pingdao where name like'%��Ϸ%'  
-----------------------------------------�û�----------------------------------
create table jh_user(
	id integer primary key,
	username varchar2(32),
	password varchar2(32),
	email varchar2(100)
)
drop table jh_user;
delete from jh_user where id=164;
select * from jh_user;
update jh_user set password='888888' where username='dancer';
select id,name,jibie,shangji,icon from sleimu;
insert into sleimu values(leimu_xl.nextval,'��������','3','������Ʒ','icon',9);


select y2.shangji y2_shangji,s1.shangji s1_shangji,s1.name name
from yleimu y1 left join yleimu y2 on y1.id=y2.eid left join sleimu s1 on s1.sid=y2.id
where s1.id=11;

select s1.id,s1.name,s1.jibie,s1.shangji,s1.icon,y2.id,y2.name,y2.jibie,y2.shangji,y2.icon
from yleimu y1 left join yleimu y2 on y1.id=y2.eid left join sleimu s1 on s1.sid=y2.id
where y2.name='������Ʒ';

select *
from yleimu y1 left join sleimu s1 on s1.sid=y1.id
where y1.name='������Ʒ';

select y2.id y2_id,y2.name y2_name
from yleimu y1 left join yleimu y2 on y1.id=y2.eid
where y1.name='�˶�����';


create table biaoqian(
	id integer primary key,
	name varchar2(32),
	value varchar2(30)
)
insert into biaoqian values(leimu_xl.nextval,'��ױƷ','userlabel');
insert into biaoqian values(leimu_xl.nextval,'ʳ��','uplabel');
insert into biaoqian values(leimu_xl.nextval,'��Ϸ','userlabel');
insert into biaoqian values(leimu_xl.nextval,'����','uplabel');
insert into biaoqian values(leimu_xl.nextval,'����','userlabel');
select id,name,value from biaoqian;
-----------------------����--------------------------------
create table music(
  id integer primary key,
  songname varchar2(32),
  jmname varchar2(1000),
  singer varchar2(64),
  state varchar(32),
  lyric varchar(1000),
  xiazai varchar(32),
  category varchar(32)
);
drop table music;
select * from music;
create sequence music_xl;

select id,songname,singer,state,lyric,xiazai,category
from(select id,songname,singer,state,lyric,xiazai,category,rownum rn
from(select id,songname,singer,state,lyric,xiazai,category,rownum rn from music
where category='�й��ŷ�')
where rownum<=3)
where rn>=1;

select count(id) from music

insert into music values(music_xl.nextval,'̯��','pppp','С��','play','lyric','download','liuxing');
insert into music values(music_xl.nextval,'���֮��','���غ�','play','lyric','download','��ҥ');
-----------------------------��Ӱ---------------------------------
create table movie(
  id integer primary key,
  moviename varchar2(1000),
  xiazai varchar(32),
  img varchar(1000),
  category varchar(32)
);
drop table movie;
select * from movie;
delete from movie where id='169';
insert into movie values(music_xl.nextval,'qqwqwqwqsdssssasad.mp4','xiazai','֩����','����');
--------------------����--------------------------------------
create table wenzhang(
id integer primary key,
biaoti varchar2(500),
twobiaoti varchar2(500),
whiter varchar2(50),
type varchar2(50),  --����
price varchar2(50),
sellername varchar2(50), --�̼�
headimg varchar2(50), --�Դ�ͼƬ
chucu varchar2(500), --����
link varchar2(500), --����
content varchar2(4000), --����
shijian timestamp, --ʱ���
status varchar2(50), --״̬
ishot varchar2(50), --����
pindao varchar2(50),
pinpai varchar2(50),
leibie varchar2(50),
leimu varchar2(50)
)
drop table wenzhang;
select * from wenzhang
order by id desc;
select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu
				 from wenzhang 
					where id=105;
delete wenzhang where id=61
insert into wenzhang values(leimu_xl.nextval,'������·һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 13:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'������·һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 14:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'������·һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 15:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'������·һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 16:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'��ѻ��·һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 17:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'�˷�һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 18:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'��ͷһ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 21:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'����һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 20:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');
insert into wenzhang values(leimu_xl.nextval,'ά��һ����','����ײǽ','dancer','����',null,
'��С��','55.jpg','����','����','�������˵������',to_timestamp('2006-07-19 19:51:05','yyyy-mm-dd hh24:mi:ss'),'�����','��','��ϷƵ��','lol','��Ϸ���','��������');

select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu,rn
			from
			(select w1.id,w1.biaoti,w1.twobiaoti,w1.whiter,w1.type,w1.price,w1.sellername,w1.headimg,w1.chucu,w1.link,
			w1.content,w1.shijian,w1.status,w1.ishot,w1.pindao,w1.pinpai,w1.leibie,w1.leimu,rn --�����һ���Զ��������ֶΣ�rownum��ͨ��������Լ����ʾ����
			from
				(select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu,rownum rn
				 from
				  wenzhang
				  where biaoti like'%����%'
				order by id) w1)
				where rn>=1 and rn<=3


select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu
				 from
				  wenzhang
				  where ishot='��'
				order by id
 
select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu,rn
			from
			(select w1.id,w1.biaoti,w1.twobiaoti,w1.whiter,w1.type,w1.price,w1.sellername,w1.headimg,w1.chucu,w1.link,
			w1.content,w1.shijian,w1.status,w1.ishot,w1.pindao,w1.pinpai,w1.leibie,w1.leimu,rn --�����һ���Զ��������ֶΣ�rownum��ͨ��������Լ����ʾ����
			from
				(select id,biaoti,twobiaoti,whiter,type,price,sellername,headimg,chucu,link,
				content,shijian,status,ishot,pindao,pinpai,leibie,leimu,rownum rn
				 from
				  wenzhang
				  where ishot='��'
				order by id) w1)
				where rn>=1 and rn<=3
update wenzhang set ishot='shi' where id=66