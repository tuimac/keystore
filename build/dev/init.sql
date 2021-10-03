CREATE TABLE K_USER IF NOT EXISTS (
    UserID PRIMARY KEY NOT NULL,
    UserName varchar(255),
    Password varchar(255) NOT NULL
);

CREATE TABLE K_KEYSTORE IF NOT EXISTS (
    KeyID PRIMARY KEY NOT NULL,
    Name varchar(255) UNIQUE,
    Password varchar(255),

);
