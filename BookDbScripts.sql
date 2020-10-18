--Create Book Database Scripts
create table author
(
	id int primary key,
	a_name varchar(80) not null
);

create table series
(
	id int primary key,
	s_name varchar(80)
);

create table book
(
	id int primary key,
	title varchar(80) not null,
	author_id int not null,
	constraint author_fk foreign key(author_id) references author(id),
	pages int,
	series_id int,
	constraint series_fk foreign key(series_id) references series(id),
	release_year int
);

--insert scripts
insert into author(id, a_name) values
(1, 'JK Rowling'),
(2, 'JRR Tolkien'),
(3, 'George RR Martin'),
(4, 'Andy Greenberg');

insert into series(id, s_name) values
(1, 'Harry Potter'),
(2, 'The Lord of the Rings'),
(3, 'A Song of Ice and Fire');

insert into book(id, title, author_id, pages, series_id, release_year) values
(1, 'Sandworm', 4, 278, null, 2017),
(2, 'Harry Potter and the Philosopher''s Stone', 1, 178, 1, 1997),
(3, 'Harry Potter and the Chamber of Secrets', 1, 234, 1, 1998),
(4, 'Harry Potter and the Prisoner of Azkaban', 1, 300, 1, 1999),
(5, 'Harry Potter and the Goblet of Fire', 1, 400, 1, 2000),
(6, 'Harry Potter and the Order of the Phoenix', 1, 428, 1, 2003),
(7, 'Harry Potter and the Half-Blood Prince', 1, 546, 1, 2005),
(8, 'Harry Potter and the Deathly Hallows', 1, 1007, 1, 2007),
(9, 'The Lord of the Rings: Fellowship of the Ring', 2, 258, 2, 1954),
(10, 'The Lord of the Rings: The Two Towers', 2, 400, 2, 1954),
(11, 'The Lord of the Rings: The Return of the King', 2, 300, 2, 1955),
(12, 'A Game of Thrones', 3, 560, 3, 1996),
(13, 'A Clash of Kings', 3, 758, 3, 1998),
(14, 'A Storm of Swords', 3, 654, 3, 2000),
(15, 'A Feast for Crows', 3, 590, 3, 2005),
(16, 'A Dance with Dragons', 3, 768, 3, 2011),
(17, 'The Hobbit', 2, 300, null, 1954);

--show inner joins
select b.title, s.s_name, a.a_name
from book as b
inner join author as a
on(b.author_id = a.id)
inner join series as s
on(b.series_id = s.id);

--show aggragate functions
select s.s_name, sum(b.pages)
from book as b
inner join series as s
on(b.series_id = s.id)
group by s.s_name;

select s.s_name, count(b.id)
from book as b
inner join series as s
on(b.series_id = s.id)
group by s.s_name;

--get books by author example
select a.a_name, b.title 
from book as b
inner join author as a 
on (b.author_id = a.id)
where a.a_name = 'JRR Tolkien';




