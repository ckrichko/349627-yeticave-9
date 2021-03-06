-- Созданёт базу данных проекта Yeti Cave
CREATE DATABASE yeticave
  CHARACTER SET UTF8
  COLLATE utf8_general_ci;

USE 'yeticave';

-- создаёт таблицу категорий
CREATE TABLE categories
(
  id   INT         NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL UNIQUE,
  code VARCHAR(64) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

-- создаёт таблицу пользователей
CREATE TABLE users
(
  id         INT         NOT NULL AUTO_INCREMENT,
  email      VARCHAR(64) NOT NULL UNIQUE,
  password   VARCHAR(64) NOT NULL,
  name       VARCHAR(64) NOT NULL,
  contact    TEXT        NOT NULL,
  avatar_url VARCHAR(255),
  created_at DATETIME             DEFAULT NOW(),
  PRIMARY KEY (id)
);

-- создаёт таблицу лотов
CREATE TABLE lots
(
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255) NOT NULL,
  description TEXT         NOT NULL,
  image_url   VARCHAR(255) NOT NULL,
  category_id INT          NOT NULL,
  start_price INT          NOT NULL,
  end_at      DATETIME     NOT NULL,
  bid_step    INT          NOT NULL,
  created_at  DATETIME              DEFAULT NOW(),
  creator_id  INT          NOT NULL,
  winner_id   INT,
  PRIMARY KEY (id),
  FOREIGN KEY (winner_id) REFERENCES users (id),
  FOREIGN KEY (creator_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

-- создаёт таблицу ставок
CREATE TABLE bids
(
  id         INT NOT NULL AUTO_INCREMENT,
  amount     INT NOT NULL,
  created_at DATETIME     DEFAULT NOW(),
  user_id    INT NOT NULL,
  lot_id     INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (lot_id) REFERENCES lots (id)
)
