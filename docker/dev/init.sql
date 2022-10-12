\c keystore

CREATE TABLE IF NOT EXISTS K_KEYSTORE (
    KeyID SERIAL NOT NULL,
    KeyName varchar(255) NOT NULL,
    Genre varchar(255) NOT NULL,
    PRIMARY KEY (KeyID),
    UNIQUE (KeyName)
);

CREATE TABLE IF NOT EXISTS K_PASSWORD (
    PasswordID SERIAL NOT NULL,
    PasswordName varchar(256) NOT NULL,
    Password varchar(255) NOT NULL,
    KeyName varchar(255) NOT NULL,
    Memo text,
    PRIMARY KEY (PasswordID),
    FOREIGN KEY (KeyName) REFERENCES K_KEYSTORE(KeyName)
);

INSERT INTO K_KEYSTORE (KeyName, Genre) VALUES ('tuimac2', 'work');
INSERT INTO K_KEYSTORE (KeyName, Genre) VALUES ('tuimac', 'private');
INSERT INTO K_KEYSTORE (KeyName, Genre) VALUES ('kento', 'private');

INSERT INTO K_PASSWORD (PasswordName, Password, KeyName, Memo) VALUES ('tuimac', 'P@ssword', 'tuimac', '');
INSERT INTO K_PASSWORD (PasswordName, Password, KeyName, Memo) VALUES ('ffff', 'P@ssw', 'tuimac', 'test');
INSERT INTO K_PASSWORD (PasswordName, Password, KeyName, Memo) VALUES ('tuimac', 'passw', 'kento', 'home password');
