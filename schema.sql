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
  created_at DATETIME             DEFAULT NOW(),
  PRIMARY KEY (id),
  UNIQUE INDEX (email)
);

CREATE TABLE lot
(
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255) NOT NULL,
  description TEXT(1024)   NOT NULL,
  image_url   VARCHAR(255) NOT NULL,
  category_id INT          NOT NULL,
  start_price INT          NOT NULL,
  end_at      DATETIME     NOT NULL,
  bid_step    INT          NOT NULL,
  created_at  DATETIME              DEFAULT NOW(),
  creator_id  INT          NOT NULL,
  winner_id   INT,
  PRIMARY KEY (id),
  FOREIGN KEY (creator_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id),
  INDEX (end_at, creator_id, winner_id)
);

CREATE TABLE bid
(
  id         INT NOT NULL AUTO_INCREMENT,
  amount     INT NOT NULL,
  created_at DATETIME     DEFAULT NOW(),
  user_id    INT NOT NULL,
  lot_id     INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (lot_id) REFERENCES lot (id),
  INDEX (user_id, lot_id)
)