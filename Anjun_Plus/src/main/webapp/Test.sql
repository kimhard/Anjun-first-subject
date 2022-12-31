SELECT * FROM user_tables;

SELECT * FROM anjun_file;

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

select * from anjun_post

SELECT * FROM anjun_post WHERE post_seq=22



INSERT INTO anjun_comment VALUES (ANJUN_COMMENT_SEQ.NEXTVAL, 22, '1', CURRENT_DATE, 1, 'smhrd')
INSERT INTO anjun_comment VALUES (ANJUN_COMMENT_SEQ.NEXTVAL, 22, '2', CURRENT_DATE, 2, 'smhrd')
INSERT INTO anjun_comment VALUES (ANJUN_COMMENT_SEQ.NEXTVAL, 22, '3', CURRENT_DATE, 3, 'smhrd')
INSERT INTO anjun_comment VALUES (ANJUN_COMMENT_SEQ.NEXTVAL, 22, '4', CURRENT_DATE, 4, 'smhrd')

SELECT * FROM anjun_comment WHERE post_seq=22

SELECT * FROM anjun_POST;

INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트1', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트2', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트3', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트4', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트5', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트6', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트7', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트8', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트9', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트10', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트11', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트12', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트13', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트14', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트15', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트16', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트17', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트18', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ, '테스트19', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post VALUES (ANJUN_POST_SEQ.NEXTVAL, '테스트20', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post(post_content, post_dt, user_id, post_likes, post_dislikes, post_hashtag, post_lat, post_lng) VALUES('테스트21', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post(post_content, post_dt, user_id, post_likes, post_dislikes, post_hashtag, post_lat, post_lng) VALUES('테스트22', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)
INSERT INTO anjun_post(post_content, post_dt, user_id, post_likes, post_dislikes, post_hashtag, post_lat, post_lng) VALUES('테스트23', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)

INSERT INTO anjun_post(post_content, post_dt, user_id, post_likes, post_dislikes, post_hashtag, post_lat, post_lng) VALUES('테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트', CURRENT_DATE, 'smhrd1', 0, 0, '지진', 1, 1)


select * from anjun_post where user_id like '%테스트%' or post_content like '%테스트%'