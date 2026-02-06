 /* Finn alle ansatte som tjener mer enn gjennomsnittet */
 /* Her må delspørringen returnere en tabell med nøyaktig èn rad og èn kolonne for at det skal være gyldig */
SELECT * FROM ansatt0
    WHERE "lØnn" > (SELECT AVG("lØnn") FROM ansatt0);

/* Finner vare med høyere enn gjennomsnittet pris */
SELECT VNr, Pris FROM Vare
    WHERE Pris > (SELECT AVG(Pris) from Vare);

/* Vekselvirkende delspørringer */
/* Finner de som tjener mer enn gjennomsnittslønnen innen for sin stillingskategori */
SELECT A.* FROM ansatt0 AS A
    WHERE "lØnn" > (
        SELECT AVG("lØnn") FROM ansatt0 AS A2
                           WHERE A.stilling = A2.stilling
        );

/* Finn de billigste varene i hver kategori*/
SELECT V.* from Vare as V
    WHERE PRIS = (SELECT MIN(Pris) FROM Vare AS V2
                                   WHERE V.katnr = V2.katnr
                    );

/* Delspørringer i FROM-delen */
SELECT COUNT(*) AS AntallStillinger
    FROM (
        SELECT DISTINCT Stilling
        FROM ansatt0
         ) AS StillingerIBruk;


/*
Print de ansatte som tjener mer enn ALLE Sekretærer
SELECT * FROM ansatt0 WHERE "lØnn" > ALL
    (SELECT "lØnn" FROM ansatt0 WHERE stilling='Sekretær');

Print de ansatte som tjener mer enn MINST EN Sekretær
SELECT * FROM ansatt0 WHERE "lØnn" > SOME
    (SELECT "lØnn" FROM ansatt0 WHERE stilling='Sekretær');

Kan også løses med MAX:
SELECT * FROM ansatt0 WHERE "lØnn" > (SELECT MAX("lØnn") FROM ansatt0 WHERE stilling='Sekretær);
*/

/*
 IN - ∈
 IN avgjør om en verdi er med i en mengde, og tilstaverer ∈ fra mengdelære
 Spørring for å finne kunde med en eller flere tilhørende ordrer:

 SELECT * FROM KUNDE WHERE KNr IN (SELECT KNr FROM Ordre);

 SELECT * FROM Kunde WHERE KNr NOT IN (SELECT KNr FROM Ordre); // Negasjon ved bruk av NOT

 SELECT * FROM Vare WHERE KatNr IN (2,4,7); // Bruke IN for å forenkle OR-betingelser;
 */

 /*
 EXISTS sjekker om en delspørring gir et ikke-tomt svar
 SELECT A.* FROM ansatt as A
    WHERE NOT EXISTS(
    SELECT * FROM prosjektdeltakelse AS PD
    WHERE PD.AnsNr = A.AnsNR);
 */


/*
GROUP BY CUBE brukes for å beregne subtotaler

SELECT VNr, FylkeNr, SUM(Antall) AS Samlet
    FROM Salgstall
    GROUP BY CUBE (VNr, FylkeNr)

GROUP BY ROLLUP ligner, men gir ikke alle variantene av subtotaler.

Vindusjunskjoner kan brukes for å vise enkeltrader sammen med aggregerte data

Akkummulert
Kumulativ statistikk, f.eks akkumulert nedbør
Fra start til current row
SELECT Dato, Nedbør, SUM(Nedbør) OVER (ORDER BY Dato ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    AS Akkumulert FROM DagligNedbør;
*/

/*
Glidende snitt
3 dager tilbake i tid, og 3 dager frem i tid
SELECT DATO, Nedbør, AVG(Nedbør)
    OVER (ORDERED BY Dato ROWS BETWEEN 3 PRECEDIING AND 3 FOLLOWING) AS UkeSnitt
        FROM DagligNedbør;
*/