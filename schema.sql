CREATE DATABASE yeticave
  CHARACTER SET UTF8
  COLLATE utf8_general_ci;
USE yeticave;

CREATE TABLE categories
(
  id          INT         NOT NULL AUTO_INCREMENT,
  name        VARCHAR(64) NOT NULL UNIQUE,
  symbol_code VARCHAR(64) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE users
(
  id         INT         NOT NULL AUTO_INCREMENT,
  email      VARCHAR(64) NOT NULL,
  password   VARCHAR(64) NOT NULL,
  name       VARCHAR(64) NOT NULL,
  contact    TEXT(255)   NOT NULL,
  avatar_url VARCHAR(255),
  created_at   DATETIME             DEFAULT NOW(),
  PRIMARY KEY (id),
  UNIQUE INDEX (email)
);

CREATE TABLE lot
(
  id            INT          NOT NULL AUTO_INCREMENT,
  name          VARCHAR(255) NOT NULL,
  description   TEXT(1024)   NOT NULL,
  image_url     VARCHAR(255) NOT NULL,
  id_category   INT          NOT NULL,
  start_price   INT          NOT NULL,
  end_date      DATETIME     NOT NULL,
  bid_step      INT          NOT NULL,
  creation_date DATETIME              DEFAULT NOW(),
  id_creator    INT          NOT NULL,
  id_winner     INT,
  PRIMARY KEY (id),
  FOREIGN KEY (id_creator) REFERENCES users (id),
  FOREIGN KEY (id_category) REFERENCES categories (id),
  INDEX (end_date, id_creator, id_winner)
);

CREATE TABLE bid
(
  id            INT NOT NULL AUTO_INCREMENT,
  amount        INT NOT NULL,
  creation_date DATETIME     DEFAULT NOW(),
  id_user       INT NOT NULL,
  id_lot        INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_user) REFERENCES users (id),
  FOREIGN KEY (id_lot) REFERENCES lot (id),
  INDEX (id_user, id_lot)
)