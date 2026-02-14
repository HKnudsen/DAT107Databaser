/*
 En forening har behov for et system for å administrere medlemmer. Et medlem har
medlemsnummer, fornavn, etternavn, et telefonnummer, en epost-adresse, postnummer/sted,
gatenavn/husnummer, samt om personen fortsatt er medlem (ikke utmeldt).
Foreningen har også en rekke lokallag. Alle medlemmer er med i nøyaktig et lokallag. Lokallag har
lag-navn, person som er leder (som også er medlem), postnummer/sted, gatenavn/husnummer for
møtelokale.
 */

 CREATE TABLE Medlem (
     Mnr char(10),
     FNavn varchar(40),
     LNavn varchar(40),
     Tlf char(8),
     epost varchar(50),
     PostNr char(4),
     adresse varchar(60),
     foreign key (PostNr) references Post(Postnr),
 );

CREATE TABLE Post (
    Postnr char(4) primary key,
    Poststed varchar(15)
);

CREATE TABLE Lag (
    LagNr int primary key,
    LagNavn varchar(30),
    Leder char(10),
    Postnr char(4),
    Gatenavn varchar(30),
    foreign key (Leder) references Medlem(Mnr),
    foreign key (PostNr) references Post(Postnr)
)

CREATE TABLE Register (
    Mnr char(10),
    Aar int,
    Status boolean,
    primary key (Mnr, Aar)
);