USE ScuolaDB
GO

/* 
    Esercizio1: Like
        Resttituirel'elenco degli studenti,
        dove la data di nascia non è nulla.
        il nome inizia con G
*/

SELECT * FROM Studenti
WHERE DataNascita IS NOT NULL AND NomeStudente LIKE 'G%'

/* 
    Esercizio2: Between
        Mostra corsi:
        con crediti compresi tra 5 e 20
        ordina del più grande al più piccolo
*/

SELECT * FROM Corsi
WHERE Crediti BETWEEN 5 AND 20
ORDER BY Crediti DESC

/*
    JOIN
    Unisce due o più righe o tabelle

    Esistono la 
    INNER JOIN,
     LEFT JOIN <-,
    RIGHT JOIN ->,
    FULL JOIN

    Sintassi di base
    SELECT colonna
    FROM tabella1
    JOIN tabella2
        ON tabella1.colonna = tabella2.colonna
*/

-- Esempio: JOIN tra studenti e iscrizioni
SELECT
    s.NomeStudente,
    s.CognomeStudente,
    i.DataIscrizione,
    i.CorsoID
FROM Studenti AS s
JOIN Iscrizioni AS i
    ON s.StudenteID = i.StudenteID 

-- JOIN tra corso, decrizione corso e durata
SELECT
    s.NomeStudente,
    s.CognomeStudente,
    i.DataIscrizione,
    c.NomeCorso,
    c.DescrizioneCorso,
    c.Durata
FROM Studenti AS s
JOIN Iscrizioni AS i
    ON s.StudenteID = i.StudenteID
JOIN Corsi AS c
    ON i.CorsoID = c.CorsoID

/*
    LEFT JOIN
         Mostra i record delle tabelle di sinistra
         anche se non ci sono corrispondenze nella tabella di destra

    La differenza tra INNER JOIN e LEFT JOIN è che la prima restituisce solo i record che hanno corrispondenze in entrambe le tabelle, mentre la seconda restituisce tutti i record della tabella di sinistra, anche se non ci sono corrispondenze nella tabella di destra.
        INNER JOIN: Mostra solo studenti iscritti

    
        LEFT JOIN: Mostra tutti gli studenti, anche quelli non iscritti
*/

SELECT distinct 
    s.NomeStudente,
    s.CognomeStudente,
    s.CodiceFiscale,
    c.NomeCorso,
    c.DescrizioneCorso,
    c.Durata,
    i.DataIscrizione
FROM Studenti s
LEFT JOIN Iscrizioni i
    ON i.StudenteID = s.StudenteID
LEFT JOIN Corsi c
    ON i.CorsoID = c.CorsoID


/*
    =========================================
    JOIN CON FILTRI
    =========================================
*/

-- Mostra i primi 10 studenti iscritti


SELECT top 10
    s.NomeStudente,
    s.CognomeStudente,
    s.CodiceFiscale,
    i.DataIscrizione
FROM Studenti AS s
JOIN Iscrizioni AS i
    ON i.StudenteID = s.StudenteID

/*
    RIGHT JOIN
        Mostra:
            . Tutti i record della tabella di destra
            . Anche senza corrispondenza 
*/

/* 
    Esercizio

     -- Docenti e corsi
     -- Studsenti, Iscrizioni, Corsi
     -- Docenti, Corsi, Aule, Lezioni
*/





    