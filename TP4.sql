create type qualif_type as object 
(qualif VARCHAR(20), 
tarif REAL);


create type Intervenant_type as object
(mat Number(10), nom VARCHAR2(20), prenom VARCHAR2(20), qualification qualif_type);

create type mission_type as object
(Code VARCHAR2(20), Intitule VARCHAR2(50),NB_jours NUMBER, intervenant Intervenant_type);

create table Intervenant of Intervenant_type(
primary key (mat)
);

create table mission of mission_type(
primary key (Code)
);

INSERT INTO intervenant VALUES (2516, 'Dupont', 'Pierre', qualif_type('Developpeur', 550));
INSERT INTO intervenant VALUES (7655, 'Henri', 'Jacques', qualif_type('Consultant', 990.90));
INSERT INTO intervenant VALUES (7687, 'Triolet', 'Elsa', qualif_type('Consultant', 1029.00));

INSERT INTO mission VALUES ('Varalpain033', 'Etude technique du passage de PEL en CEL', 54, Intervenant_type(7655, 'Henri', 'Jacques', qualif_type('Consultant', 990.90)))

INSERT INTO intervenant VALUES (1000, 'Philippe', 'Michelin', qualif_type('Directeur', 3000));



select * from intervenant where mat=1000;

INSERT INTO mission VALUES ('Armoni', 'Prise de contact avec le Directeur', 2, Intervenant_type(1000, 'Philippe', 'Michelin', qualif_type('Directeur', 3000)))

Describe mission;

select * from mission m;

SELECT Code, (NB_jours*m.intervenant.qualification.tarif) cout from mission m;

update mission
set NB_jours= NB_jours+1;

update mission m
set m.intervenant.qualification.tarif = 2800 where m.code = 'Armoni';

delete from mission m 
where m.intervenant.prenom='Michelin'

///////////// EXO2
create type missions_type as table of mission_type;

create type ProjetType as object (nom VARCHAR2(20),
dateDebut date,
dateFin date, lesMissions missions_type);

create table projet of ProjetType(
primary key(nom))
nested table lesMissions store as missionsTable;

insert into projet values ('CA1',Date '2099-12-12', Date '2011-07-13', missions_type(mission_type(
'SFG', ' Spécifications générales', 30, Intervenant_type(7655, 'Henri', 'Jacques', qualif_type('Consultant', 990.90))),
mission_type('SFD', ' Spécifications détaillées', 60, Intervenant_type(2516, 'Dupont', 'Pierre', qualif_type('Developpeur', 550)))
));


DESCRIBE projet;


select sel.* from THE (select p.lesMissions from projet p where p.nom='CA1') sel;

select sel.*, sel.intervenant.nom, sel.intervenant.qualification.qualif from THE (select p.lesMissions from projet p where p.nom='CA1') sel;


select p.nom, p.dateFin, sel.Code, sel.NB_jours, sel.intervenant.nom, sel.intervenant.qualification.qualif from THE (select p.lesMissions from projet p where p.nom='CA1') sel, 
projet p;

