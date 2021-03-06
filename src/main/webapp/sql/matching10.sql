
/* Drop Triggers */
/*
DROP TRIGGER TRI_baseteam_baseteamno;
DROP TRIGGER TRI_Betting_bettingIndex;
DROP TRIGGER TRI_betting_no;
DROP TRIGGER TRI_board_no;
DROP TRIGGER TRI_contact_no;
DROP TRIGGER TRI_gameRecord_teamGameNo;
DROP TRIGGER TRI_Gameschedule_gameNo;
DROP TRIGGER TRI_matching_matchingNo;
DROP TRIGGER TRI_message_no;
*/


/* Drop Tables */

DROP TABLE AUTH_SECURITY CASCADE CONSTRAINTS;
DROP TABLE betting CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE hitter CASCADE CONSTRAINTS;
DROP TABLE pitcher CASCADE CONSTRAINTS;
DROP TABLE gameschedule CASCADE CONSTRAINTS;
DROP TABLE matching CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE TeamMember CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE Team CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_baseteam;
DROP SEQUENCE SEQ_betting;
DROP SEQUENCE SEQ_board;
DROP SEQUENCE SEQ_contact;
DROP SEQUENCE SEQ_gameRecord;
DROP SEQUENCE SEQ_Gameschedule;
DROP SEQUENCE SEQ_matching;
DROP SEQUENCE SEQ_message;




/* Create Sequences */




CREATE SEQUENCE SEQ_board INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_contact INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_message INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_baseteam INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_betting INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_gameRecord INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_Gameschedule INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_matching INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_AUTH_SECURITY INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;


/* Create Tables */

CREATE TABLE AUTH_SECURITY
(
	SECNO number NOT NULL,
	ENABLED number(1) DEFAULT 1,
	AUTHORITY varchar2(20) DEFAULT 'ROLE_USER',
	ID nvarchar2(15) NOT NULL,
	PRIMARY KEY (SECNO)
);


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
	count  DEFAULT 0,
	PRIMARY KEY (no)
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
	CONSTRAINT gameno primary key  (gameDate, stadium, time)
);


CREATE TABLE hitter
(
	gameDate date NOT NULL,
	stadium nvarchar2(20) NOT NULL,
	time number NOT NULL,
	ID nvarchar2(15) NOT NULL,
	teamName nvarchar2(20) NOT NULL,
	pa number DEFAULT 0,
	ab number DEFAULT 0,
	h number DEFAULT 0,
	b2 number DEFAULT 0,
	b3 number DEFAULT 0,
	hr number DEFAULT 0,
	R number DEFAULT 0,
	rbi number DEFAULT 0,
	sb number DEFAULT 0,
	cs number DEFAULT 0,
	bb number DEFAULT 0,
	hbp number DEFAULT 0,
	so number DEFAULT 0,
	gdp number DEFAULT 0,
	e number DEFAULT 0,
	pos number DEFAULT 0,
	horder number DEFAULT 0,
	CONSTRAINT pk primary key  (gameDate, time, ID)
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


CREATE TABLE message
(
	no number NOT NULL,
	ID nvarchar2(15) NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	sendDate date DEFAULT SYSDATE,
	openDate date,
	PRIMARY KEY (no)
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
	CONSTRAINT pk_pitcher primary key  (gameDate, time, ID)
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
	teamPicture nvarchar2(100),
	teamLogo nvarchar2(200),
	PRIMARY KEY (teamName)
);


CREATE TABLE TeamMember
(
	teamName nvarchar2(20) NOT NULL,
	ID nvarchar2(15) NOT NULL,
	no number,
	CONSTRAINT pk_teamMember primary key (teamName, ID)
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


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (ID)
	REFERENCES member (ID)
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


ALTER TABLE message
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


ALTER TABLE hitter
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
/*
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

CREATE OR REPLACE TRIGGER TRI_contact_no BEFORE INSERT ON contact
FOR EACH ROW
BEGIN
	SELECT SEQ_contact_no.nextval
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

CREATE OR REPLACE TRIGGER TRI_message_no BEFORE INSERT ON message
FOR EACH ROW
BEGIN
	SELECT SEQ_message_no.nextval
	INTO :new.no
	FROM dual;
END;

/




