\c keystore

CREATE TABLE IF NOT EXISTS K_USER (
    UserID serial PRIMARY KEY NOT NULL,
    UserName varchar(255) UNIQUE NOT NULL,
    Password varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS K_KEYSTORE (
    KeyName varchar(255) PRIMARY KEY NOT NULL,
    UserName varchar(255) NOT NULL REFERENCES K_USER(UserName),
    Memo text,
    Genre varchar(255)
);

CREATE TABLE IF NOT EXISTS K_PASSWORD (
    KeyName varchar NOT NULL,
    UserName varchar(255),
    Password varchar(255)
);

INSERT INTO K_USER (UserName, Password) VALUES ('tuimac', 'P@ssw0rd');
INSERT INTO K_USER (UserName, Password) VALUES ('kento', 'password');

INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web1', 'tuimac', 'for web1 password', 'work');
INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web2', 'tuimac', '', 'private');
INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web2', 'kento', 'my name is kento', 'private');

INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web1', 'tuimac', 'P@ssword');
INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web1', 'tuimac2', 'Password');
INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web2', 'kento', 'passw0rd');
