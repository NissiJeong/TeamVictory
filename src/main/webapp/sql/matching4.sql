
/* Drop Triggers */

DROP TRIGGER TRI_baseteam_baseteamno;
DROP TRIGGER TRI_Betting_bettingIndex;
DROP TRIGGER TRI_gameRecord_teamGameNo;
DROP TRIGGER TRI_Gameschedule_gameNo;
DROP TRIGGER TRI_matching_matchingNo;



/* Drop Tables */

DROP TABLE baseHitter CASCADE CONSTRAINTS;
DROP TABLE basePitcher CASCADE CONSTRAINTS;
DROP TABLE gameRecord CASCADE CONSTRAINTS;
DROP TABLE gameschedule CASCADE CONSTRAINTS;
DROP TABLE matching CASCADE CONSTRAINTS;
DROP TABLE Betting CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE baseteam CASCADE CONSTRAINTS;
DROP TABLE basketteam CASCADE CONSTRAINTS;
DROP TABLE futsalteam CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_baseteam_baseteamno;
DROP SEQUENCE SEQ_Betting_bettingIndex;
DROP SEQUENCE SEQ_gameRecord_teamGameNo;
DROP SEQUENCE SEQ_Gameschedule_gameNo;
DROP SEQUENCE SEQ_matching_matchingNo;




/* Create Sequences */

CREATE SEQUENCE SEQ_baseteam INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_Betting INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_gameRecord INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_Gameschedule INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_matching INCREMENT BY 1 START WITH 1 nocache nocycle;


/* Create Tables */

CREATE TABLE baseHitter
(
	recordno number NOT NULL,
	awayteam nvarchar2(20),
	pa number,
	ab number,
	h number,
	b2 number,
	b3 number,
	hr number,
	rbi number,
	sb number,
	cs number,
	bb number,
	hbp number,
	so number,
	gdp number,
	e number,
	pos number,
	Horder number,
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	PRIMARY KEY (recordno)
);


CREATE TABLE basePitcher
(
	recordno number NOT NULL,
	matchdate date DEFAULT SYSDATE NOT NULL,
	W number NOT NULL,
	l number,
	-- 블론1
	-- 
	blsv number,
	ci number,
	co number,
	-- 세이브면 1
	sv number,
	-- 홀드 1
	hol number,
	-- 상대타자수
	tbf number,
	ip number,
	h number,
	hr number,
	bb number,
	hbp number,
	so number,
	r number,
	er number,
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	PRIMARY KEY (recordno)
);


CREATE TABLE baseteam
(
	baseteamno number NOT NULL,
	teamname nvarchar2(20) NOT NULL UNIQUE,
	temaloc nvarchar2(20) NOT NULL,
	baserating number(10,4) DEFAULT 1500 NOT NULL,
	manager_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (baseteamno)
);


CREATE TABLE basketteam
(
	baseteamno number NOT NULL,
	teamname nvarchar2(20) NOT NULL UNIQUE,
	temaloc nvarchar2(20) NOT NULL,
	PRIMARY KEY (baseteamno)
);


CREATE TABLE Betting
(
	bettingIndex number NOT NULL,
	Ateam nvarchar2(20) NOT NULL,
	Bteam nvarchar2(20) NOT NULL,
	ID nvarchar2(15) NOT NULL,
	PRIMARY KEY (bettingIndex)
);


CREATE TABLE futsalteam
(
	baseteamno number NOT NULL,
	teamname nvarchar2(20) NOT NULL UNIQUE,
	temaloc nvarchar2(20) NOT NULL,
	PRIMARY KEY (baseteamno)
);


CREATE TABLE gameRecord
(
	teamGameNo number NOT NULL,
	opposingTeam nvarchar2(20) NOT NULL,
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	PRIMARY KEY (teamGameNo)
);


CREATE TABLE gameschedule
(
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	baseteamno number NOT NULL,
	awayteam nvarchar2(20) NOT NULL,
	gamestatus nvarchar2(10) DEFAULT 'wating' NOT NULL,
	homescore number,
	awayscore number,
	CONSTRAINT gameno primary key (gameDate, stadium, time)
);


CREATE TABLE matching
(
	matchingNo number NOT NULL,
	enemyTeam varchar2(20) NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	reqDate date NOT NULL,
	matchStatus nvarchar2(20) DEFAULT 'wating' NOT NULL,
	baseteamno number NOT NULL,
	PRIMARY KEY (matchingNo)
);


CREATE TABLE member
(
	ID nvarchar2(15) NOT NULL,
	name nvarchar2(20) NOT NULL,
	gender nvarchar2(3) NOT NULL,
	birth nvarchar2(10),
	PWD varchar2(20) NOT NULL,
	phone varchar2(11) NOT NULL,
	email nvarchar2(50) NOT NULL,
	regidate date DEFAULT SYSDATE,
	location nvarchar2(50) NOT NULL,
	height number,
	point number DEFAULT 5000,
	weight number,
	fut_pos nvarchar2(10),
	basket_pos nvarchar2(10),
	base_pos nvarchar2(10),
	fut_mainfoot nvarchar2(20),
	base_mainhand nvarchar2(10),
	-- 선택하면 1
	basket_ltmatch number DEFAULT 0,
	baseteamno number,
	PRIMARY KEY (ID)
);



/* Create Foreign Keys */

ALTER TABLE gameschedule
	ADD FOREIGN KEY (baseteamno)
	REFERENCES baseteam (baseteamno)
;


ALTER TABLE matching
	ADD FOREIGN KEY (baseteamno)
	REFERENCES baseteam (baseteamno)
;


ALTER TABLE member
	ADD FOREIGN KEY (baseteamno)
	REFERENCES baseteam (baseteamno)
;


ALTER TABLE baseHitter
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE basePitcher
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE gameRecord
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE Betting
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_baseteam_baseteamno BEFORE INSERT ON baseteam
FOR EACH ROW
BEGIN
	SELECT SEQ_baseteam_baseteamno.nextval
	INTO :new.baseteamno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Betting_bettingIndex BEFORE INSERT ON Betting
FOR EACH ROW
BEGIN
	SELECT SEQ_Betting_bettingIndex.nextval
	INTO :new.bettingIndex
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_gameRecord_teamGameNo BEFORE INSERT ON gameRecord
FOR EACH ROW
BEGIN
	SELECT SEQ_gameRecord_teamGameNo.nextval
	INTO :new.teamGameNo
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Gameschedule_gameNo BEFORE INSERT ON Gameschedule
FOR EACH ROW
BEGIN
	SELECT SEQ_Gameschedule_gameNo.nextval
	INTO :new.gameNo
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_matching_matchingNo BEFORE INSERT ON matching
FOR EACH ROW
BEGIN
	SELECT SEQ_matching_matchingNo.nextval
	INTO :new.matchingNo
	FROM dual;
END;

/




