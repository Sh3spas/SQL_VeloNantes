/*Requete SQL permmetant de tester le bon fonctionement de la BDD*/

-- 1. Quels sont les noms des quartiers avec une longueur de piste sup�rieure � 10000 m�tres ?
SELECT nomQuartier
FROM Quartier
WHERE longueurPiste > 10000;

-- 2. Quelles sont les dates des jours de Vacances de Noel (vacances Zone B) avec une temp�rature sup�rieure � 12 degr�s Celsius ?
SELECT datej
FROM Jour
WHERE vacanceZoneB = 'Vacances de Noel' AND temperature > 12;

-- 3. Quels sont les noms des quartiers et les libell�s des compteurs ?
SELECT nomQuartier AS quartierLibelle
FROM Quartier
UNION
SELECT libelle AS quartierLibelle
FROM Compteur;

-- 4. Quels sont les noms des quartiers qui n'ont pas de compteur associ� ?
SELECT nomQuartier
FROM Quartier
MINUS
SELECT nomQuartier
FROM Quartier
JOIN Compteur ON idQuartier = unQuartier;

-- 5. Quels sont les libell�s des compteurs et les noms des quartiers correspondants ?
SELECT libelle, nomQuartier
FROM Compteur
JOIN Quartier ON unQuartier = idQuartier;

-- 6. Quels sont les totaux des relev�s sup�rieurs � 5000 pour chaque compteur et la date de ces relev�s ?
SELECT total, laDate, libelle
FROM Releve
JOIN Compteur ON unCompteur = idCompteur
WHERE total > 5000;

-- 7. Quelles sont les 5 dates les plus chaudes enregistr�es ?
SELECT datej, temperature
FROM (
    SELECT datej, temperature, ROWNUM AS rn
    FROM Jour
    ORDER BY temperature DESC
)
WHERE rn <= 5;

-- 8. Quels sont les compteurs qui n'ont pas de relev�s associ�s ?
SELECT idCompteur
FROM Compteur
LEFT JOIN Releve ON idCompteur = unCompteur
WHERE unCompteur IS NULL;

-- 9. Quels sont les jours sans relev�s associ�s ? (Aucun)
SELECT *
FROM Jour
LEFT JOIN Releve ON datej = laDate
WHERE laDate IS NULL;

-- 10. Quelle est la longueur totale des pistes dans tous les quartiers ?
SELECT SUM(longueurPiste)
FROM Quartier;

-- 11. Quelle est la temp�rature moyenne de tous les jours enregistr�s ?
SELECT AVG(temperature)
FROM Jour;

-- 12. Quel est le total des relev�s pour chaque compteur ?
SELECT unCompteur, SUM(total)
FROM Releve
GROUP BY unCompteur;

-- 13. Quelle est la temp�rature moyenne par jour de la semaine ?
SELECT jourDeLaSemaine, AVG(temperature)
FROM Jour
GROUP BY jourDeLaSemaine;

-- 14. Quels sont les jours de la semaine avec une temp�rature moyenne sup�rieure � 20 degr�s Celsius ?
SELECT jourDeLaSemaine, AVG(temperature)
FROM Jour
GROUP BY jourDeLaSemaine
HAVING AVG(temperature) > 20;

-- 15. Quels sont les compteurs ayant un total de relev�s sup�rieur � 10000 ?
SELECT unCompteur, SUM(total)
FROM Releve
GROUP BY unCompteur
HAVING SUM(total) > 10000;

-- 16. Quels sont les compteurs qui ont des relev�s pour tous les jours ?
SELECT idCompteur, libelle
FROM Compteur
JOIN (
    SELECT unCompteur, COUNT(DISTINCT laDate) AS totalDates
    FROM Releve
    GROUP BY unCompteur
) 
ON idCompteur = unCompteur
WHERE totalDates = (
    SELECT COUNT(*) FROM Jour
);

-- 17. Quels sont les relev�s effectu�s le Dimanche durant les jours de Vacances de printemps (vacances Zone B) ?
SELECT idReleve
FROM Releve
WHERE laDate IN (
    SELECT datej
    FROM Jour
    WHERE vacanceZoneB = 'Vacances de printemps'
    AND jourDeLaSemaine IN (7)
);

-- 18. Quels sont les compteurs qui ont des relev�s avec un total sup�rieur � 1000 ?
SELECT idCompteur
FROM Compteur
WHERE EXISTS (
    SELECT *
    FROM Releve
    WHERE unCompteur = idCompteur AND total > 1000
);
