SELECT * FROM user_tables;

SELECT * FROM anjun_post;

INSERT INTO anjun_user (user_id, user_pw, user_nick, user_name, user_email, user_rrn) 
VALUES ('smart', 1234, 'smart', 'smart', 'smart@smart.com', '123456-1234567');

DELETE FROM anjun_user WHERE user_id='smart';

