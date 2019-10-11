
/* Drop Tables */
/*
DROP TABLE baseHiter CASCADE CONSTRAINTS;
DROP TABLE basePitcher CASCADE CONSTRAINTS;
DROP TABLE gameRecord CASCADE CONSTRAINTS;
DROP TABLE Gameschedule CASCADE CONSTRAINTS;
DROP TABLE matching CASCADE CONSTRAINTS;
DROP TABLE Betting CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE baseteam CASCADE CONSTRAINTS;
DROP TABLE basketteam CASCADE CONSTRAINTS;
DROP TABLE futsalteam CASCADE CONSTRAINTS;
*/



/* Create Tables */
/*
CREATE TABLE baseHiter
(
	recordno number NOT NULL,
	matchdate date DEFAULT SYSDATE NOT NULL,
	-- 출전하면 1
	g number DEFAULT 0,
	avg number(10,4),
	pa number,
	ab number,
	h number,
	2b number,
	3b number,
	hr number,
	rbi number,
	sb number,
	cs number,
	bb number,
	hbp number,
	so number,
	gdp number,
	e number,
	PRIMARY KEY (recordno)
);


CREATE TABLE basePitcher
(
	recordno number NOT NULL,
	matchdate date DEFAULT SYSDATE NOT NULL,
	W number NOT NULL,
	-- 블론1
	-- 
	blsv number,
	ci number,
	co number,
	era number(10,4),
	-- 출전하면 1
	g number DEFAULT 0,
	l number,
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
	PRIMARY KEY (recordno)
);


CREATE TABLE baseteam
(
	baseteamno number NOT NULL,
	teamname nvarchar2(20) NOT NULL UNIQUE,
	temaloc nvarchar2(20) NOT NULL,
	baserating number(10,4) DEFAULT 1500 NOT NULL,
	manager_id  NOT NULL,
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
	resultDate date NOT NULL,
	gameNo number NOT NULL,
	PRIMARY KEY (teamGameNo)
);


CREATE TABLE Gameschedule
(
	gameNo number NOT NULL,
	gameDate date NOT NULL,
	AwayTeam nvarchar2(20) NOT NULL,
	Stadium nvarchar2(20) NOT NULL,
	gameStatus nvarchar2(10) DEFAULT 'wating' NOT NULL,
	baseteamno number NOT NULL,
	homeScore number,
	awayScore number,
	PRIMARY KEY (gameNo)
);


CREATE TABLE matching
(
	matchingNo number NOT NULL,
	enemyTeam varchar2(20) NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	reqDate date NOT NULL,
	matchStatus  DEFAULT wating NOT NULL,
	baseteamno number NOT NULL,
	PRIMARY KEY (matchingNo)
);
*/

CREATE TABLE member
(
	ID nvarchar2(15) NOT NULL,
	PWD varchar2(20) NOT NULL,
	phone varchar2(11) NOT NULL,
	email nvarchar2(50) NOT NULL,
	regidate date DEFAULT SYSDATE,
	location nvarchar2(30) NOT NULL,
	height number,
	point number,
	weight number,
	fut_pos nvarchar2(10),
	basket_pos nvarchar2(10),
	base_pos nvarchar2(10),
	fut_mainfoot nvarchar2(10),
	base_mainhand nvarchar2(10),
	-- 선택하면 1
	basket_ltmatch number DEFAULT 0,
	baseteamno number,
	PRIMARY KEY (ID)
);



/* Create Foreign Keys */
/*
ALTER TABLE Gameschedule
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


ALTER TABLE gameRecord
	ADD FOREIGN KEY (gameNo)
	REFERENCES Gameschedule (gameNo)
;


ALTER TABLE Betting
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;
*/


