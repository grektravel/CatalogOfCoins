CREATE SCHEMA IF NOT EXISTS catalog;

CREATE SEQUENCE IF NOT EXISTS catalog.id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 1
  CACHE 1;
  
CREATE TABLE IF NOT EXISTS catalog.coin
(
  id integer NOT NULL DEFAULT nextval('catalog.id_seq'),
  currency character varying(100) NOT NULL,
  value integer NOT NULL,
  year integer NOT NULL,
  mint character varying(255) NOT NULL,
  description character varying(255),
  CONSTRAINT coinkey PRIMARY KEY (id)
);

CREATE TABLE catalog."user"
(
  login character varying(60) NOT NULL,
  password character varying(60) NOT NULL,
  admin boolean NOT NULL,
  CONSTRAINT loginkey PRIMARY KEY (login)
);

INSERT INTO catalog."user"(login, password, admin) VALUES ('admin', '$2a$10$7Xalpo5Ybd1bzRq.p.xQVeLtFDUVXcLauVjy1ebjBO72kOaPYCF0O', true);
INSERT INTO catalog."user"(login, password, admin) VALUES ('user1', '$2a$10$zVwGuQxJLYMSixtXk40/8O/Q350OfWrQalaYS7oPbfSZXLowv4tPO', false);
INSERT INTO catalog."user"(login, password, admin) VALUES ('user2', '$2a$10$cPB0OQ4ez2jUUiBZNyaHpuAzmJo1Y7KiDe5IT8as7TF5SPpHrztCm', false);

INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('рубль', 1, 1998, 'Московский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('копейка', 10, 2007, 'Московский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('копейка', 50, 2006, 'Питерский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('рубль', 2, 2001, 'Питерский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('цент', 1, 1989, 'Монетный двор Филадельфии, Пеннсильвания', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('цент', 5, 2008, 'Монетный двор Денвера, Колорадо', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('цент', 10, 2006, 'Монетный двор Сан-Франциско, Калифорния', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('квотер', 1, 1999, 'Монетный двор Денвера, Колорадо', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('доллар', 1, 1959, 'Питерский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('лари', 1, 2012, 'Тбилисский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('лари', 2, 2012, 'Тбилисский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('тетри', 5, 2006, 'Тбилисский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('тетри', 10, 2002, 'Тбилисский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('драм', 2, 1989, 'Монетный двор Филадельфии, Пеннсильвания', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('драм', 5, 2010, 'Ереванский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('драм', 10, 2006, 'Ереванский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('лум', 10, 2006, 'Ереванский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('лум', 20, 1959, 'Ереванский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('пенс', 2, 1979, 'Королевский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('стерлинг', 10, 1988, 'Королевский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('сантим', 25, 1982, 'Парижский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('франк', 10, 1991, 'Парижский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('франк', 1, 2003, 'Парижский монетный двор', '');
INSERT INTO catalog.coin(currency, value, year, mint, description) VALUES ('сантим', 2, 2005, 'Парижский монетный двор', '');





