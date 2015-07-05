drop table S_USER;
drop table S_SUPERUSER;
drop sequence SEQ_COMMON;

delete from S_USER;

select * from S_USER;
select * from s_superuser;

--创建superuser
create table s_superuser(
	id number primary key,
	name varchar2(32) unique not null,
	password varchar2(25) not null
);
--创建user表
create table S_USER(
	id number primary key,
	name varchar2(20) unique not null,
	password varchar2(50) not null,
	gender varchar2(3) not null,
	age number not null,
	phone varchar2(20),
	email varchar2(20),
	isonline number default 0,
	latestdate date,
	registerdate date
);

--创建序列
create sequence SEQ_COMMON increment by 1 start with 1;

--插入数据
insert into S_USER(id,name,password,gender,age,phone,email) values(
	1,'cho','232232423','男',23,'24234','929880288@qq.com'
);