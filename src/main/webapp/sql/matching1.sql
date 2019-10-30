
/* Drop Triggers */

DROP TRIGGER TRI_baseteam_baseteamno;
DROP TRIGGER TRI_Betting_bettingIndex;
DROP TRIGGER TRI_betting_no;
DROP TRIGGER TRI_board_no;
DROP TRIGGER TRI_gameRecord_teamGameNo;
DROP TRIGGER TRI_Gameschedule_gameNo;
DROP TRIGGER TRI_matching_matchingNo;



/* Drop Tables */

DROP TABLE betting CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE hitter CASCADE CONSTRAINTS;
DROP TABLE pitcher CASCADE CONSTRAINTS;
DROP TABLE gameschedule CASCADE CONSTRAINTS;
DROP TABLE matching CASCADE CONSTRAINTS;
DROP TABLE TeamMember CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE Team CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_baseteam_baseteamno;
DROP SEQUENCE SEQ_Betting_bettingIndex;
DROP SEQUENCE SEQ_betting_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_gameRecord_teamGameNo;
DROP SEQUENCE SEQ_Gameschedule_gameNo;
DROP SEQUENCE SEQ_matching_matchingNo;




/* Create Sequences */

CREATE SEQUENCE SEQ_baseteam_baseteamno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Betting_bettingIndex INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_betting_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_board INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_gameRecord_teamGameNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Gameschedule_gameNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_matching_matchingNo INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE betting
(
	no number NOT NULL,
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	ID nvarchar2(15) NOT NULL,
	selectTeam nvarchar2(20) NOT NULL,
	mileage number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE board
(
	no number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	ID nvarchar2(15) NOT NULL,
	PRIMARY KEY (no),
	countNo number default 0
);


CREATE TABLE gameschedule
(
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	awayteam nvarchar2(20) NOT NULL,
	gamestatus nvarchar2(10) DEFAULT 'wating' NOT NULL,
	homescore number,
	awayscore number,
	teamName nvarchar2(20) NOT NULL,
	CONSTRAINT gameno UNIQUE (gameDate, stadium, time)
);


CREATE TABLE hitter
(
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	ID nvarchar2(15) NOT NULL,
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
	horder number,
	CONSTRAINT pk UNIQUE (gameDate, time, ID)
);


CREATE TABLE matching
(
	matchingNo number NOT NULL,
	teamName nvarchar2(20) NOT NULL,
	enemyTeam varchar2(20) NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	reqDate date NOT NULL,
	time number NOT NULL,
	matchStatus nvarchar2(20) DEFAULT 'wating' NOT NULL,
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
	PRIMARY KEY (ID)
);


CREATE TABLE pitcher
(
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	ID nvarchar2(15) NOT NULL,
	W number,
	L number,
	blsv number,
	ci number,
	co number,
	sv number,
	hol number,
	tbf number,
	ip number,
	h number,
	hr number,
	bb number,
	hbp number,
	so number,
	r number,
	er number,
	CONSTRAINT pk_pitcher UNIQUE (gameDate, time, ID)
);


CREATE TABLE Team
(
	teamName nvarchar2(20) NOT NULL,
	category nvarchar2(20) NOT NULL,
	teamloc nvarchar2(50) NOT NULL,
	teamRating number(10,4) NOT NULL,
	manager_id nvarchar2(20) NOT NULL UNIQUE,
	teamInfo nvarchar2(2000) NOT NULL,
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (teamName)
);


CREATE TABLE TeamMember
(
	teamName nvarchar2(20) NOT NULL,
	ID nvarchar2(15) NOT NULL,
	CONSTRAINT pk_teamMember UNIQUE (teamName, ID)
);



/* Create Foreign Keys */

ALTER TABLE betting
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE hitter
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE pitcher
	ADD FOREIGN KEY (gameDate, stadium, time)
	REFERENCES gameschedule (gameDate, stadium, time)
;


ALTER TABLE betting
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;


ALTER TABLE board
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;


ALTER TABLE hitter
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;


ALTER TABLE pitcher
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;


ALTER TABLE TeamMember
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
;


ALTER TABLE gameschedule
	ADD FOREIGN KEY (teamName)
	REFERENCES Team (teamName)
;


ALTER TABLE matching
	ADD FOREIGN KEY (teamName)
	REFERENCES Team (teamName)
;


ALTER TABLE TeamMember
	ADD FOREIGN KEY (teamName)
	REFERENCES Team (teamName)
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

CREATE OR REPLACE TRIGGER TRI_betting_no BEFORE INSERT ON betting
FOR EACH ROW
BEGIN
	SELECT SEQ_betting_no.nextval
	INTO :new.no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_board_no BEFORE INSERT ON board
FOR EACH ROW
BEGIN
	SELECT SEQ_board_no.nextval
	INTO :new.no
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




