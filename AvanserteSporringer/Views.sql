/*
    En view er en virtuell tabell
    Brukes for å:
     - Lagre spørringer i databasen
     - Bryte ned kompliserte spørringer
     - Forenkle databasen for ulike brukergrupper
     - Representasjonsuavhengighet
   */

/* Lager en view som finner stillingsbetegnelser */
CREATE VIEW StillingerIBruk AS SELECT DISTINCT  Stilling FROM ansatt0;

/* Skriver en spørring mot viewet */
SELECT COUNT(*) AS Antall FROM StillingerIBruk;

/* Lager en view som henter stillinger og gjennomsnittslønn */
CREATE VIEW GjLonnPrStilling AS SELECT Stilling, AVG("lØnn") AS Gjennomsnittslønn from ansatt0
    group by Stilling;

/* Spørringer mot view */
SELECT * FROM GjLonnPrStilling WHERE stilling = 'Sekretær';
SELECT * FROM GjLonnPrStilling order by Gjennomsnittslønn;


/* Oppdatering av tabeller med bruk av views */
CREATE VIEW AnsattLonn AS
    SELECT *
    FROM ansatt0
    WHERE "lØnn" < 1_000_000
    WITH CHECK OPTION;

/* New row violates check option for view "ansattlonn" */
UPDATE AnsattLonn
    SET "lØnn" = 1_200_000
    WHERE fornavn = 'Lise';

/*
    ALTER VIEW
    Views som bruker gruppering og mengdefunksjoner kan ikke endres
    Det kreves også at primærnøkkel må være med i viewen for at den skal kunne endres
 */





