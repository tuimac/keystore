\c keystore

CREATE TABLE IF NOT EXISTS KEYSTORE (
    KeyID SERIAL NOT NULL,
    KeyName varchar(255) NOT NULL,
    Genre varchar(255),
    Memo text,
    Url varchar(255),
    PRIMARY KEY (KeyID)
);

INSERT INTO KEYSTORE (KeyName, Genre, Memo, Url) VALUES ('tuimac1', 'work', 'this is for work', 'https://work.com');
INSERT INTO KEYSTORE (KeyName, Genre, Memo, Url) VALUES ('tuimac2', 'work', 'work2', '');
INSERT INTO KEYSTORE (KeyName, Genre, Memo, Url) VALUES ('ttt', 'ticket', '', 'http://work.com');
INSERT INTO KEYSTORE (KeyName, Genre, Memo, Url) VALUES ('@@@', '', 'this is for @@@', 'https://work.com');
