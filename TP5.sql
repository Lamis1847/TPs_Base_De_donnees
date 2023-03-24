
CREATE OR REPLACE TYPE adresse_type AS OBJECT  (   
   num_rue NUMBER,  
   nom VARCHAR(30),  
   nom_ville VARCHAR(20) 
);

CREATE OR REPLACE TYPE personne_type AS OBJECT  (   
   num_personne NUMBER,
   nom VARCHAR(30),  
   prenom VARCHAR(30),
   type_personne CHAR(1) 
); 




CREATE OR REPLACE TYPE cours_type AS OBJECT  (   
   num_cours NUMBER,  
   nom VARCHAR(30),  
   nbheures NUMBER, 
   annee VARCHAR(5) 
);


CREATE OR REPLACE TYPE activites_type AS OBJECT  (   
   nom VARCHAR(30),  
   niveau NUMBER, 
   equipe VARCHAR(30) 
);




CREATE TABLE nom_personnes OF personne_type
(primary key (num_personne));

CREATE TABLE nom_activites OF activites_type
(primary key (nom));

CREATE TABLE nom_cours OF cours_type
(primary key (num_cours));

INSERT INTO nom_personnes VALUES (1,'Dupont', 'Pierre', null);

INSERT INTO nom_personnes VALUES (2,'Henri', 'Jacques', null);

INSERT INTO nom_activites VALUES ('Basket', 1, 'tigers');

INSERT INTO nom_activites VALUES ('Natation', 2, 'lions');

INSERT INTO nom_cours VALUES (1, 'Algo', 16, 'L3');

INSERT INTO nom_cours VALUES (2, 'SGBD', 17, 'M1');

INSERT INTO nom_cours VALUES (3, 'Admin sys', 25, 'M1');

INSERT INTO nom_cours VALUES (4, 'Langages web', 26, 'M1');
select * from USER_TABLES;

select * from USER_OBJECTS_TABLES;

select * from nom_cours;

select count(equipe) from nom_activites group by(nom);

select count(equipe), nom from nom_activites group by(nom);



select * from nom_cours where nbheures >=25;

INSERT INTO nom_activites VALUES ('ski', 1, 'Ace Club');

INSERT INTO nom_activites VALUES ('Volley ball', 3, 'Avs80');



ALTER TYPE personne_type NOT FINAL CASCADE;


CREATE OR REPLACE TYPE professeur_type under personne_type (   
   specialite VARCHAR(30),  
   date_entree Date,  
   der_prom VARCHAR(20),
   salaire_base NUMBER, 
   salaire_actuel NUMBER
)
INSTANTIABLE 
FINAL;

CREATE OR REPLACE TYPE eleve_type under personne_type (   
   date_naissance Date,  
   poids VARCHAR(20),
   annee NUMBER, 
   adresse adresse_type
)
INSTANTIABLE 
FINAL;


CREATE TABLE nom_eleves OF eleve_type;

CREATE TABLE nom_professeurs OF professeur_type;

Alter TABLE nom_personnes
add constraint CK_Type CHECK (type_personne IN ('E', 'P'))

CREATE OR REPLACE TRIGGER create_personne 
AFTER INSERT ON nom_personnes 
FOR EACH ROW
BEGIN
IF NEW.type_personne = 'P' THEN 
INSERT INTO nom_professeurs(num_personne) VALUES (NEW.num_personne);
ELSEIF NEW.type_personne = 'E' THEN
INSERT INTO nom_eleves(num_personne) VALUES (NEW.num_personne);
ELSE 
raise_application_error(-20100,'la personne doit etre soit un élève soit un professeur');
END IF;
END;


insert into nom_eleves values (1  , 'Brisefer' , 'Benoit' , 'E',  DATE '78-12-10' , 75 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (2  , 'Genial'   , 'Olivier' , 'E', DATE '78-04-10' , 60 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan') );
insert into nom_eleves values (3  , 'Jourdan'  , 'Gil'     , 'E', DATE '74-06-28' , 72 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (4  , 'Spring'   , 'Jerry'   , 'E', DATE '74-02-16' , 78 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (5  , 'Tsuno'    , 'Yoko'    , 'E', DATE '77-10-29' , 65 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (6  , 'Lebut'    , 'Marc'    , 'E', DATE '74-04-29' , 75 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (7  , 'Lagaffe'  , 'Gaston'  , 'E', DATE '75-04-08' , 61 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (8  , 'Dubois'   , 'Robin'   , 'E', DATE '76-04-20' , 60 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (9  , 'Walthery' , 'Natacha' , 'E', DATE '77-09-07' , 59 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));
insert into nom_eleves values (10 , 'Danny'    , 'Buck'    , 'E', DATE '73-02-15' , 82 ,    2022, adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'));


insert into nom_professeurs values (1 , 'Bottle'       , 'poesie' , 'P', 'web', DATE '70-10-01' , NULL , 20000 , 26000 );
insert into nom_professeurs values (2 , 'Bolenov'      , 'reseau' , 'P','OGL', DATE '68-11-15' , NULL , 19000 , 24680 );
insert into nom_professeurs values (3 , 'Tonilaclasse' , 'poo'    , 'P','analyse', DATE '79-10-01' ,NULL, 19000 , 23600 );
insert into nom_professeurs values (4 , 'Pastecnov'    , 'sql'    , 'P','sys', DATE '75-10-01' ,  NULL , 25000 , 25000 );
insert into nom_professeurs values (5 , 'Selector'     , 'sql'    , 'P','algo', DATE '82-10-15' , NULL , 19000 , 19000 );
insert into nom_professeurs values (6 , 'Vilplusplus'  , 'poo'    , 'P','web', DATE '90-04-25' , NULL , 19000 , 22000 );
insert into nom_professeurs values (7 , 'Francesca'    ,  NULL    , 'P', 'algo',DATE '75-10-01' , NULL , 20000 , 32000 );
insert into nom_professeurs values (8 , 'Pucette'      , 'sql'    , 'P', 'calculabilite',DATE '88-12-06' , NULL , 20000 , 25000 );

select * from nom_professeurs;




//COLLECTIONS

create type courss_type as varray(5) of cours_type;

CREATE OR REPLACE TYPE UE_type AS OBJECT  (   
   nom VARCHAR(30),  
   cours courss_type
);


CREATE TABLE nom_UE OF UE_type;


INSERT INTO nom_UE VALUES ('BDD', courss_type(cours_type(1, 'BDD', 16, '2022'),
cours_type('2', 'ALGO', 17, '2022'),
cours_type('3', 'SY', 18, '2022'),
cours_type('4', 'OGL', 20, '2022'),
cours_type('5', 'BWEB', 16, '2022')

));

CREATE type type_resultat as object (
lib_cours VARCHAR(30),
points NUMBER
);



create type resultatType as table of type_resultat;
CREATE OR REPLACE TYPE eleve_type under personne_type (   
   date_naissance Date,  
   poids VARCHAR(20),
   annee NUMBER, 
   adresse adresse_type,
   resultat resultatType
)
INSTANTIABLE 
FINAL;


CREATE TABLE nom_eleves OF eleve_type
nested table resultat store as tabres;

insert INTO nom_eleves values(1, 'Brisefer' , 'Benoit' , 'E',  DATE '78-12-10' , '75kg' , 2000, 
adresse_type(85, 'maréchal leclerc', 'ecouen'), resultatType(type_resultat('bdd', 15)));

insert INTO nom_eleves values(2, 'Genial'   , 'Olivier' , 'E',  DATE '78-11-10' , '74kg' , 1999, 
adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'), resultatType(type_resultat('bdd', 14)));

insert INTO nom_eleves values(3, 'Jourdan'  , 'Gil' , 'E',  DATE '78-10-10' , '73g' , 1998, 
adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'), resultatType(type_resultat('bdd', 10)));

insert INTO nom_eleves values(4, 'Spring'   , 'Jerry' , 'E',  DATE '78-09-10' , '80kg' , 2001, 
adresse_type(85, 'maréchal leclerc', 'ecouen'), resultatType(type_resultat('bdd', 13)));

insert INTO nom_eleves values(5, 'Tsuno'    , 'Yoko' , 'E',  DATE '78-08-10' , '81kg' , 2000, 
adresse_type(85, 'maréchal leclerc', 'ecouen'), resultatType(type_resultat('bdd', 12)));

insert INTO nom_eleves values(6, 'Lebut', 'Marc' , 'E',  DATE '78-07-10' , '90kg' , 1999, 
adresse_type(15, 'Boulevard siegfried', 'mont saint aignan'), resultatType(type_resultat('bdd', 9)));

insert INTO nom_eleves values(7, 'Lagaffe'  , 'Gaston' , 'E',  DATE '78-06-10' , '71kg' , 1999, 
adresse_type(95, 'bruno mars', 'paris'), resultatType(type_resultat('bdd', 8)));

insert INTO nom_eleves values(8, 'Dubois'   , 'Robin' , 'E',  DATE '78-05-10' , '70kg' , 2001, 
adresse_type(75, 'franqueville', 'rouen'), resultatType(type_resultat('bdd', 10)));

insert INTO nom_eleves values(9, 'Walthery' , 'Natacha' , 'E',  DATE '78-04-10' , '82kg' , 2000, 
adresse_type(85, 'maréchal leclerc', 'ecouen'), resultatType(type_resultat('bdd', 16)));

insert INTO nom_eleves values(10, 'Danny'    , 'Buck' , 'E',  DATE '78-03-10' , '83kg' , 1997, 
adresse_type(85, 'maréchal leclerc', 'ecouen'), resultatType(type_resultat('bdd', 13)));

update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 13), type_resultat('service web', 14), 
type_resultat('analyse', 14))
where num_personne = 1;

update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 14), type_resultat('service web', 11), 
 type_resultat('analyse', 15))
where num_personne = 2;

update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 10), type_resultat('service web', 10), 
 type_resultat('analyse', 10))
where num_personne = 3;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 13), type_resultat('service web', 9), 
 type_resultat('analyse', 12))
where num_personne = 4;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 12), type_resultat('service web', 10), 
 type_resultat('analyse', 9))
where num_personne = 5;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 9), type_resultat('service web', 7), 
 type_resultat('analyse', 8))
where num_personne = 6;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 8), type_resultat('service web', 13), 
 type_resultat('analyse', 7))
where num_personne = 7;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 10), type_resultat('service web', 18), 
 type_resultat('analyse', 10))
where num_personne = 8;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 16), type_resultat('service web', 5), 
 type_resultat('analyse', 16))
where num_personne = 9;
update nom_eleves 
set resultat =  resultatType(type_resultat('bdd', 13), type_resultat('service web', 17), 
 type_resultat('analyse', 9))
where num_personne = 10;


SELECT * FROM THE (SELECT dt.resultat FROM nom_eleves dt WHERE dt.resultat.points >= 10 AND dt.resultat.lib_cours='analyse') sel;


select * from tabres e where e.points >=10 AND e.lib_cours ='analyse';