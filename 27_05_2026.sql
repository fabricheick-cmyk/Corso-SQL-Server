USE ScuolaDB
GO


-- Le condizioni If/Else if/ Else (CASE)
   /*
     CASE
        WHEN condizione1 THEN risultato1
        WHEN condizione2 THEN risultato2
        ...
        ELSE risultato
     END
    */

SELECT 
    NomeStudente,
    CASE
        WHEN DataNascita is null THEN 'Mancante'
        ELSE 'Presente'
    END AS 'Data Nascita'
FROM Studenti

SELECT
    NomeCorso,
    Crediti,
    Durata,
    CASE
        WHEN Crediti < 10 THEN 'Base'
        WHEN Crediti BETWEEN 10 AND 50 THEN 'Intermedio'
        ELSE 'Avanzato'
    END AS 'Livello Corso',
    CASE
        WHEN Durata < 45 THEN 'Breve'
        WHEN Durata BETWEEN 45 AND 70 THEN 'Medio'
        ELSE 'Lungo'
    END AS 'Durata Corso' 
FROM Corsi 

/*
	Le SubQuery:
		è una query dentro un'aaltro query
	SELECT 
		Colonne
	FROM Tabella 
	where Colonna > (
		SELECT AVG(colonna) FROM tabella)
*/ 

-- Esempio:
SELECT 
	*
FROM Corsi 
where Crediti < 15

-- Verificare prima di procedere 
SELECT 
	AVG(Crediti) AS Media  
FROM Corsi; 

-- Query finale della SubQuery
SELECT 
	*
FROM Corsi 
where Crediti > (
	SELECT 
		AVG(Crediti) AS Media  
	FROM Corsi)
ORDER BY Crediti ASC


-- JOIN CON SubQuery
-- Studenti scritti a più corsi 
SELECT 
	StudenteId
FROM Iscrizioni
GROUP BY StudenteId
HAVING COUNT(*) > 1;

select * from Iscrizioni



SELECT 
	NomeStudente, 
	CognomeStudente
FROM Studenti s
WHERE s.StudenteId IN (1,7,10,30);


SELECT 
StudenteId,
	NomeStudente, 
	CognomeStudente
FROM Studenti s
WHERE s.StudenteId IN (
	SELECT 
		StudenteId
	FROM Iscrizioni
	GROUP BY StudenteId
	HAVING COUNT(*) > 1
);


SELECT 
	c.CorsoId,
	c.NomeCorso,
	c.DescrizioneCorso,
	c.Crediti, 
	s.NomeStudente + ' ' + s.CognomeStudente AS Studente,
	ISNULL(s.EmailStudente, 'Mail Non Definita') AS EMailStudente,
	ISNULL(CONVERT(VARCHAR, s.DataNascita, 104), 'Data Non Definita') AS DataNasita,
	AVG(c.Crediti) AS MediaCrediti,
	COUNT(*) AS TotaleCrediti,
	Min(c.Crediti) AS MinimoCrediti,
	Max(c.Crediti) AS MassimoCrediti,
	COUNT(c.Durata) ToTaleDurata,
	Min(c.Durata) DurataMinimo,
	Max(c.Durata) DurataMassimo
FROM Corsi c
INNER JOIN Iscrizioni i
	ON i.CorsoId = c.CorsoId
INNER JOIN Studenti s
	ON s.StudenteId = i.StudenteId
GROUP BY c.CorsoId, c.NomeCorso, 
		 c.DescrizioneCorso, s.NomeStudente,
		 s.CognomeStudente, s.EmailStudente, s.DataNascita,
		 c.Crediti
HAVING AVG(c.Crediti) BETWEEN 10 AND 50 
ORDER BY c.CorsoId


SELECT 
	CorsoId,
	NomeCorso,
	DescrizioneCorso,
	AVG(Crediti) AS MediaCrediti,
	COUNT(*) AS TotaleCrediti,
	Min(Crediti) AS MinimoCrediti,
	Max(Crediti) AS MassimoCrediti,
	AVG(Durata) DurataMedia,
	COUNT(Durata) ToTaleDurata,
	Min(Durata) DurataMinimo,
	Max(Durata) DurataMassimo
from Corsi
GROUP BY CorsoId, NomeCorso, DescrizioneCorso
HAVING AVG(Crediti) > 20
ORDER BY CorsoID


-- Update 
/* 
    UPDATE NomeTabella
    SET Colonna1 = Valore1, Colonna2 = Valore2, ...
    WHERE Condizione
*/


UPDATE Iscrizioni
   SET StudenteId = 10 -- Luca Bianchi
 WHERE CorsoId IN (8,9,10,11,12);


UPDATE Studenti
   SET NomeStudente = 'Lamine',
		CognomeStudente = 'Diop',
        EmailStudente = 'lamine.diop@email.com'
 WHERE StudenteId = 10


SELECT distinct
	s.StudenteId,
	s.NomeStudente + ' ' + s.CognomeStudente AS NomeCompleto,
	c.NomeCorso, 
	c.DescrizioneCorso
FROM Studenti s
join Iscrizioni i
	On i.StudenteId = s.StudenteId
join Corsi c
	On c.CorsoId = i.CorsoId
Where s.StudenteId = 10


 select DISTINCT * from Iscrizioni;
 SELECT * from Studenti

SELECT * FROM Studenti WHERE StudenteId = 1;
SELECT * FROM Corsi WHERE CorsoId > 26;

Insert into Iscrizioni (StudenteId, CorsoId) Values (1, 15)

-- DELETE
/* 
    DELETE FROM NomeTabella
    WHERE Condizione
*/  
SELECT * FROM Iscrizioni
WHERE CorsoId = 15
DELETE FROM Iscrizioni
WHERE CorsoId = 15

-- Exists (Controllare un record)
/*
EXISTS controlla:
	se una query restituisce risultati
	IF EXISTS(
		SELECT 1
	FROM TABELLA
	)
	BEGIN
		Stampa / condizione / verifica
	END
	ELSE 
	BEGIN
		Condizioni /
		stampa
	END
*/

IF EXISTS(
		SELECT 1
	FROM Studenti
	)
	BEGIN
		print 'Esistono studenti'
	END
	ELSE 
	BEGIN
		print 'Tabella vuota'
	END

IF NOT EXISTS(
		SELECT 1
	FROM Studenti
	)
	BEGIN
		print 'Tabella vuota'
	END
	ELSE 
	BEGIN
		print 'Esistono studenti'
	END

-- Studenti senza data di nascita
IF EXISTS(
        SELECT 1
     FROM Studenti
    WHERE DataNascita IS NULL
    )
BEGIN
    PRINT 'Esistono studenti senza data di nascita'
END
ELSE
BEGIN
    PRINT 'Tutti gli studenti hanno una data di nascita'
END           

SELECT 
	*
FROM Studenti;

