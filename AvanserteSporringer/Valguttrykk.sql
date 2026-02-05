CREATE TABLE Vare (
    VNr INT PRIMARY KEY,
    Betegnelse VARCHAR(50),
    Pris DECIMAL(9,2)
);

ALTER TABLE Vare
    ADD Katnr INT;

TRUNCATE TABLE Vare;

insert into Vare values(22054, 'Vannkanne, 5ltr.', 70.50, 110);
insert into Vare values(22179, 'Hafa gresklipper G9, elektisk', 1440.00, 112);
insert into Vare values(25079, 'Trillebår', 334.00, 110);
insert into Vare values(32067, 'Juwa Hagerive, 14 rette tinder', 94.50, 112);

SELECT VNr, Betegnelse, Pris,
       case when Pris < 100 then 'Billig'
       when Pris <= 500 then 'Middels'
       else 'Dyr'
       end as PRISKLASSE
       from Vare;