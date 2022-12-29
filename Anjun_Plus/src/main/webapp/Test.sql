SELECT * FROM user_tables;

SELECT * FROM anjun_POST;

INSERT INTO anjun_user (user_id, user_pw, user_nick, user_name, user_email, user_rrn) 
VALUES ('smart', 1234, 'smart', 'smart', 'smart@smart.com', '123456-1234567');

DELETE FROM anjun_user WHERE user_id='smart';

SELECT * FROM anjun_user;
SELECT * FROM anjun_attendance;
SELECT * FROM anjun_attendance WHERE TO_CHAR(at_time, 'YYYY:MM:DD') = (SELECT TO_CHAR(current_date, 'YYYY:MM:DD') FROM dual) AND user_id= 'smhrd'

INSERT INTO anjun_attendance (at_time, user_id) VALUES('2022-12-06', 'smhrd');

INSERT INTO anjun_attendence (at_time, user_id) values (?, ?)

UPDATE anjun_user SET pw='1', nick='1', email='1@1' WHERE id='smhrd'
UPDATE anjun_user SET user_pw='1', user_nick='1', user_email='1' WHERE user_id='smhrd'