/*일괄삭제*/
DROP TABLE depart_info CASCADE CONSTRAINTS;
DROP TABLE class_info CASCADE CONSTRAINTS;
DROP TABLE emp_info CASCADE CONSTRAINTS;
DROP TABLE draft_info CASCADE CONSTRAINTS;
DROP TABLE draft_security CASCADE CONSTRAINTS;
DROP TABLE stuff_info CASCADE CONSTRAINTS;
DROP TABLE stuff_security CASCADE CONSTRAINTS;
DROP TABLE attendance_security CASCADE CONSTRAINTS;
DROP TABLE attendance_info CASCADE CONSTRAINTS;
DROP SEQUENCE paper_no_seq;
CREATE TABLE draft_info (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	title	varchar2(200)		NULL,
	purpose	varchar2(2000)		NULL,
	subject	varchar2(4000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL,
	staff	number		NULL,
	gm	number		NULL,
	dm	number		NULL,
	ceo	number		NULL,
	state	number		NOT NULL
);

COMMENT ON COLUMN draft_info.state IS '0:작성중 1: 결재중 2:완료 3:보류 4:부결';

CREATE TABLE draft_security (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	title	varchar2(200)		NULL,
	purpose	varchar2(2000)		NULL,
	subject	varchar2(4000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL
);

CREATE TABLE emp_info (
	emp_no	number		NOT NULL,
	class_no	number		NOT NULL,
	depart_no	number		NOT NULL,
	emp_name	varchar2(30)		NOT NULL,
	super_no	number		NULL,
	hire_date	date		NOT NULL,
	photo	varchar2(200)		NULL,
	sign	varchar2(200)		NULL
);

CREATE TABLE stuff_info (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	title	varchar2(200)		NULL,
	subject	varchar2(4000)		NULL,
	price	varchar2(2000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL,
	staff	number		NULL,
	gm	number		NULL,
	dm	number		NULL,
	ceo	number		NULL,
	state	number		NOT NULL
);

COMMENT ON COLUMN stuff_info.state IS '0:작성중 1: 결재중 2:완료 3:보류 4:부결';

CREATE TABLE stuff_security (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	title	varchar2(200)		NULL,
	subject	varchar2(4000)		NULL,
	price	varchar2(2000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL
);

CREATE TABLE attendance_info (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	from_year	number		NULL,
	from_month	number		NULL,
	from_day	number		NULL,
	to_year	number		NULL,
	to_month	number		NULL,
	to_day	number		NULL,
	type	varchar2(20)		NULL,
	title	varchar2(200)		NULL,
	subject	varchar2(4000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL,
	staff	number		NULL,
	gm	number		NULL,
	dm	number		NULL,
	ceo	number		NULL,
	state	number		NOT NULL
);

COMMENT ON COLUMN attendance_info.state IS '0:작성중 1: 결재중 2:완료 3:보류 4:부결';

CREATE TABLE attendance_security (
	paper_no	number		NOT NULL,
	emp_no	number		NOT NULL,
	from_year	number		NULL,
	from_month	number		NULL,
	from_day	number		NULL,
	to_year	number		NULL,
	to_month	number		NULL,
	to_day	number		NULL,
	type	varchar2(20)		NULL,
	title	varchar2(200)		NULL,
	subject	varchar2(4000)		NULL,
	remark	varchar2(1000)		NULL,
	date_write	date		NOT NULL,
	attach	varchar2(1000)		NULL
);

CREATE TABLE class_info (
	class_no	number		NOT NULL,
	class_name	varchar2(30)		NOT NULL
);

COMMENT ON COLUMN class_info.class_no IS '1:사원 2:과장 3:부장 4:사장';

CREATE TABLE depart_info (
	depart_no	number		NOT NULL,
	depart_name	varchar2(30)		NOT NULL
);

ALTER TABLE draft_info ADD CONSTRAINT PK_DRAFT_INFO PRIMARY KEY (
	paper_no
);

ALTER TABLE emp_info ADD CONSTRAINT PK_EMP_INFO PRIMARY KEY (
	emp_no
);

ALTER TABLE stuff_info ADD CONSTRAINT PK_STUFF_INFO PRIMARY KEY (
	paper_no
);

ALTER TABLE attendance_info ADD CONSTRAINT PK_ATTENDANCE_INFO PRIMARY KEY (
	paper_no
);

ALTER TABLE class_info ADD CONSTRAINT PK_CLASS_INFO PRIMARY KEY (
	class_no
);

ALTER TABLE depart_info ADD CONSTRAINT PK_DEPART_INFO PRIMARY KEY (
	depart_no
);

/*서류번호 시퀀스*/
CREATE SEQUENCE paper_no_seq;
/*직급번호*/
insert into class_info
values (4, '사장');

insert into class_info
values (3, '부장');

insert into class_info
values (2, '과장');

insert into class_info
values (1, '사원');

commit;

/*여기까지 공용자료*/

SELECT * FROM class_info;

/*부서 임시*/
insert into depart_info
values (0, '사장');

insert into depart_info
values (1, '설계부');

insert into depart_info
values (2, '제작부');

SELECT * FROM depart_info;

/*직원 임시*/

insert into emp_info
values (10001, 4, 0, '박사장', null, sysdate, null, null);

insert into emp_info
values (10002, 3, 1, '김부장', 10001, sysdate, null, null);

insert into emp_info
values (10003, 3, 2, '최부장', 10001, sysdate, null, null);

insert into emp_info
values (10004, 2, 1, '전과장', 10002, sysdate, null, null);

insert into emp_info
values (10005, 2, 1, '이과장', 10002, sysdate, null, null);

insert into emp_info
values (10006, 2, 2, '곽과장', 10003, sysdate, null, null);

insert into emp_info
values (10007, 1, 1, '임사원', 10004, sysdate, null, null);

insert into emp_info
values (10008, 1, 1, '윤사원', 10004, sysdate, null, null);

insert into emp_info
values (10009, 1, 1, '장사원', 10005, sysdate, null, null);

insert into emp_info
values (10010, 1, 1, '조사원', 10005, sysdate, null, null);

insert into emp_info
values (10011, 1, 2, '마사원', 10006, sysdate, null, null);

SELECT * FROM emp_info;

commit;

/*작성중기안*/
insert into draft_info(paper_no, emp_no, title, purpose, subject, remark, date_write, attach, staff, gm, dm, ceo, state)
values (PAPER_NO_SEQ.nextval, '10011', '작성중', '테스트를 위한 서류', '테스트내용', '테스트비고', sysdate, null, null, null, null, null, 0);
/*결재기안*/
insert into draft_info
values (PAPER_NO_SEQ.nextval, '10011', '결재중', '테스트를 위한 서류', '테스트내용', '테스트비고', sysdate, null, null, null, null, null, 1);
/*완료기안*/
insert into draft_info
values (PAPER_NO_SEQ.nextval, '10011', '완료', '테스트를 위한 서류', '테스트내용', '테스트비고', sysdate, null, null, null, null, null, 2);
/*보류기안*/
insert into draft_info
values (PAPER_NO_SEQ.nextval, '10011', '보류', '테스트를 위한 서류', '테스트내용', '테스트비고', sysdate, null, null, null, null, null, 3);
/*부결기안*/
insert into draft_info
values (PAPER_NO_SEQ.nextval, '10011', '부결', '테스트를 위한 서류', '테스트내용', '테스트비고', sysdate, null, null, null, null, null, 4);

/*작성중품의*/
insert into stuff_info
values (PAPER_NO_SEQ.nextval, '10011', '작성중', '테스트를 위한 서류', '5만원', '테스트비고', sysdate, null, null, null, null, null, 0);
/*결재품의*/
insert into stuff_info
values (PAPER_NO_SEQ.nextval, '10011', '결재중', '테스트를 위한 서류', '5만원', '테스트비고', sysdate, null, null, null, null, null, 1);
/*완료품의*/
insert into stuff_info
values (PAPER_NO_SEQ.nextval, '10011', '완료', '테스트를 위한 서류', '5만원', '테스트비고', sysdate, null, null, null, null, null, 2);
/*보류품의*/
insert into stuff_info
values (PAPER_NO_SEQ.nextval, '10011', '보류', '테스트를 위한 서류', '5만원', '테스트비고', sysdate, null, null, null, null, null, 3);
/*부결품의*/
insert into stuff_info
values (PAPER_NO_SEQ.nextval, '10011', '부결', '테스트를 위한 서류', '5만원', '테스트비고', sysdate, null, null, null, null, null, 4);

/*작성중근태*/
insert into attendance_info
values (PAPER_NO_SEQ.nextval, '10011', 2021, 02, 28, 2021, 03, 04, '휴가', '휴가신청작성중', '테스트', '테스트비고', sysdate, null, 10011, 10004, null, null, 0);
/*결재근태*/
insert into attendance_info
values (PAPER_NO_SEQ.nextval, '10011', 2021, 02, 28, 2021, 03, 04, '휴가', '휴가신청결재', '테스트', '테스트비고', sysdate, null, null, null, null, null, 1);
/*완료근태*/
insert into attendance_info
values (PAPER_NO_SEQ.nextval, '10011', 2021, 02, 28, 2021, 03, 04, '휴가', '휴가신청완료', '테스트', '테스트비고', sysdate, null, null, null, null, null, 2);
/*보류근태*/
insert into attendance_info
values (PAPER_NO_SEQ.nextval, '10011', 2021, 02, 28, 2021, 03, 04, '휴가', '휴가신청보류', '테스트', '테스트비고', sysdate, null, null, null, null, null, 3);
/*부결근태*/
insert into attendance_info
values (PAPER_NO_SEQ.nextval, '10011', 2021, 02, 28, 2021, 03, 04, '휴가', '휴가신청부결', '테스트', '테스트비고', sysdate, null, null, null, null, null, 4);

SELECT * FROM draft_info;
SELECT * FROM draft_info WHERE emp_no = 10011 AND state = 0;

SELECT * FROM stuff_info;
SELECT * FROM stuff_info WHERE emp_no = 10004;

SELECT * FROM attendance_info;
SELECT * FROM attendance_info WHERE emp_no = 10004;

/*내결재*/
SELECT paper_no,title,date_write FROM draft_info WHERE emp_no = 10011
UNION 
SELECT paper_no,title,date_write FROM stuff_info WHERE emp_no = 10011
UNION 
SELECT paper_no,title,date_write FROM attendance_info WHERE emp_no = 10011
order by paper_no desc;

/*결재대기*/
SELECT paper_no,title,date_write FROM draft_info WHERE (gm = 10004 AND dm IS null AND state = 1) OR (dm = 10004 AND ceo IS null AND state = 1) OR (ceo = 10004 AND state = 1)
UNION 
SELECT paper_no,title,date_write FROM stuff_info WHERE (gm = 10004 AND dm IS null AND state = 1) OR (dm = 10004 AND ceo IS null AND state = 1) OR (ceo = 10004 AND state = 1)
UNION 
SELECT paper_no,title,date_write FROM attendance_info WHERE (gm = 10004 AND dm IS null AND state = 1) OR (dm = 10004 AND ceo IS null AND state = 1) OR (ceo = 10004 AND state = 1)
order by paper_no desc;

/*임시보관 결재중 결재완료 결재보류 결재부결*/
SELECT * FROM draft_info;
SELECT paper_no,title,date_write FROM draft_info WHERE state = 0 and (emp_no = 10011 or staff = 10011 or gm = 10011 or dm = 10011 or ceo=10011);
SELECT paper_no,title,date_write FROM draft_info WHERE state = 1 and (emp_no = 10011 or staff = 10011 or gm = 10011 or dm = 10011 or ceo=10011);
SELECT paper_no,title,date_write FROM draft_info WHERE state = 2;
SELECT paper_no,title,date_write FROM draft_info WHERE state = 3;
SELECT paper_no,title,date_write FROM draft_info WHERE state = 4;

SELECT * FROM stuff_info;
SELECT paper_no,title,date_write FROM stuff_info WHERE state = 0 and (emp_no = 10011 or staff = 10011 or gm = 10011 or dm = 10011 or ceo=10011);
SELECT paper_no,title,date_write FROM stuff_info WHERE state = 1;
SELECT paper_no,title,date_write FROM stuff_info WHERE state = 2;
SELECT paper_no,title,date_write FROM stuff_info WHERE state = 3;
SELECT paper_no,title,date_write FROM stuff_info WHERE state = 4;

SELECT * FROM attendance_info;
SELECT paper_no,title,date_write FROM attendance_info WHERE state = 0 and (emp_no = 10004 or staff = 10004 or gm = 10004 or dm = 10004 or ceo=10004);
SELECT paper_no,title,date_write FROM attendance_info WHERE state = 1;
SELECT paper_no,title,date_write FROM attendance_info WHERE state = 2;
SELECT paper_no,title,date_write FROM attendance_info WHERE state = 3;
SELECT paper_no,title,date_write FROM attendance_info WHERE state = 4;

commit;


select * from (
select rownum rno, m.* from
(
select paper_no,title,date_write from draft_info
where (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and (emp_no = ${empNo} or staff = ${empNo} or gm = ${empNo} or dm = ${empNo} or ceo= ${empNo})
UNION
select paper_no,title,date_write from stuff_info
where (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and (emp_no = ${empNo} or staff = ${empNo} or gm = ${empNo} or dm = ${empNo} or ceo= ${empNo})
UNION
select paper_no,title,date_write from attendance_info
where (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and (emp_no = ${empNo} or staff = ${empNo} or gm = ${empNo} or dm = ${empNo} or ceo= ${empNo})
order by
paper_no desc
) m
) where
rno between #{startNo} and #{endNo};    

select * from (
select rownum rno, m.* from
(
SELECT paper_no,title,date_write FROM draft_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
UNION 
SELECT paper_no,title,date_write FROM stuff_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
UNION 
SELECT paper_no,title,date_write FROM attendance_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
order by paper_no desc
) m
) where
rno between #{startNo} and #{endNo}

select count(paper_no) from (
SELECT paper_no,title,date_write FROM draft_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
UNION 
SELECT paper_no,title,date_write FROM stuff_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
UNION 
SELECT paper_no,title,date_write FROM attendance_info WHERE (paper_no like '%${findStr}%' or title like '%${findStr}%' or date_write like '%${findStr}%')
and ((gm = ${empNo} AND dm IS null AND state = 1) OR (dm = ${empNo} AND ceo IS null AND state = 1) OR (ceo = ${empNo} AND state = 1))
)