create table maladies( 
id VARCHAR(50), 
libelle VARCHAR(100),
PRIMARY KEY(id) 
);


INSERT INTO maladies VALUES ('C01', 'infections bactériennes et mycoses');

INSERT INTO maladies VALUES ('C01.252', 'infections bactériennes');

INSERT INTO maladies VALUES ('C01.252.100', 'bactériémie');

INSERT INTO maladies VALUES ('C01.252.100.375', 'septicémie hémorragique');

INSERT INTO maladies VALUES ('C01.252.200', 'infections bactériennes du système nerveux central');

INSERT INTO maladies VALUES ('C01.252.200.100', 'abcès cérébral');

INSERT INTO maladies VALUES ('C01.252.200.200', 'empyème subdural');

INSERT INTO maladies VALUES ('C01.252.200.250', 'abcès épidural');

INSERT INTO maladies VALUES ('C01.252.200.450', 'neuroborréliose de lyme');

INSERT INTO maladies VALUES ('C01.252.200.500', 'méningite bactérienne');

INSERT INTO maladies VALUES ('C01.252.200.500.400', 'méningite à escherichia coli');

INSERT INTO maladies VALUES ('C01.252.200.500.450', 'méningite à hémophilus');

INSERT INTO maladies VALUES ('C01.252.200.500.500', 'méningite à listeria');

INSERT INTO maladies VALUES ('C01.252.200.500.550', 'méningite à méningocoques');

INSERT INTO maladies VALUES ('C01.252.200.500.550.800', 'syndrome de Waterhouse-Friderichsen');

INSERT INTO maladies VALUES ('C01.252.200.500.600', 'méningite à pneumocoques');

INSERT INTO maladies VALUES ('C01.252.200.500.800', 'méningite tuberculeuse');

INSERT INTO maladies VALUES ('C01.252.200.750', 'neurosyphilis');

INSERT INTO maladies VALUES ('C01.252.300', 'endocardite bactérienne');

INSERT INTO maladies VALUES ('C01.252.300.407', 'endocardite bactérienne subaigüe');

INSERT INTO maladies VALUES ('C01.252.354', 'infections bactériennes de l''oeil');

INSERT INTO maladies VALUES ('C01.252.354.225', 'conjonctivite bactérienne');

INSERT INTO maladies VALUES ('C01.252.354.225.250', 'conjonctivite à inclusions');

INSERT INTO maladies VALUES ('C01.252.354.225.625', 'conjonctivite du nouveau-né');

INSERT INTO maladies VALUES ('C01.252.354.225.800', 'trachome');

INSERT INTO maladies VALUES ('C01.252.354.400', 'orgelet');

INSERT INTO maladies VALUES ('C01.252.354.450', 'kératoconjonctivite infectieuse');

INSERT INTO maladies VALUES ('C01.252.354.800', 'tuberculose oculaire');

INSERT INTO maladies VALUES ('C01.252.354.900', 'uvéite purulente');

INSERT INTO maladies VALUES ('C01.252.354.900.675', 'panophtalmie');

INSERT INTO maladies VALUES ('C02', 'maladies virales');

INSERT INTO maladies VALUES ('C02.081', 'infections à arbovirus');

INSERT INTO maladies VALUES ('C02.081.030', 'peste équine');

INSERT INTO maladies VALUES ('C02.081.125', 'fièvre catarrhale du mouton');

INSERT INTO maladies VALUES ('C02.081.270', 'dengue');

INSERT INTO maladies VALUES ('C02.081.270.200', 'dengue hémorragique');

INSERT INTO maladies VALUES ('C02.081.343', 'encéphalite à arbovirus');

INSERT INTO maladies VALUES ('C02.081.343.340', 'encéphalite de californie');

INSERT INTO maladies VALUES ('C02.081.343.345', 'encéphalite japonaise');

INSERT INTO maladies VALUES ('C02.081.343.350', 'encéphalite de Saint-Louis');

INSERT INTO maladies VALUES ('C02.081.343.360', 'encéphalites à tiques');

INSERT INTO maladies VALUES ('C02.081.343.950', 'fièvre à virus west nile');

INSERT INTO maladies VALUES ('C02.081.355', 'encéphalomyélite équine');

INSERT INTO maladies VALUES ('C02.081.355.177', 'encéphalomyélite équine de lEst');

insert into maladies values ( 'C02.081.355.355','encéphalomyélite équine du vénézuéla ');

insert into maladies values ( 'C02.081.355.677','encéphalomyélite équine de lOuest');

insert into maladies values ( 'C02.081.700 ','fièvre à phlébotomes ');

insert into maladies values ( 'C02.081.810','fièvre de la vallée du rift ');

insert into maladies values ( 'C02.081.885','smaladies transmises par les tiques');

insert into maladies values ( 'C02.081.885.125','peste porcine africaine ');

insert into maladies values ( 'C02.081.885.200','fièvre à tiques du colorado');

insert into maladies values ( 'C02.081.885.400','encéphalites à tiques');

insert into maladies values ( 'C02.081.885.430','fièvre hémorragique de Crimée-Congo');

insert into maladies values ( 'C02.081.885.440','fièvre hémorragique dOmsk');

insert into maladies values ( 'C02.081.885.475','s maladie de la forêt kyasanur');

insert into maladies values ( 'C02.081.885.550','maladie de nairobi ');

insert into maladies values ( 'C02.081.980','fièvre jaune ');

insert into maladies values ( 'C02.109 ','bronchiolite virale ');

insert into maladies values ( 'C02.182','maladies virales du système nerveux central');

insert into maladies values ( 'C02.182.500','encéphalite');

insert into maladies values ( 'C02.182.500.300','encéphalite virale ');

insert into maladies values ( 'C02.182.500.300.300','encéphalite à arbovirus');

insert into maladies values ( 'C02.182.500.300.300.200','encéphalite de californie');

insert into maladies values ( 'C02.182.500.300.300.250','encéphalite japonaise');

insert into maladies values ( 'C02.182.500.300.300.300 ','encéphalite de Saint-Louis');

insert into maladies values ( 'C02.182.500.300.300.350','encéphalites à tiques');

insert into maladies values ( 'C02.182.500.300.300.850','fièvre à virus west nile');

insert into maladies values ( 'C02.182.500.300.350','encéphalite à herpès simplex ');


select m.id, m.libelle from maladies m where m.id like(m.id||'%') order by m.id ASC;

select m.id, m.libelle from maladies m where m.id like('C02.182.500.300.300.%');

select m.id, m.libelle from maladies m where m.id like('C02.%') order by m.id ASC;

select m.id, m.libelle from maladies m where m.id like('C01.252.200.500.550%') order by m.id ASC;


select m.id, m.libelle from maladies m where m.libelle = 'infections bactériennes et mycoses' and m.id IN (
select count(
);


//////// EXO2

CREATE TABLE DEPT
   (DEPTNO NUMBER(2) PRIMARY KEY,
     DNAME VARCHAR2(25),
     DLOC  VARCHAR2(15)
   );
                                       
INSERT INTO DEPT VALUES (10 , 'ACCOUNTING' , 'NEW YORK');                                              
INSERT INTO DEPT VALUES (20 , 'RESEARCH'   , 'DALLAS' );                                             
INSERT INTO DEPT VALUES (30 , 'SALES'      , 'CHICAGO');                                            
INSERT INTO DEPT VALUES (40 , 'OPERATIONS' , 'BOSTON' );   

CREATE TABLE EMP
   ( EMPNO NUMBER(4) CONSTRAINT EMP_PK PRIMARY KEY,
     ENAME VARCHAR2(25),
     JOB   VARCHAR2(15),
     MGR   NUMBER(4),
     HIREDATE DATE,
     SAL   NUMBER(7),
     COMM  NUMBER(6,2),
     DEPTNO NUMBER(2)
   );

INSERT INTO EMP VALUES (  7369 ,'SMITH'  ,'CLERK'    , 7902 , DATE '80-12-17' , 800 , NULL,20);  
INSERT INTO EMP VALUES (  7499 ,'ALLEN'  ,'SALESMAN' , 7698 ,DATE '81-02-21' ,1600 , 300 ,30);  
INSERT INTO EMP VALUES (  7521 ,'WARD'   ,'SALESMAN' , 7698 ,DATE '81-02-22' ,1250 , 500 ,30);  
INSERT INTO EMP VALUES (  7566 ,'JONES'  ,'MANAGER'  , 7839 ,DATE '81-04-02' ,2975 , NULL,20);  
INSERT INTO EMP VALUES (  7654 ,'MARTIN' ,'SALESMAN' , 7698 ,DATE '81-09-28' ,1250 ,1400 ,30);  
INSERT INTO EMP VALUES (  7698 ,'BLAKE'  ,'MANAGER'  , 7839 ,DATE '81-05-01' ,2850 , NULL,30);  
INSERT INTO EMP VALUES (  7782 ,'CLARK'  ,'MANAGER'  , 7839 ,DATE '81-06-09' ,2450 , NULL,10);  
INSERT INTO EMP VALUES (  7788 ,'SCOTT'  ,'ANALYST'  , 7566 ,DATE '87-04-19' ,3000 , NULL,20);  
INSERT INTO EMP VALUES (  7839 ,'KING'   ,'PRESIDENT', NULL ,DATE '81-11-17' ,5000 , NULL,10);  
INSERT INTO EMP VALUES (  7844 ,'TURNER' ,'SALESMAN' , 7698 ,DATE '81-09-08' ,1500 , 0   ,30);  
INSERT INTO EMP VALUES (  7876 ,'ADAMS'  ,'CLERK'    , 7788 ,DATE '87-05-23' ,1100 , NULL,20);  
INSERT INTO EMP VALUES (  7900 ,'JAMES'  ,'CLERK'    , 7698 ,DATE '81-12-03' , 950 , NULL,30);  
INSERT INTO EMP VALUES (  7902 ,'FORD'   ,'ANALYST'  , 7566 ,DATE '81-12-03' ,3000 , NULL,20);  
INSERT INTO EMP VALUES (  7934 ,'MILLER' ,'CLERK'    , 7782 ,DATE '82-01-23' ,1300 , NULL,10);  

ALTER TABLE EMP ADD CONSTRAINT EMP_MGR_FK FOREIGN KEY(MGR) REFERENCES EMP(EMPNO) ON DELETE SET NULL;
ALTER TABLE EMP ADD CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO) ON DELETE CASCADE;

///// REQUETES 


select e.EMPNO, e.ENAME, e.MGR from EMP e INNER JOIN EMP e2 ON e.EMPNO=e2.MGR START WITH e.MGR IS NULL CONNECT BY PRIOR e.EMPNO=e.MGR;


////// recursivité oracle

select  e.ENAME, e.EMPNO, e.MGR, e.job FROM EMP e start with e.ENAME = 'BLAKE' 
CONNECT BY PRIOR e.MGR = e.EMPNO;

select e.ENAME, e.EMPNO from EMP e where e.MGR =7698;
// 2EME MANIERE POUR FAIRE LA REQUETE

SELECT LEVEL, ENAME FROM EMP
WHERE ENAME <> 'BLAKE'
CONNECT BY MGR = PRIOR EMPNO
START WITH ENAME = 'BLAKE'
ORDER BY LEVEL; 


SELECT LEVEL, EMPNO, ENAME, JOB, MGR FROM EMP
CONNECT BY MGR = PRIOR EMPNO
START WITH MGR IS NULL
ORDER BY LEVEL; 

SELECT LEVEL, EMPNO, ENAME, JOB, MGR FROM EMP WHERE ENAME <> 'SCOTT'
CONNECT BY MGR = PRIOR EMPNO
START WITH MGR IS NULL
ORDER BY LEVEL; 

SELECT LEVEL, EMPNO, ENAME, JOB, MGR FROM EMP WHERE ENAME <> 'SCOTT'
CONNECT BY MGR = PRIOR EMPNO AND ENAME <> 'SCOTT'
START WITH MGR IS NULL
ORDER BY LEVEL; 

SELECT ENAME,SAL, DEPTNO  FROM EMP
WHERE ENAME <> 'JONES'
CONNECT BY MGR = PRIOR EMPNO
START WITH ENAME = 'JONES';

select  e.ENAME, e.EMPNO FROM EMP e 
WHERE e.ENAME <> 'ADAMS'
CONNECT BY PRIOR e.MGR = e.EMPNO
start with e.ENAME = 'ADAMS';

SELECT LEVEL, count(EMPNO) personnes FROM EMP
CONNECT BY MGR = PRIOR EMPNO
START WITH MGR IS NULL
group BY LEVEL; 

SELECT LEVEL, AVG(SAL) personnes FROM EMP
CONNECT BY MGR = PRIOR EMPNO
START WITH MGR IS NULL
group BY LEVEL; 


////// EXO3
create table PRODUITS
(
    NUMERO       number(3),
    NOM      varchar(15),
    QSTOCK      number (5),
    constraint PK_PRODUITS         primary key (NUMERO),
    constraint CK_QSTOCK_PRODUITS     check (QSTOCK >= 0)
);

create table NOMENCLATURE
(
    COMPOSER      number (3),
    COMPOSANT    number (3),
    QFABR           number (5),
    constraint    PK_NOMENCLATURE             primary key (COMPOSER, COMPOSANT),
    constraint    FK_NOMENCL_COMPOSER_PRODUITS  foreign key (COMPOSER) references PRODUITS,
    constraint    FK_NOMENCL_COMPOSANT_PRODUITS foreign key (COMPOSANT) references PRODUITS,
    constraint    CK_QFABR_NOMENCLATURE          check (QFABR >=0)
);

insert into PRODUITS (NUMERO, NOM, QSTOCK) values (1, 'VELO', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (2, 'ROUE', 10);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (3, 'GUIDON', 7);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (4, 'GARDE BOUE', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (5, 'CHAINE', 2);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (6, 'RAYON', 500);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (7, 'CHAMBRE_AIR', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (8, 'SELLE', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (9, 'TRICYCLE', 1);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (10, 'JANTE', 13);

insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 2, 2);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 3, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 4, 2);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 5, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 8, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 2, 3);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 3, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 4, 3);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (2, 6, 50);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (2, 10, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 7, 1);

////// REQUETES
select * from PRODUITS;

select  p.numero, p.nom, n.composer  from PRODUITS p, NOMENCLATURE n where p.numero = n.composant;
 
select  p.numero, p.nom, n.composer  from PRODUITS p, NOMENCLATURE n where p.numero = n.composant
AND n.composer = 2;



/////EXO4

create table PERSONNES
(
    NUMERO        number(7),
    NOM         varchar(15),
    PRENOM         varchar(15),
    DATENAISSANCE     varchar(20),
    DATEMORT     varchar(20),
    SEXE         char(1),    
    PERE         number(7),
    MERE         number(7),
    constraint PK_PERSONNES         primary key (NUMERO),
    constraint FK_PERSONNES_PERE_PERSONNES  foreign key(PERE) references PERSONNES,
    constraint FK_PERSONNES_MERE_PERSONNES  foreign key(MERE) references PERSONNES,
    constraint CK_SEXE_PERSONNES         check (SEXE in ('M', 'F'))
);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (0,'Midi-chloriens','', '', '', '');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (7,'Skywalker Lars','Shmi', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (9,'Naberri','Ruwee', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (10,'Naberri','', 'Jobal', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (5,'Skywalker','Anakin', '', '', 'M', 0, 7);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (6,'Naberri','Padme', '', '', 'F', 9, 10);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (11,'Naberri','Sola', '', '', 'F', 9, 10);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, MERE)
values (12,'Naberri','Ryoo', '', '', 'F', 11);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, MERE)
values (38,'Naberri','Pooja', '', '', 'F', 11);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (39,'Lars', 'Lef', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (1,'Skywalker','Like', '', '', 'M', 5, 6);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (2,'Organa','Leia', '', '', 'F', 5, 6);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (13,'Lars','Gredda', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (8,'Lars','Cliegg', '', '', 'M', 12, 13);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (14,'Lars','Aika', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (15,'Lars','Owen', '', '', 'M', 8, 14);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (16,'Whitesun Lars','Beru', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (17,'Lars','Edern', '', '', 'M', 12, 13);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (18,'Jade','Mara', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (19,'Skywalker','Ben', '', '', 'M', 1, 18);
insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (23,'Finn','FN-2187', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (24,'Rey','', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (25,'Chewbacca','', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (26,'Kenobi','Obi Wan', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (27,'Jinn','Qui-Gon', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (28,'Yoda','', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (29,'Dooku','Count', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (30,'Palpatine','Emperor', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (31,'Maul','Darth', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (32,'Snoke','Supreme Leader', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (33,'Organa','Bail', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (35,'Naberri','Winama', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (36,'Thule','Ryoo', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (40,'Antilles','Bail', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE)
values (34,'Organa','Brema', '', '', 'F', 38);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE)
values (37,'Antilles','Raymus', '', '', 'M', 38);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (41,'Solo','Jaina Sr', '', '', 'F');


insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (44,'Solo','Tira Gama', '', '', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (45,'Solo','Berethon', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE)
values (46,'Solo','Korol', '', '', 'M', 45);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE)
values (43,'Solo','Den', '', '', 'M', 46);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (47,'Solo','Tiion', '', '', 'F', 43, 44);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE)
values (48,'Sai','Randil Sai', '', '', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (49,'Sai-Solo','Thrackan', '', '', 'M', 48, 47);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (42,'Solo','Jonash', '', '', 'M', 43, 44);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (3,'Solo','Han', '', '', 'M', 42, 41);


insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (20,'Solo','Jaina', '', '', 'F', 3, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (21,'Solo','Jacen', '', '', 'M', 3, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (22,'Solo','Anakin', '', '', 'M', 3, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, DATEMORT, SEXE, PERE, MERE)
values (4,'Ren','Kylo', '', '','M', 3, 2);


/// requetes 

select p.NUMERO, p.NOM, p.PERE from PERSONNES p INNER JOIN PERSONNES p2 ON p.NUMERO=p2.PERE 
START WITH p.PERE IS NULL CONNECT BY PRIOR p.NUMERO=p.PERE;

select  p.NOM, p.NUMERO FROM PERSONNES p 
WHERE p.NOM <> 'Skywalker'
CONNECT BY PRIOR p.PERE = p.NUMERO
start with p.NOM = 'Skywalker';

select  p.NOM, p.NUMERO FROM PERSONNES p 
CONNECT BY PRIOR p.PERE = p.NUMERO
start with p.NOM = 'Skywalker';

select R2.NUMERO, R2.NOM
from PERSONNES R1, PERSONNES R2
where (R1.NUMERO=R2.NUMERO or R1.NUMERO=R2.PERE)
and R1.PERE is null;

SELECT LEVEL, NOM FROM PERSONNES
WHERE NOM <> 'Skywalker'
CONNECT BY PERE = PRIOR NUMERO
START WITH NOM = 'Skywalker'
ORDER BY LEVEL; 

select p.NUMERO, p.NOM, p.PERE from PERSONNES p where p.PERE IN (select PERE from PERSONNES 
WHERE NOM ='Solo') 
AND  p.MERE IN (select MERE from PERSONNES 
WHERE  NOM ='Solo') 


SELECT  NOM FROM PERSONNES
WHERE NOM <> 'Solo'
CONNECT BY PERE = PRIOR NUMERO
START WITH NOM = 'Solo'
ORDER SIBLINGS BY NUMERO; 

///

select p.NUMERO, p.NOM, p.PERE, p.MERE from PERSONNES p where p.PERE IN (select PERE from PERSONNES 
WHERE PERE IN (select PERE from PERSONNES WHERE NOM ='Solo'))
OR  p.MERE IN (select MERE from PERSONNES WHERE MERE IN (select MERE from PERSONNES WHERE NOM ='Solo')) 