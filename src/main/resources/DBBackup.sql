create sequence APP_USER_seq;

create table APP_USER (
   id BIGINT NOT NULL DEFAULT NEXTVAL ('APP_USER_seq'),
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   phone VARCHAR (30) NOT NULL,
    joining_date DATE NOT NULL,
   description VARCHAR(1024),
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);

/* USER_PROFILE table contains all possible roles */
create sequence USER_PROFILE_seq;

create table USER_PROFILE(
   id BIGINT NOT NULL DEFAULT NEXTVAL ('USER_PROFILE_seq'),
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);

/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');

INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');

INSERT INTO USER_PROFILE(type)
VALUES ('DBA');


/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email, phone,joining_date,description)
VALUES ('test','$2a$10$mCblM7QrmnRn4nHQLo79o.062pzTIDYkHIRJ1VhIGFWhGGc3R4CYS
', 'test','test','test@gmail.com','442071234337','2015-12-12','test admin message');

/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT "user".id, profile.id FROM app_user "user", user_profile profile
  where "user".sso_id='test' and profile.type='ADMIN';

/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP(0) NOT NULL,
    PRIMARY KEY (series)
);






/*added uploads project

 */


create sequence USER_DOCUMENT_seq;

create table USER_DOCUMENT(
   id BIGINT NOT NULL DEFAULT NEXTVAL ('USER_DOCUMENT_seq'),
   user_id BIGINT NOT NULL,
   name  VARCHAR(100) NOT NULL,
   description TEXT ,
   type VARCHAR(100) NOT NULL,
   content BYTEA NOT NULL,
   PRIMARY KEY (id),
   CONSTRAINT document_user FOREIGN KEY (user_id) REFERENCES APP_USER (id) ON UPDATE CASCADE ON DELETE CASCADE
);









