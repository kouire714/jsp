show tables;

create table guestPractice (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	content text not null,
	email varchar(60),
	homepage varchar(60),
	visitDate datetime default now(),
	hostIp varchar(30) not null
);

desc guestPractice;

insert into guestPractice values (default,'홍길동','방명록 사이트 연습','gildong@ddaum.net','gildong.ttistory.com',default,'192.168.50.55');
insert into guestPractice values (default,'김갑순','방명록 사이트 연습','gabson@ddaum.net','gabson.ttistory.com',default,'192.168.50.55');

select * from guestPractice;