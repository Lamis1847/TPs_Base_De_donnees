CREATE TABLE medecin(
       n_med		integer constraint pk_medecin primary key,
       identite_med	varchar2(30) not null,
       tel_med		char(10),
       adr_elec_med	varchar2(30),
       prof_serv	varchar2(30) not null,
       statut		varchar2(7) constraint dom_statut_medecin check(statut in ('PATTASS', 'PATT', 'PUPH', 'CCA')) not null
);
CREATE TABLE med_plage_consult(
       n_med		integer constraint fk_med_plage_consult_medecin references
       				medecin(n_med) on delete cascade not deferrable,
       jour_sem		varchar2(8) constraint dom_jour_sem_med_plage_consult check(jour_sem in (
       			'lundi','mardi', 'mercredi', 'jeudi', 'vendredi','samedi')),
       h_deb		integer constraint dom_h_deb_med_plage_consult check(h_deb between 8 and 17) not null,
       h_fin		integer constraint dom_h_fin_med_plage_consult check(h_fin between 11 and 19),
       constraint ck_med_plage_consult_hdeb_hfin check (h_deb < h_fin),
       constraint pk_med_plage_consult primary key (n_med, jour_sem)
);	

CREATE TABLE malade(
       n_malade		integer constraint cleprim_malade primary key,
       nom_malade	varchar2(20) not null,
       prenom_malade	varchar2(15) not null,
       adr_malade	varchar2(256),
       tel_fixe_mal	char(10),
       tel_mob_mal	char(10),
       constraint ck_malade_nom check (nom_malade=lower(nom_malade)),
       constraint ck_malade_prenom check (prenom_malade=lower(prenom_malade))
);

CREATE TABLE consultation(
       n_med		integer constraint fk_consultation_medecin references medecin(n_med),
       n_malade		integer constraint fk_consultation_malade references
       			        malade(n_malade) on delete cascade deferrable initially deferred,
       date_consult	date,
       h_consult	integer not null,
       prescription	varchar2(128),
       examen		varchar2(128),
       constraint pk_consultation primary key(n_med, n_malade, date_consult)
);

INSERT INTO  medecin VALUES (104,'Jean MOREL','0149282592','jean.morel@free.fr','Florence ROUSSEAU','PATTASS');
INSERT INTO  medecin VALUES (123,'Alexandre BERNARD','0149282594','alex.bernard@yahoo.fr','Florence ROUSSEAU','PATT');
INSERT INTO  medecin VALUES (107,'Florence ROUSSEAU','0149282678','florence.rousseau@wanadoo.fr','Florence ROUSSEAU','PUPH');   
INSERT INTO  medecin VALUES (131,'Mathilde MORIN','0149282598','mathilde.morin2@wanadoo.fr','Florence ROUSSEAU','PATT');
INSERT INTO  medecin VALUES (146,'Laurent MERCIER','0149282584','laurent.mercier@free.fr','Florence ROUSSEAU','PATT');
INSERT INTO  medecin VALUES (124,'Christophe GARNIER','0149282567','chris.garnier@free.fr','Florence ROUSSEAU','CCA');
INSERT INTO  medecin VALUES (130,'Jeanne TUYAUX','0149285690','jeanne.tuyaux@wanadoo.fr','Alexandre TARAUD','CCA');
INSERT INTO  medecin VALUES (138,'Alexandre TARAUD','0149285690','alexandre.taraud@free.fr','Alexandre TARAUD','PUPH');
INSERT INTO  medecin VALUES (152,'Roselyne MEDECIN','0149285694','rose.medecin@free.fr','Alexandre TARAUD','CCA');

insert into med_plage_consult values(123,'mardi',8,12);
insert into med_plage_consult values(123,'jeudi',13,17);
insert into med_plage_consult values(123,'samedi',9,12);
insert into med_plage_consult values(107,'jeudi',13,17);
insert into med_plage_consult values(131,'lundi',17,19);
insert into med_plage_consult values(131,'samedi',10,12);
insert into med_plage_consult values(146,'mercredi',13,17);
insert into med_plage_consult values(146,'lundi',8,12);
insert into med_plage_consult values(124,'samedi',9,12);
insert into med_plage_consult values(130,'mardi',13,17);
insert into med_plage_consult values(130,'jeudi',13,17);
insert into med_plage_consult values(130,'mercredi',17,19);
insert into med_plage_consult values(130,'lundi',10,12);
insert into med_plage_consult values(130,'samedi',10,12);
insert into med_plage_consult values(138,'mardi',13,17);
insert into med_plage_consult values(152,'mercredi',13,17);

INSERT INTO malade VALUES(5678,'durand','pierre','8 rue des plantes 75005 Paris','0123678767','0745453423');
INSERT INTO malade VALUES(5430,'marchand','fabrice','10 boulevard Sébastopol 75003 Paris','0145672312','0678905632');
INSERT INTO malade VALUES(5220,'bonnet','monique','34 rue de la Chine 75020 Paris', '0162738473','0687455620');
INSERT INTO malade VALUES(5970,'lambert','jacques','45 rue de Charenton 75012 Paris','0182567878','0673568098');
INSERT INTO malade VALUES(5780,'durand','jeanne','20 boulevard de la Bastille 75004 Paris','0134567189','0656787362');
INSERT INTO malade VALUES(5632,'faure','aline','27 rue de la Roquette 75011 Paris','0143478372','0607634567');
INSERT INTO malade VALUES(5320,'garcia','paul','79 rue du Faubourg saint Antoine 75011 Paris','0143458578','0663567680');

insert into consultation(n_med,n_malade,date_consult,h_consult) values(123,5780,'18-OCT-2011','09');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(123,5780,'27-OCT-2011','15');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(130,5780,'02-NOV-2011','18');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(138,5780,'04-OCT-2011','16');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(131,5632,'03-OCT-2011','16');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(131,5678,'03-OCT-2011','17');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(131,5430,'03-OCT-2011','18');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(131,5780,'08-OCT-2011','10');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(131,5678,'10-OCT-2011','18');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(152,5220,'12-OCT-2011','14');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(146,5320,'12-OCT-2011','14');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(124,5320,'15-NOV-2011','10');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(130,5320,'24-OCT-2011','10');
insert into consultation(n_med,n_malade,date_consult,h_consult) values(130,5320,'26-OCT-2011','18');

//////////// Déclencheurs
1)
CREATE OR REPLACE TRIGGER Malad
AFTER INSERT ON malade
FOR EACH ROW
DECLARE 
     plusGrandId NUMBER;
    
BEGIN
    select Max(n_malade) INTO plusGrandId FROM malade;
    UPDATE malade 
    SET n_malade = plusGrandId +1 
    WHERE n_malade =:NEW.n_malade;
    UPDATE malade
    SET nom_malade = LOWER(nom_malade)
    WHERE n_malade =:NEW.n_malade;
    UPDATE malade
    SET prenom_malade = LOWER(prenom_malade)
    WHERE n_malade =:NEW.n_malade;
END;

2)
CREATE OR REPLACE TRIGGER Consul
AFTER INSERT ON consultation
FOR EACH ROW
DECLARE 
     pres varchar2(128);
     exm  varchar2(128);
     pragma autonomous_transaction;
BEGIN
    SELECT  prescription, examen INTO pres, exm from consultation where prescription =: new.prescription
    AND examen =: NEW.examen;
    IF (pres= NULL AND exm =NULL) THEN
        UPDATE consultation 
        SET examen = 'Visite de routine' 
        WHERE examen=: NEW.examen;
    END IF;
END;

insert into consultation(n_med,n_malade,date_consult,h_consult,prescription,examen) values(160,3256,'26-OCT-2011','18', 'test',NULL);

3)
CREATE table ARCHIVE_CONSULTATION ( 
        n_med		integer constraint fk_consultation_med references medecin(n_med), 
       n_malade		integer constraint fk_consultation_malad references 
       			        malade(n_malade) on delete cascade deferrable initially deferred, 
       date_consult	date, 
       h_consult	integer not null, 
       prescription	varchar2(128), 
       examen		varchar2(128), 
       constraint pk_consult primary key(n_med, n_malade, date_consult) 
);
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(123,5780,DATE '2011-10-18','09')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(123,5780,DATE '2011-10-27','15')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(130,5780,DATE '2011-11-02','18')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(138,5780,DATE '2011-10-04','16')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(131,5632,DATE '2011-10-03','16')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(131,5678,DATE '2011-10-03','17')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(131,5430,DATE '2011-10-03','18')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(131,5780,DATE '2011-10-08','10')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(131,5678,DATE '2011-10-10','18')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(152,5220,DATE '2011-10-12','14')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(146,5320,DATE '2011-10-12','14')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(124,5320,DATE '2011-11-15','10')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(130,5320,DATE '2011-10-24','10')
insert into ARCHIVE_CONSULTATION(n_med,n_malade,date_consult,h_consult) values(130,5320,DATE '2011-10-26','18')

TRUNCATE TABLE consultation

4)

CREATE OR REPLACE TRIGGER consul_modif 
BEFORE UPDATE OF n_med, n_malade, date_consult, h_consult, prescription, examen 
ON ARCHIVE_CONSULTATION   
FOR EACH ROW 
BEGIN 
 raise_application_error (-20000,'table non modifiable !',FALSE); 
END;
/ test
UPDATE ARCHIVE_CONSULTATION  
SET examen = 'Visite de routine'  
where n_med=130

6)
ALTER TABLE medecin  
add prime NUMBER

CREATE OR REPLACE TRIGGER prime_med
after insert on consultation
FOR EACH ROW
DECLARE 
    nbr NUMBER;
BEGIN
select count(*) INTO nbr from consultation where n_med=: NEW.n_med;
update medecin
set prime = nbr*25
where  n_med=: NEW.n_med;
END;


select count(*) from med_plage_consult where jour_sem ='samedi' AND h_deb IN (9,10) AND  h_fin IN (11,12);
7)
CREATE OR REPLACE TRIGGER plage_consul
before insert on med_plage_consult
FOR EACH ROW
DECLARE 
nbConsu NUMBER;

begin
select COUNT(*) into nbConsu from med_plage_consult 
where  jour_sem=: NEW.jour_sem AND h_deb =: NEW.h_deb AND h_fin=: NEW.h_fin;
IF (nbConsu > 3) THEN
    raise_application_error (-20000,'Nombre max de consultation atteint !',FALSE); 
END IF;
END;


///// PL/SQL
1)
ALTER TABLE medecin 
ADD salaire float;

UPDATE medecin
SET salaire = 2000;

2)

DECLARE nbr NUMBER;
BEGIN
    SELECT count(*) into nbr from medecin where statut = 'PATTASS' AND prof_serv = 'Florence ROUSSEAU';
    if nbr >0 THEN
        DELETE FROM medecin
        where statut = 'PATTASS' AND prof_serv = 'Florence ROUSSEAU';
        DBMS_OUTPUT.PUT_LINE('le nombre de suppression ='|| nbr);
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Aucun medecin supprime');
    
    END IF;
END;

3)

CREATE OR REPLACE FUNCTION NbConsul(idMed IN NUMBER, dat IN DATE)
RETURN NUMBER IS
nbr_consul number :=0;
BEGIN
SELECT count(*) into nbr_consul FROM consultation WHERE n_med=idMed AND date_consult=dat;
return nbr_consul;
END;

DECLARE nbr_consul NUMBER;
BEGIN
nbr_consul:= NbConsul(131, DATE '2011-10-03');
DBMS_OUTPUT.PUT_LINE('le nombre de consultation est  ='|| nbr_consul);
end;

4)

CREATE OR REPLACE PROCEDURE AugSal(stat IN CHAR, idMed IN NUMBER, sal OUT float ) IS
BEGIN
SELECT salaire into sal FROM medecin where statut = stat AND n_med=idMED;
IF stat = 'PUPH' THEN
   sal := sal+0.08;
ELSIF stat = 'PATT' THEN
   sal:= sal+0.05;
ELSE 
   sal:= sal+0.02;
END IF;
END;

DECLARE SAL float;
BEGIN
AugSal('PUPH',107, SAL);
DBMS_OUTPUT.PUT_LINE('le nouveau salaire est  ='|| SAL);
end;

///////////EXO3

CREATE TABLE MOVIES
(
  MOVIE_ID NUMBER(5),
  TITLE VARCHAR2(30) NOT NULL,
  GENDER VARCHAR2(30),
  RELEASE_DATE DATE,
  RUNNING_TIME NUMBER,
  BUDGET NUMBER,
  CONSTRAINT PK_MOVIE_ID PRIMARY KEY (MOVIE_ID)
);

CREATE TABLE ARTISTS
(
  PERS_ID NUMBER(5) NOT NULL,
  FIRSTNAME VARCHAR2(30) NOT NULL,
  LASTNAME VARCHAR2(30) NOT NULL,
  BIRTHDATE DATE,
  DEATH_DATE DATE,
  COUNTRY VARCHAR2(30),
  CONSTRAINT PK_ARTIST PRIMARY KEY (PERS_ID)
);
  

CREATE TABLE DIRECTED_BY
(
  MOVIE_ID NUMBER(5) NOT NULL,
  PERS_ID NUMBER(5) NOT NULL,
  CONSTRAINT PK_DIRECTED_BY PRIMARY KEY (MOVIE_ID, PERS_ID)
);

CREATE TABLE STARRING
(
  PERS_ID NUMBER(5) NOT NULL,
  MOVIE_ID NUMBER(5) NOT NULL,
  CONSTRAINT PK_STARRING PRIMARY KEY (PERS_ID, MOVIE_ID)  
);


CREATE TABLE CINEMA
(
  CINE_ID NUMBER(5) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  COMPANY VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_CINEMA PRIMARY KEY (CINE_ID)
);

CREATE TABLE MOVIE_THEATER
(
  MOV_THR_ID NUMBER(5) NOT NULL,
  CINE_ID NUMBER(5) NOT NULL,
  SCREEN_SIZE NUMBER(5),
  CAPACITY NUMBER(5) NOT NULL,
  CONSTRAINT PK_MOVIE_THEATER PRIMARY KEY (MOV_THR_ID,CINE_ID)
);


CREATE TABLE PLAY
(
  MOV_THR_ID NUMBER(5) NOT NULL,
  CINE_ID NUMBER(5) NOT NULL,
  MOVIE_ID NUMBER(5),
  START_DATE DATE,
  END_DATE DATE,
  -- TIMETABLE TIMESTAMP,
  CONSTRAINT PK_PLAY PRIMARY KEY (MOV_THR_ID,CINE_ID,MOVIE_ID, START_DATE)
);

CREATE TABLE REVIEW_AGGREGATOR
(
  REVIEW_AGGREGATOR_ID NUMBER(5) NOT NULL,
  NAME VARCHAR(30) NOT NULL,
  CONSTRAINT PK_REVIEW_AGGREGATOR PRIMARY KEY (REVIEW_AGGREGATOR_ID)
);

CREATE TABLE REVIEWS
(
  MOVIE_ID NUMBER(5) NOT NULL,
  REVIEW_AGGREGATOR_ID NUMBER(5) NOT NULL,
  SCORE_PCT NUMBER(2),
  CRITIC_NUMBER NUMBER(5),
  CONSTRAINT PK_REVIEWS PRIMARY KEY (MOVIE_ID, REVIEW_AGGREGATOR_ID)
);

ALTER TABLE DIRECTED_BY
  ADD CONSTRAINT FK_MOVIE_DIRECTED_BY
      FOREIGN KEY (MOVIE_ID)
  REFERENCES MOVIES (MOVIE_ID) ;

ALTER TABLE DIRECTED_BY
  ADD CONSTRAINT FK_DIRECTED_BY_PERSON
      FOREIGN KEY (PERS_ID)
  REFERENCES ARTISTS (PERS_ID) ;


ALTER TABLE STARRING
  ADD CONSTRAINT FK_MOVIE_STARRING
      FOREIGN KEY (MOVIE_ID)
  REFERENCES MOVIES (MOVIE_ID) ;


ALTER TABLE STARRING
  ADD CONSTRAINT FK_STARRING_PERSON
      FOREIGN KEY (PERS_ID)
  REFERENCES ARTISTS (PERS_ID) ;

ALTER TABLE MOVIE_THEATER
  ADD CONSTRAINT FK_CINEMA_MOVIE_THEATER
      FOREIGN KEY (CINE_ID)
  REFERENCES CINEMA (CINE_ID) ;

ALTER TABLE PLAY
  ADD CONSTRAINT FK_CINE_THEATER_PLAY
      FOREIGN KEY (CINE_ID, MOV_THR_ID)
  REFERENCES MOVIE_THEATER (MOV_THR_ID,CINE_ID) ;

ALTER TABLE PLAY
  ADD CONSTRAINT FK_PLAY_MOVIE
      FOREIGN KEY (MOVIE_ID)
  REFERENCES MOVIES (MOVIE_ID) ;

ALTER TABLE REVIEWS
  ADD CONSTRAINT FK_REVIEW_MOVIE
      FOREIGN KEY (MOVIE_ID)
  REFERENCES MOVIES (MOVIE_ID) ;

ALTER TABLE REVIEWS
  ADD CONSTRAINT FK_REVIEW_REVIEW_AGGREGATOR
      FOREIGN KEY (REVIEW_AGGREGATOR_ID)
  REFERENCES REVIEW_AGGREGATOR (REVIEW_AGGREGATOR_ID) ;
  
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (1,'Nikita','action thriller',DATE '1990-02-21',117,39000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (2,'The Fifth Element','science-fiction action', DATE '1997-05-07',126,90000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (3,'Maverick','western comedy',DATE '1994-05-20',127,750000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (4,'Space Cowboys','space drama',DATE '2000-08-01',130,60000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (5,'Where Eagles Dare','WWII action',DATE '1968-12-04',155,77000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (6,'Doctor Zhivago','epic romantic drama',DATE '1965-12-22',193,11000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (7,'Star Wars','epic space opera',DATE '1977-05-25',121,11000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (8,'The Empire Strikes Back','epic space opera',DATE '1980-05-17',124,18000000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (9,'Return of the Jedi','epic space opera',DATE '1983-05-25',132,32500000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (10,'A Fistful of Dollars',NULL,DATE '1964-09-01',100,200000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (11,'For a Few Dollars More',NULL,DATE '1965-12-30',132,600000);
INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (12,'The Good, the Bad and the Ugly',NULL,DATE '1967-12-23',177,1200000);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);
-- INSERT INTO MOVIES (MOVIE_ID, TITLE, GENDER, RELEASE_DATE, RUNNING_TIME, BUDGET) VALUES (,'','','',,);


-- DATA TABLE ARTISTS


INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (1,'Luc','Besson',DATE '1959-03-18',NULL,'France');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (2,'Anne','Parillaud',DATE '1960-05-06',NULL,'France');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (3,'Jean-Hugues','Anglade',DATE '1955-07-29',NULL,'France');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (4,'Tchéky','Karyo',DATE '1953-10-04',NULL,'France');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (5,'Jeanne','Moreau',DATE '1928-01-23',DATE '2017-07-31','France');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (6,'Bruce','Willis',DATE '1955-03-19',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (7,'Gary','Oldman',DATE '1958-03-21',NULL,'UK');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (8,'Milla','Jovovich',DATE '1995-12-17',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (9,'Richard','Donner',DATE '1930-04-24',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (10,'Mel','Gibson',DATE '1956-01-03',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (11,'Jodie','Foster',DATE '1962-11-19',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (12,'James','Garner',DATE '1928-04-07',DATE '2014-07-19','USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (13,'Graham','Greene',DATE '1952-06-22',NULL,'Canada');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (14,'James','Coburn',DATE '1928-08-31',DATE'2002-11-18','USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (15,'Clint','Eastwood',DATE '1930-05-31',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (16,'Tommy','Lee Jones',DATE '1946-09-15',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (17,'Donald','Sutherland',DATE '1935-07-17',NULL,'Canada');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (18,'Richard','Burton',DATE '1925-11-10',DATE'1984-08-05','Wales');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (19,'Mary','Ure',DATE '1933-02-18',DATE'1975-04-03','Scottland');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (20,'Ingrid','Pitt',DATE '1937-11-21','2010-11-23','UK');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (21,'Omar','Sharif',DATE '1932-04-10','2015-07-10','Egypt');
INSERT INTO ARTITST (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (22,'David','Lean',DATE '1908-03-25','1991-04-16','UK');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (23,'Alec','Guinness',DATE '1914-04-02','2000-08-05','UK');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (24,'Julie','Christie',DATE '1940-04-14',NULL,'UK');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (25,'Geraldine','Chaplin',DATE '1944-07-31',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (26,'Rod','Steiger',DATE '1925-04-14','2002-07-09','USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (27,'Mark','Hamill',DATE '1951-09-25',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (28,'Harrison','Ford',DATE '1942-07-13',NULL,'USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (29,'Carrie','Fisher',DATE '1956-10-21','2016-12-27','USA');
INSERT INTO ARTISTS (PERS_ID, FIRSTNAME, LASTNAME, BIRTHDATE, DEATH_DATE, COUNTRY) VALUES (30,'George','Lucas',DATE '1944-05-14',NULL,'USA');


-- DATA TABLE DIRECTED_BY

INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (1,1);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (2,1);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (3,9);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (4,15);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (5,15);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (6,22);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (7,30);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (8,30);
INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (9,30);
-- INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (,);
-- INSERT INTO DIRECTED_BY (MOVIE_ID, PERS_ID) VALUES (,),


-- DATA TABLE STARRING

INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (1,1);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (2,1);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (3,1);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (4,1);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (5,1);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (6,2);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (7,2);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (8,2);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (10,3);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (11,3);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (12,3);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (13,3);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (14,3);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (15,4);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (16,4);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (17,4);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (12,4);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (15,5);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (18,5);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (19,5);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (20,5);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (20,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (21,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (22,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (23,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (24,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (25,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (26,6);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (23,7);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (23,8);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (23,9);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (27,7);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (28,7);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (29,7);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (27,8);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (28,8);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (29,8);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (27,9);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (28,9);
INSERT INTO STARRING (PERS_ID, MOVIE_ID) VALUES (29,9);



-- DATA TABLE CINEMA

INSERT INTO CINEMA (CINE_ID, NAME, PHONE, COMPANY) VALUES (1,'CINE ROUEN','09 75 34 56 39','MK2');
INSERT INTO CINEMA (CINE_ID, NAME, PHONE, COMPANY) VALUES (2,'CINE GRAND-QUE','09 75 46 58 49','GAUMONT');
INSERT INTO CINEMA (CINE_ID, NAME, PHONE, COMPANY) VALUES (3,'LE PROJECTEUR','09 93 24 56 78','INDEPENDANT');
INSERT INTO CINEMA (CINE_ID, NAME, PHONE, COMPANY) VALUES (4,'OMNIUM','09 35 47 89 30','INDEPENDANT');
INSERT INTO CINEMA (CINE_ID, NAME, PHONE, COMPANY) VALUES (5,'CINE SAINT-SEVER','09 34 25 60 49','PATHE');


-- DATA TABLE MOVIE_THEATER

INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (1,1,1,500);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (2,1,2,500);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (3,1,3,400);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (1,2,1,400);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (2,2,2,500);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (3,2,2,200);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (4,2,2,300);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (1,3,1,200);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (1,4,1,250);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (1,5,1,300);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (2,5,2,400);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (3,5,2,500);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (4,5,3,500);
INSERT INTO MOVIE_THEATER (MOV_THR_ID, CINE_ID, SCREEN_SIZE, CAPACITY) VALUES (5,5,3,600);


-- DATA TABLE PLAY

INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (1,1,1,DATE '070-12-16',DATE '2017-12-19');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (1,2,2,DATE '2017-12-06',DATE '2017-12-26');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (1,3,3,DATE '2017-12-13',DATE '2017-12-26');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (2,1,4,DATE '2017-12-13',DATE '2018-01-02');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (2,2,5,DATE '2017-12-20',DATE '2017-12-26');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (3,1,6,DATE '2017-12-06',DATE '2018-12-12');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (5,1,7,DATE '2017-12-06',DATE '2018-01-02');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (5,2,8,DATE '017-12-13',DATE '2017-12-19');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (5,3,9,DATE '2017-12-27',DATE '2018-01-09');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (4,1,1,DATE'2018-01-03',DATE '2018-01-09');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (3,1,2,DATE '2018-01-10',DATE '2018-01-06');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (2,2,3,DATE '2018-01-03',DATE '2018-01-16');
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (3,1,7,DATE '2017-12-06',DATE '2018-01-02');

-- DATA TABLE EVIEW_AGGREGATOR

INSERT INTO REVIEW_AGGREGATOR (REVIEW_AGGREGATOR_ID, NAME) VALUES (1,'Rotten Tomatoes');
INSERT INTO REVIEW_AGGREGATOR (REVIEW_AGGREGATOR_ID, NAME) VALUES (2,'Metacritic');


-- DATA TABLE REVIEWS

INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (1,1,56,14);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (1,2,88,46);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (2,1,72,61);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (2,2,52,22);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (3,1,67,52);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (4,1,78,119);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (7,1,93,104);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (7,2,92,14);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (8,1,94,87);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (9,1,80,84);
INSERT INTO REVIEWS (MOVIE_ID, REVIEW_AGGREGATOR_ID, SCORE_PCT, CRITIC_NUMBER) VALUES (9,2,53,15);
/// PL SQL
1)

CREATE OR REPLACE PROCEDURE newScreening(IDMovThr IN NUMBER, idCIN IN NUMBER, idMOV IN NUMBER, DateDeb IN DATE, DateFin IN DATE) IS
BEGIN
INSERT INTO PLAY (MOV_THR_ID, CINE_ID, MOVIE_ID, START_DATE, END_DATE) VALUES (IDMovThr, idCIN, idMOV, DateDeb, DateFin);
END;

BEGIN
newScreening(5,4,9,DATE '2017-02-06',DATE '2018-04-02');
end;

select * from PLAY where MOV_THR_ID = 5 AND CINE_ID=4 AND MOVIE_ID=9;

2)
CREATE OR REPLACE PROCEDURE SetScreening(IDMovThr IN NUMBER, idCIN IN NUMBER, idMOV IN NUMBER) IS
BEGIN
UPDATE PLAY
SET EXTRACT(Day FROM END_DATE)=EXTRACT(Day FROM END_DATE)+7
WHERE MOV_THR_ID=IDMovThr AND CINE_ID=idCIN AND MOVIE_ID=idMOV;
END;

3)

CREATE OR REPLACE PROCEDURE getScreening(idCIN IN NUMBER, idMOV IN NUMBER) IS
pas_connu EXCEPTION;
starD DATE;
endD DATE;
BEGIN

select START_DATE, END_DATE INTO starD, endD from PLAY where CINE_ID=idCIN AND MOVIE_ID=idMOV;
IF starD=NULL OR endD =NULL THEN 
    RAISE pas_connu;
END IF;
EXCEPTION 
   WHEN pas_connu THEN
        DBMS_OUTPUT.PUT_LINE('Ce cinema ou ce film nexiste pas ');

END;

4)

CREATE OR REPLACE PROCEDURE searchScreeningDate(idCIN IN NUMBER, idMOV IN NUMBER, StaD IN DATE) IS
idC NUMBER;
idM NUMBER;
starD DATE;
BEGIN
select START_DATE,CINE_ID, MOVIE_ID INTO starD, idC, idM from PLAY where CINE_ID=idCIN AND MOVIE_ID=idMOV AND START_DATE= StaD;
IF starD=NULL AND idC =NULL AND idM =NULL THEN 
     DBMS_OUTPUT.PUT_LINE('La seance nexiste pas ');
ELSE  
     DBMS_OUTPUT.PUT_LINE('La seance existe ');
END IF;
END;

select AVG(MOV_THR_ID) from PLAY where MOVIE_ID=1 group by CINE_ID;


5)
CREATE or replace package pkScreening as
FUNCTION screeningAvg(idMOV IN NUMBER) RETURN float;
end pkScreening;
/
CREATE OR REPLACE PACKAGE body pkScreening IS
FUNCTION screeningAvg(idMOV IN NUMBER) RETURN float IS
idM float;
BEGIN
select AVG(MOV_THR_ID) INTO  idM from PLAY where MOVIE_ID=idMOV group by CINE_ID;
END screeningAvg;
END pkScreening;

