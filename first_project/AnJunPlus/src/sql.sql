drop table temp_member;

select DBTIMEZONE, SESSIONTIMEZONE FROM DUAL;
SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL;

create table temp_member
(
num number,
name varchar2(50),
m_date date,
constraint temp_name_pk primary key(name)
);

insert into TEMP_MEMBER values (7, '100', sysdate);

select * from TEMP_MEMBER;

