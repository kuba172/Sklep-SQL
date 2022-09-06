-- MySQL Workbench Forward Engineering
/* ZADANIA NA OCENĘ DOSTATECZNĄ */
/* 1 i 2 */
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sklepy1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sklepy1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sklepy1` DEFAULT CHARACTER SET utf8 ;
USE `sklepy1` ;
DROP TABLE `sklepy1`.`towary`;
-- -----------------------------------------------------
-- Table `sklepy1`.`towary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`towary` (
  `towary_id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `ilość` INT NULL,
  `kategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`towary_id`),
  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa` ASC))
ENGINE = InnoDB;
DROP TABLE `sklepy1`.`egzemplarz`;
-- -----------------------------------------------------
-- Table `sklepy1`.`egzemplarz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`egzemplarz` (
  `idegzemplarz` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `cena_zakupu` FLOAT NULL,
  `cena_sprzedaży` FLOAT NULL,
  `data_zakupu` DATE NOT NULL,
  `data_sprzedaży` DATE NULL,
  `towary_id` INT NOT NULL,
  PRIMARY KEY (`idegzemplarz`, `towary_id`),
  INDEX `fk_egzemplarz_towary1_idx` (`towary_id` ASC),
  CONSTRAINT `fk_egzemplarz_towary1`
    FOREIGN KEY (`towary_id`)
    REFERENCES `sklepy1`.`towary` (`towary_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE `sklepy1`.`sklepy`;
-- -----------------------------------------------------
-- Table `sklepy1`.`sklepy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`sklepy` (
  `idsklepy` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `adres` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsklepy`),
  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa` ASC))
ENGINE = InnoDB;

DROP TABLE `sklepy1`.`pracownicy`;
-- -----------------------------------------------------
-- Table `sklepy1`.`pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`pracownicy` (
  `idpracownicy` INT NOT NULL AUTO_INCREMENT,
  `imię` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NULL,
  `data_zatrudnienia` DATE NOT NULL,
  `data_zwolnienia` DATE NULL,
  `adres` VARCHAR(45) NULL,
  `stanowisko` VARCHAR(45) NOT NULL,
  `aktualnie_zatrudniony` TINYINT NOT NULL,
  PRIMARY KEY (`idpracownicy`))
ENGINE = InnoDB;

DROP TABLE `sklepy1`.`sklepy_pracownicy`;
-- -----------------------------------------------------
-- Table `sklepy1`.`sklepy_pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`sklepy_pracownicy` (
  `sklepy_idsklepy` INT NOT NULL,
  `pracownicy_idpracownicy` INT NOT NULL,
  PRIMARY KEY (`sklepy_idsklepy`, `pracownicy_idpracownicy`),
  INDEX `fk_sklepy_pracownicy_pracownicy1_idx` (`pracownicy_idpracownicy` ASC),
  INDEX `fk_sklepy_pracownicy_sklepy1_idx` (`sklepy_idsklepy` ASC),
  CONSTRAINT `fk_sklepy_pracownicy_sklepy1`
    FOREIGN KEY (`sklepy_idsklepy`)
    REFERENCES `sklepy1`.`sklepy` (`idsklepy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sklepy_pracownicy_pracownicy1`
    FOREIGN KEY (`pracownicy_idpracownicy`)
    REFERENCES `sklepy1`.`pracownicy` (`idpracownicy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE `sklepy1`.`sklepy_towary`;
-- -----------------------------------------------------
-- Table `sklepy1`.`sklepy_towary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`sklepy_towary` (
  `sklepy_idsklepy` INT NOT NULL,
  `towary_id` INT NOT NULL,
  PRIMARY KEY (`sklepy_idsklepy`, `towary_id`),
  INDEX `fk_sklepy_towary_towary1_idx` (`towary_id` ASC),
  INDEX `fk_sklepy_towary_sklepy1_idx` (`sklepy_idsklepy` ASC),
  CONSTRAINT `fk_sklepy_towary_sklepy1`
    FOREIGN KEY (`sklepy_idsklepy`)
    REFERENCES `sklepy1`.`sklepy` (`idsklepy`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sklepy_towary_towary1`
    FOREIGN KEY (`towary_id`)
    REFERENCES `sklepy1`.`towary` (`towary_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


ALTER TABLE egzemplarz CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE egzemplarz DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE towary CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE towary DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE pracownicy CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE pracownicy DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy_pracownicy CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy_pracownicy DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy_towary CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE sklepy_towary DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*USE sklepy1;*/

/*3*/

INSERT INTO towary ( towary_id, nazwa, ilość, kategoria) VALUES
(1, 'towar 1', '1', 'obuwie czarne zimowe'),
(2, 'towar 2', '1', 'obuwie szare zimowe'),
(3, 'towar 3', '1', 'obuwie białe zimowe'),
(4, 'towar 4', '0', 'obuwie czarne letnie'),
(5, 'towar 5', '0', 'obuwie szare letnie'),
(6, 'towar 6', '2', 'obuwie białe letnie'),
(7, 'towar 7', '1', 'kurtki czarne męskie'),
(8, 'towar 8', '3', 'kurtki białe męskie'),
(9, 'towar 9', '1', 'kurtki żółte męskie'),
(10, 'towar 10', '1', 'kurtki szare męskie'),
(11, 'towar 11', '2', 'kurtki niebieskie męskie'),
(12, 'towar 12', '1', 'kurtki fioletowe męskie'),
(13, 'towar 13', '2', 'szaliki damskie'),
(14, 'towar 14', '4', 'szaliki męskie');

INSERT INTO egzemplarz (idegzemplarz, nazwa, cena_zakupu, cena_sprzedaży, data_zakupu, towary_id) VALUES
(1, 'egzemplarz 1-1', 80.00, 95.00, '2018-03-22',10),
(2, 'egzemplarz 2-1', 83.00, 95.00, '2018-03-22',11),
(3, 'egzemplarz 3-1', 50.00, 61.00,'2018-03-22',2),
(4, 'egzemplarz 6-1', 76.00, 85.00, '2018-03-22',14),
(5, 'egzemplarz 6-2', 76.00, 85.00, '2018-03-22',9),
(6, 'egzemplarz 7-1', 100.00, 125.00, '2018-03-22',6),
(7, 'egzemplarz 8-1', 80.00, 95.00, '2018-03-22',5),
(8, 'egzemplarz 8-2', 80.60, 95.00, '2018-03-22',5),
(9,'egzemplarz 8-3', 80.00, 95.00, '2018-03-22', 4),
(10, 'egzemplarz 9-1', 180.00, 195.00, '2018-03-22', 3),
(11, 'egzemplarz 10-1', 280.00, 310.00, '2018-03-22',12),
(12, 'egzemplarz 11-1', 80.00, 95.00, '2018-03-22',7),
(13, 'egzemplarz 11-2', 80.00, 95.00, '2018-03-22',8),
(14, 'egzemplarz 12-1', 310.00, 395.00, '2018-03-22',5),
(15, 'egzemplarz 13-1', 76.00, 90.00, '2018-03-22',6),
(16, 'egzemplarz 13-2', 76.00, 90.00, '2018-03-22',12),
(17, 'egzemplarz 14-1', 80.00, 95.00, '2018-03-22',14),
(18, 'egzemplarz 14-2', 80.00, 95.00, '2018-03-22',8),
(19, 'egzemplarz 14-3', 80.00, 95.00, '2018-03-22',2),
(20, 'egzemplarz 14-4', 80.00, 95.00, '2018-03-22',3);

INSERT INTO sklepy (idsklepy, nazwa, adres) VALUES
(1, 'nazwa_1_sklepu', 'adres_1_sklepu'),
(2, 'nazwa_2_sklepu', 'adres_2_sklepu'),
(3, 'nazwa_3_sklepu', 'adres_3_sklepu'),
(4, 'nazwa_4_sklepu', 'adres_4_sklepu'),
(5, 'nazwa_5_sklepu', 'adres_5_sklepu'),
(6, 'nazwa_6_sklepu', 'adres_6_sklepu'),
(7, 'nazwa_7_sklepu', 'adres_7_sklepu'),
(8, 'nazwa_8_sklepu', 'adres_8_sklepu'),
(9, 'nazwa_9_sklepu', 'adres_9_sklepu'),
(10, 'nazwa_10_sklepu', 'adres_10_sklepu'),
(11, 'nazwa_11_sklepu', 'adres_11_sklepu'),
(12, 'nazwa_12_sklepu', 'adres_12_sklepu');


INSERT INTO pracownicy (idpracownicy, imię, nazwisko, telefon,  data_zatrudnienia,  data_zwolnienia, adres,  stanowisko, aktualnie_zatrudniony) VALUES
(1, 'Jan', 'Kowalski','50678234', STR_TO_DATE('1-03-2020', '%d-%m-%Y') , null, 'ul.Kopernika 3 Rzeszów', 'sprzedawca', 1),
(2, 'Emanuel', 'Lis', '12345678', STR_TO_DATE('20-12-2018', '%d-%m-%Y'), null, 'ul.Skłodowskiej 12 Warszawa',  'sprzedawca', 1),
(3, 'Natan', 'Sobczak', '12345765', STR_TO_DATE('14-02-2018', '%d-%m-%Y'), null, 'ul.Weglowa 34 Warszawa', 'informatyk', 1),
(4, 'Ryszard', 'Krawczyk', '345765345', STR_TO_DATE('27-03-2019', '%d-%m-%Y'),null, 'ul.Wawelska Krakow', 'specjalista ds. zaopatrzenia', 1),
(5, 'Diego', 'Kowalczyk', '34654234', STR_TO_DATE('02-03-2020', '%d-%m-%Y'), null, 'ul.Popieluszki 34 Siedlce', 'sprzedawca', 1),
(6, 'Edward', 'Wójcik', '567876345', STR_TO_DATE('22-01-2019', '%d-%m-%Y'), null, 'ul.Koszykowa 45 Warszawa', 'sprzedawca', 0),
(7, 'Gniewomir', 'Szewczyk', '567345678', STR_TO_DATE('3-02-2018', '%d-%m-%Y'), null, 'ul.Hynka 34 Wrocław', 'księgowy', 1),
(8, 'Józef', 'Woźniak', '678123456', STR_TO_DATE('28-05-2020', '%d-%m-%Y'), null, 'ul.Ksiazeca 23 Gdynia', 'księgowy', 1),
(9, 'Anatol', 'Czarnecki', '234567890', STR_TO_DATE('10-06-2019', '%d-%m-%Y'), null, 'ul.Krakowska 4 Gdynia', 'główny księgowy', 1),
(10, 'Beata', 'Kaczmarczyk', '234567345', STR_TO_DATE('22-06-2018', '%d-%m-%Y'), null, 'ul.Kowalskiego 34 Warszawa', 'dyrektor działu sprzedaży', 1),
(11, 'Magdalena', 'Wiśniewska','45347689', STR_TO_DATE('10-01-2015', '%d-%m-%Y'),null, 'ul.Grodzka 23 Płock','specjalista ds. sprzątania', 0),
(12, 'Aleksandra', 'Gajewska', '123546654', STR_TO_DATE('26-12-2018', '%d-%m-%Y'), null, 'ul.Dawidowska 34 Gdynia', 'sprzedawca', 1),
(13, 'Aneta', 'Jasińska', '234654234', STR_TO_DATE('12-03-2018', '%d-%m-%Y'), null, 'ul.Grunwaldzka 34 Warszawa', 'sprzedawca', 1),
(14, 'Magdalena', 'Włodarczyk', '6544234546', STR_TO_DATE('2-02-2016', '%d-%m-%Y'), null, 'ul.Robertowska 33 Gdynia', 'specjalista ds. zaopatrzenia', 1),
(15, 'Marlena', 'Szymczak', '567893234', STR_TO_DATE('13-05-2019', '%d-%m-%Y'), null, 'ul.Jana Pawla 3 Warszawa', 'specjalista ds. sprzątania', 1),
(16, 'Joanna', 'Szymańska', '789234543',  STR_TO_DATE('23-02-2017', '%d-%m-%Y'), null, 'ul.Choppina 3 Sulejówek', 'informatyk', 0),
(17, 'Honorata', 'Sadowska', '567345234', STR_TO_DATE('10-02-2020', '%d-%m-%Y'), null, 'ul.Franciszkańska 34 Otwock', 'przedstawiciel handlowy', 1),
(18, 'Ewelina', 'Dąbrowska', '57623423', STR_TO_DATE('13-04-2020', '%d-%m-%Y'), null, 'ul.Nowowiejska 23 Warszawa', 'sprzedawca', 1),
(19, 'Lucyna', 'Szulc', '798456123', STR_TO_DATE('12-02-2019', '%d-%m-%Y') , null, 'ul.Andersena 23 Otwock', 'sprzedawca', 0),
(20, 'Jaś', 'Fasola', '12345634', STR_TO_DATE('12-06-2015', '%d-%m-%Y'), null, 'ul.Koryncka 34 Gdynia', 'prezes zarządu', 1);

select * from  pracownicy; 

INSERT INTO sklepy_pracownicy (sklepy_idsklepy , pracownicy_idpracownicy) VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(4,8),
(5,9),
(5,10),
(6,11),
(6,12),
(7,13),
(7,14),
(8,15),
(8,16),
(9,17),
(10,18),
(11,19),
(12,20);

INSERT INTO sklepy_towary (sklepy_idsklepy , towary_id) VALUES
(1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,10), (1,11), (1,12), (1,13), (1,14), 
(2,1), (2,2), (2,3), (2,4), (2,5), (2,6), (2,7), (2,8), (2,9), (2,10), (2,11), (2,12), (2,13), (2,14), 
(3,1), (3,2), (3,3), (3,4), (3,5), (3,6), (3,7), (3,8), (3,9), (3,10), (3,11), (3,12), (3,13), (3,14), 
(4,1), (4,2), (4,3), (4,4), (4,5), (4,6), (4,7), (4,8), (4,9), (4,10), (4,11), (4,12), (4,13), (4,14), 
(5,1), (5,2), (5,3), (5,4), (5,5), (5,6), (5,7), (5,8), (5,9), (5,10), (5,11), (5,12), (5,13), (5,14), 
(6,1), (6,2), (6,3), (6,4), (6,5), (6,6), (6,7), (6,8), (6,9), (6,10), (6,11), (6,12), (6,13), (6,14), 
(7,1), (7,2), (7,3), (7,4), (7,5), (7,6), (7,7), (7,8), (7,9), (7,10), (7,11), (7,12), (7,13), (7,14), 
(8,1), (8,2), (8,3), (8,4), (8,5), (8,6), (8,7), (8,8), (8,9), (8,10), (8,11), (8,12), (8,13), (8,14), 
(9,1), (9,2), (9,3), (9,4), (9,5), (9,6), (9,7), (9,8), (9,9), (9,10), (9,11), (9,12), (9,13), (9,14), 
(10,1), (10,2), (10,3), (10,4), (10,5), (10,6), (10,7), (10,8), (10,9), (10,10), (10,11), (10,12), (10,13), (10,14), 
(11,1), (11,2), (11,3), (11,4), (11,5), (11,6), (11,7), (11,8), (11,9), (11,10), (11,11), (11,12), (11,13), (11,14), 
(12,1), (12,2), (12,3), (12,4), (12,5), (12,6), (12,7), (12,8), (12,9), (12,10), (12,11), (12,12), (12,13), (12,14);


/*4*/

SELECT imię, nazwisko, aktualnie_zatrudniony 
FROM pracownicy
WHERE aktualnie_zatrudniony = 0;

SELECT nazwa, cena_zakupu
FROM egzemplarz
WHERE cena_zakupu < 70;

SELECT * 
FROM towary
WHERE ilość IN (1, 2)
ORDER BY ilość;

/*5*/
SET SQL_SAFE_UPDATES = 0;
UPDATE pracownicy
SET stanowisko = 'technik'
WHERE nazwisko = 'Lis' AND aktualnie_zatrudniony = 1;

 select * from pracownicy;
UPDATE sklepy
SET nazwa = 'odzieżowy'
WHERE nazwa = 'nazwa_1_sklepu';

UPDATE egzemplarz
SET cena_sprzedaży = 30.00
WHERE cena_zakupu - 76.00;

/*6*/
SET FOREIGN_KEY_CHECKS=0; -- awaria zastosowac przed usunieciem
SET FOREIGN_KEY_CHECKS=1; -- awaria zastosowac po usunieciu
DELETE FROM pracownicy
WHERE stanowisko = 'informatyk' AND aktualnie_zatrudniony = 0;

DELETE FROM towary
WHERE ilość = 0;

DELETE FROM sklepy
WHERE adres = 'adres_3_sklepu';

/*7*/

SELECT a.nazwa, a.ilość, b.cena_zakupu
FROM towary a, egzemplarz b
WHERE a.ilość = 1 AND b.cena_zakupu < 100.00;

/*8*/
ALTER TABLE egzemplarz MODIFY idegzemplarz INT NOT NULL;
ALTER TABLE egzemplarz DROP PRIMARY KEY;
ALTER TABLE egzemplarz MODIFY idegzemplarz INT NOT NULL PRIMARY KEY AUTO_INCREMENT;

/*9*/
ALTER TABLE egzemplarz MODIFY towary_id INT NOT NULL;
ALTER TABLE egzemplarz ADD FOREIGN KEY (towary_id) REFERENCES towary(towary_id);

/*10*/
ALTER TABLE egzemplarz ADD CONSTRAINT UC_egzemplarz UNIQUE (idegzemplarz, nazwa);

/*11*/
SELECT * FROM  egzemplarz WHERE nazwa IS NOT NULL AND towary_id IS NOT NULL;

/*zadania na ocene dobrą */
/*2 tabele -sklepy_pracownicy o sklepy towary stworzone i wypełnione podczas tworzenia bay w 
zadaniu 1 i dodane po wykonaniu zadania pierwszego  ( na ocenę 3) */

/*3*/
select * from pracownicy where stanowisko = 'sprzedawca' AND data_zwolnienia is null;
update pracownicy set data_zwolnienia = STR_TO_DATE('27-12-2020', '%d-%m-%Y') where nazwisko = 'Lis'AND data_zwolnienia is null;
Delete from pracownicy where telefon = '798456123' AND data_zwolnienia is null;

/*4*/

select * from pracownicy where stanowisko like 's%';
SELECT * FROM pracownicy WHERE stanowisko LIKE 'i%k';
SELECT * FROM pracownicy WHERE nazwisko LIKE '%wa%';
SELECT * FROM pracownicy WHERE nazwisko LIKE '%a';
SELECT * FROM pracownicy WHERE data_zatrudnienia LIKE '2020%';

/*5*/
SELECT COUNT(stanowisko) FROM pracownicy WHERE stanowisko ='sprzedawca';
SELECT COUNT(adres) FROM sklepy WHERE adres like '%adr%';
SELECT SUM(towary_id) FROM egzemplarz WHERE towary_id = 5;
SELECT AVG(ilość) FROM towary;
SELECT SUM(towary_id) from sklepy_towary where towary_id = 2 OR towary_id =1;
SELECT COUNT(pracownicy_idpracownicy) FROM sklepy_pracownicy WHERE sklepy_idsklepy =5;

/*6*/
SELECT towary.nazwa, towary.ilość, egzemplarz.nazwa, egzemplarz.cena_zakupu FROM egzemplarz INNER JOIN towary ON towary.towary_id = egzemplarz.towary_id;
SELECT towary.nazwa, sklepy.adres , sklepy.nazwa from sklepy_towary LEFT JOIN towary ON towary.towary_id = sklepy_towary.towary_id
RIGHT JOIN sklepy ON sklepy.idsklepy = sklepy_towary.sklepy_idsklepy;

 /*7*/
ALTER TABLE egzemplarz MODIFY towary_id INT NOT NULL;
ALTER TABLE egzemplarz ADD FOREIGN KEY (towary_id) REFERENCES towary(towary_id);
Delete FROM egzemplarz where towary_id = 2;

ALTER TABLE sklepy_towary MODIFY towary_id INT NOT NULL;
ALTER TABLE sklepy_towary ADD FOREIGN KEY (towary_id) REFERENCES towary(towary_id);
Delete FROM sklepy_towary where towary_id = 14;

/*8*/

ALTER TABLE egzemplarz add opis varchar(255);
ALTER TABLE pracownicy DROP COLUMN data_zwolnienia;
ALTER TABLE sklepy_towary MODIFY towary_id INT NOT NULL;
ALTER TABLE sklepy_towary ADD FOREIGN KEY (towary_id) REFERENCES towary(towary_id);
ALTER TABLE egzemplarz RENAME COLUMN nazwa TO nazwa_egzemplarza;

/*9*/
select * from pracownicy where imię like '%a%' Order by data_zatrudnienia;
select * from sklepy where nazwa like '%naz%' Order by adres;
select * from towary where ilość > 2 order by ilość;
select * from egzemplarz where cena_zakupu > 50.00 order by cena_zakupu;

/*10*/

CREATE VIEW sklepyLista
AS
SELECT  towary.ilość,
        sklepy.adres,
        sklepy.nazwa 
FROM   sklepy_towary
        LEFT JOIN towary ON towary.towary_id = sklepy_towary.towary_id
RIGHT JOIN sklepy ON sklepy.idsklepy = sklepy_towary.sklepy_idsklepy;

CREATE VIEW EgzemplarzeLista
AS SELECT towary.kategoria, 
		  towary.ilość, 
          egzemplarz.nazwa, 
          egzemplarz.cena_zakupu 
FROM egzemplarz 
INNER JOIN towary ON towary.towary_id = egzemplarz.towary_id;

/*11*/
update egzemplarz set data_zakupu = STR_TO_DATE('1-03-2020', '%d-%m-%Y') where idegzemplarz = 1;
update egzemplarz set data_zakupu = sysdate() where idegzemplarz = 8;
update towary set nazwa = LOWER(nazwa) where towary_id = 1;
Select AVG(cena_zakupu) from egzemplarz;

/*12*/

select ilość from towary order by ilość desc limit 5;

/*zadania na ocene bardzo dobra */
/*2*/
SELECT A.Imię AS imię1, B.Imię AS imię2, A.stanowisko FROM pracownicy A, pracownicy B WHERE A.idpracownicy <> B.idpracownicy AND
	A.stanowisko = B.stanowisko;

/*3*/
SELECT * FROM towary WHERE NOT EXISTS (SELECT egzemplarz.towary_id FROM egzemplarz WHERE egzemplarz.towary_id = towary.towary_id); 
SELECT pracownicy.imię , pracownicy.Nazwisko FROM pracownicy WHERE imię IN (SELECT  pracownicy.imię FROM pracownicy WHERE  pracownicy.imię LIKE "j%");

/*4*/
SELECT pracownicy.imię, pracownicy.nazwisko, COUNT(*) - 1 as duplikaty FROM pracownicy GROUP BY pracownicy.imię, pracownicy.nazwisko HAVING duplikaty > 0;
SELECT egzemplarz.cena_zakupu, egzemplarz.nazwa, COUNT(*) - 1 as duplikaty FROM egzemplarz GROUP BY egzemplarz.cena_zakupu, egzemplarz.nazwa HAVING duplikaty > 0;

/*5*/
CREATE INDEX egzemplarzIndex ON egzemplarz (nazwa);
CREATE INDEX pracownicyIndex ON pracownicy (imię);

/*6*/
SELECT * FROM towary WHERE NOT EXISTS (SELECT * FROM egzemplarz WHERE egzemplarz.towary_id = towary.towary_id);
SELECT * FROM towary WHERE NOT EXISTS (SELECT * FROM sklepy_towary WHERE sklepy_towary.towary_id = towary.towary_id);

/*7*/

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM towary
END //

DELIMITER ;
DROP TABLE `sklepy1`.`sklepy2`;
-- -----------------------------------------------------
-- Table `sklepy1`.`sklepy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklepy1`.`sklepy2` (
  `idsklepy2` INT NOT NULL AUTO_INCREMENT,
  `nazwa2` VARCHAR(45) NOT NULL,
  `adres2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsklepy2`),
  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa2` ASC))
ENGINE = InnoDB;
INSERT INTO sklepy2 (idsklepy2, nazwa2, adres2) VALUES
(15, 'nazwa_1_sklepu', 'adres_1_sklepu'),
(16, 'biedronka', 'ul.kowalskiego 45 Warszawa'),
(17, 'makro', 'ul.koryncka Gdynia');

INSERT INTO sklepy (idsklepy, nazwa, adres) select * from sklepy2;
SELECT sklepy.nazwa, sklepy.adres, COUNT(*) - 1 as duplikaty FROM sklepy GROUP BY sklepy.nazwa, sklepy.adres HAVING duplikaty > 0;
select * from sklepy;

/*8*/

CREATE VIEW sklepowLista
AS
SELECT  towary.ilość,
        sklepy.adres,
        sklepy.nazwa 
FROM   sklepy_towary
        LEFT JOIN towary ON towary.towary_id = sklepy_towary.towary_id
RIGHT JOIN sklepy ON sklepy.idsklepy = sklepy_towary.sklepy_idsklepy where sklepy.nazwa like '%a%';

CREATE VIEW PracownicysklepowLista
AS
SELECT  pracownicy.nazwisko,
		pracownicy.stanowisko,
        sklepy.adres,
        sklepy.nazwa 
FROM   sklepy_pracownicy
        LEFT JOIN pracownicy ON pracownicy.idpracownicy = sklepy_pracownicy.pracownicy_idpracownicy
RIGHT JOIN sklepy ON sklepy.idsklepy = sklepy_pracownicy.sklepy_idsklepy GROUP BY sklepy.nazwa, sklepy.adres HAVING pracownicy.stanowisko = 'sprzedawca' ;

/*9*/
SELECT pracownicy.imię, pracownicy.nazwisko, COUNT(*) - 1 as duplikaty FROM pracownicy GROUP BY pracownicy.imię, pracownicy.nazwisko HAVING duplikaty > 0;
SELECT egzemplarz.cena_zakupu, egzemplarz.nazwa, COUNT(*) - 1 as duplikaty FROM egzemplarz GROUP BY egzemplarz.cena_zakupu, egzemplarz.nazwa HAVING duplikaty > 0;
SELECT sklepy.nazwa, sklepy.adres, COUNT(*) - 1 as duplikaty FROM sklepy GROUP BY sklepy.nazwa, sklepy.adres HAVING duplikaty > 0;

/*10*/
update egzemplarz 
INNER JOIN towary ON towary.towary_id = egzemplarz.towary_id
SET egzemplarz.nazwa = towary.nazwa
where egzemplarz.towary_id > 12;


/*11*/
select * from pracownicy where data_zatrudnienia < sysdate();
update egzemplarz set data_zakupu = sysdate() where nazwa like '%a%';

/*12*/
SELECT nazwisko, stanowisko FROM pracownicy
UNION
SELECT adres, nazwa FROM sklepy;

/*13*/
update egzemplarz set data_zakupu = STR_TO_DATE('1-03-2020', '%d-%m-%Y') where idegzemplarz = 1;
update egzemplarz set data_zakupu = sysdate() where idegzemplarz = 8;
select * from pracownicy where data_zatrudnienia < sysdate();

update towary set nazwa = LOWER(nazwa) where towary_id = 1;
update towary set nazwa = UPPER(nazwa) where towary_id = 1;
update towary set ilość = ascii(ilość) where towary_id = 1;

Select AVG(cena_zakupu) from egzemplarz;
select SUM(ilość) from towary;
SELECT MAX(cena_zakupu) from egzemplarz;