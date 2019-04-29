INSERT INTO categories
(id, name, code) VALUES ('1', 'Доски и лыжи', 'skiing'), ('2', 'Крепления', 'mounts'), ('3','Ботинки', 'boots'), ('4','Одежда', 'clothing'), ('5', 'Инструменты', 'tools'), ('6', 'Разное', 'other');

INSERT INTO users
(id, email, password, name, contact, avatar_url) VALUES ('1', 'ckrichko@gmail.com', 'A.cpjE^5HW/1o', 'Константин', 'ул. Вишнёвая, 20', 'img/avatar.jpg'), ('2', 'vasya_pupkin@mail.ru', '=145.da37-a44', 'Василий', 'пр-т. Рабиновича, 1, к.2', 'img/avatar.jpg');

INSERT INTO lots
(id, name, description, image_url, category_id, start_price, end_at, bid_step, creator_id) VALUES
	('1', '2014 Rossignol District Snowboard', 'Описание лота №1', 'img/lot-1.jpg', '1', '10999', '2019-04-29', '100', '1'),
	('2', 'DC Ply Mens 2016/2017 Snowboard', 'Описание лота №2', 'img/lot-2.jpg', '1', '159999', '2019-04-30', '100', '2'),
	('3', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Описание лота №3', 'img/lot-3.jpg', '2', '8000', '2019-04-28', '100', '1'),
	('4', 'Ботинки для сноуборда DC Mutiny Charocal', 'Описание лота №4', 'img/lot-4.jpg', '3', '10999', '2019-04-29', '100', '1'),
	('5','Куртка для сноуборда DC Mutiny Charocal', 'Описание лота №5', 'img/lot-5.jpg', '4', '7500', '2019-04-30', '100', '2'),
	('6','Маска Oakley Canopy', 'Описание лота №6', 'img/lot-6.jpg', '6', '5400', '2019-04-28', '100', '2');

INSERT INTO bids
(id, amount, created_at, user_id, lot_id) VALUES ('1', '15000', '1', '1'), ('2', '165000', '2', '2');

/* получить все категории */
SELECT * FROM categories;

/* получить самые новые, открытые лоты. Каждый лот включает название, стартовую цену, ссылку на изображение, цену, название категории */
SELECT l.name, l.start_price, l.img_url, c.name, b.amount FROM lots AS l
    LEFT JOIN categories AS c ON l.category_id = c.id
		LEFT JOIN bids AS b ON l.category_id = b.id
    WHERE l.winner_id IS NULL AND l.end_at >= CURRENT_DATE()
		ORDER BY l.created_at DESC
		LIMIT 6;

/* показать лот по его id и название категории, к которой он принадлежит */
SELECT l.id, l.name, c.name FROM lots AS l
    LEFT JOIN categories AS c ON l.category_id = c.id
    WHERE l.id = 1;

/* обновить название лота по его идентификатору */
UPDATE lots SET name = 'Новое имя лота'
    WHERE id = 1;

/* получить список самых свежих ставок для лота по его идентификатору */
SELECT id, amount FROM bids
    WHERE lot_id = 1;
