\c keystore

CREATE TABLE IF NOT EXISTS K_USER (
    UserName varchar(255) PRIMARY KEY,
    Password varchar(255) NOT NULL,
    Login boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS K_KEYSTORE (
    Genre varchar(255) NOT NULL,
    UserName varchar(255) NOT NULL,
    KeyName varchar(255),
    Memo text,
    UNIQUE(KeyName, UserName)
);

CREATE TABLE IF NOT EXISTS K_PASSWORD (
    KeyName varchar NOT NULL,
    UserName varchar(255),
    Password varchar(255)
);

INSERT INTO K_USER (UserName, Password, Login) VALUES ('tuimac', 'P@ssw0rd', false);
INSERT INTO K_USER (UserName, Password, Login) VALUES ('kento', 'password', false);

INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web1', 'tuimac', 'for web1 password', 'work');
INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web2', 'tuimac', '', 'private');
INSERT INTO K_KEYSTORE (KeyName, UserName, Memo, Genre) VALUES ('web2', 'kento', 'my name is kento', 'private');

INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web1', 'tuimac', 'P@ssword');
INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web1', 'tuimac2', 'Password');
INSERT INTO K_PASSWORD (KeyName, UserName, Password) VALUES ('web2', 'kento', 'passw0rd');
