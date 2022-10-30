\c keystore

CREATE TABLE IF NOT EXISTS KEYSTORE (
    KeyID SERIAL NOT NULL,
    KeyName varchar(255) NOT NULL,
    Password varchar(255) NOT NULL,
    Genre varchar(255),
    Memo text,
    Url varchar(255),
    PRIMARY KEY (KeyID)
);

INSERT INTO KEYSTORE (KeyName, Password, Genre, Memo, Url) VALUES ('tuimac1', 'password', 'work', 'this is for work', 'https://work.com');
INSERT INTO KEYSTORE (KeyName, Password, Genre, Memo, Url) VALUES ('tuimac2', 'P@ssw0rd', 'work', 'work2', '');
INSERT INTO KEYSTORE (KeyName, Password, Genre, Memo, Url) VALUES ('ttt', 'ddd', 'ticket', '', 'http://work.com');
INSERT INTO KEYSTORE (KeyName, Password, Genre, Memo, Url) VALUES ('@@@', 'test111', '', 'this is for @@@', 'https://work.com');
