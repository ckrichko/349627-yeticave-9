CREATE DATABASE yeticave
  CHARACTER SET UTF8
  COLLATE utf8_general_ci;
USE yeticave;

CREATE TABLE category
(
  id          INT         NOT NULL AUTO_INCREMENT,
  name        VARCHAR(50) NOT NULL,
  symbol_code VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE user
(
  id       INT          NOT NULL AUTO_INCREMENT,
  email    VARCHAR(50)  NOT NULL,
  password VARCHAR(50)  NOT NULL,
  name     VARCHAR(50)  NOT NULL,
  contact  VARCHAR(255) NOT NULL,
  avatar   VARCHAR(50),
  reg_date DATETIME              DEFAULT NOW(),
  PRIMARY KEY (id),
  INDEX (password),
  UNIQUE INDEX (name, email)
);

CREATE TABLE lot
(
  id            INT          NOT NULL AUTO_INCREMENT,
  name          VARCHAR(50)  NOT NULL,
  description   VARCHAR(200) NOT NULL,
  image         VARCHAR(50)  NOT NULL,
  id_category   INT          NOT NULL,
  start_price   INT          NOT NULL,
  end_date      DATETIME     NOT NULL,
  bid_step      INT          NOT NULL,
  creation_date DATETIME              DEFAULT NOW(),
  id_creator    INT          NOT NULL,
  id_winner     INT,
  PRIMARY KEY (id),
  FOREIGN KEY (id_creator) REFERENCES user (id),
  FOREIGN KEY (id_category) REFERENCES category (id),
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
  FOREIGN KEY (id_user) REFERENCES user (id),
  FOREIGN KEY (id_lot) REFERENCES lot (id),
  INDEX (id_user, id_lot)
)