USE ScuolaDB
GO

-- studenti e iscrizioni corsi
--docenti, corsi, aule, lezioni

-- Lezioni <-> Aule <- Corsi
-- Iscrizione <-> Studenti <- Corsi
-- DocentiCorso <-- Docenti

-- Da fare: recuperare lo studente, il corso, l'aula, docente, lezione
SELECT  
    NomeStudente + ' ' + CognomeStudente AS Studente,
    ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'D/N') AS DataNascita
FROM Studenti
ORDER BY DataNascita DESC;

SELECT
    *
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteID = i.StudenteID
JOIN Corsi c
    ON c.CorsoID = i.CorsoID
JOIN Lezioni l
    ON l.CorsoID = c.CorsoID
JOIN Aule a
    ON a.AulaID = l.AulaID


SELECT
    s.NomeStudente + ' ' + s.CognomeStudente AS Studente,
    c.NomeCorso AS 'Nome Corso',
    c.DescrizioneCorso AS 'Descrizione Corso',
    l.OrarioInizio,
    l.DataLezione,
    a.NomeAula,
    d.Nome + ' ' + d.Cognome AS Docente,
    d.Email AS 'Docente Email',
    d.Specializzazione AS Materia
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteID = i.StudenteID
JOIN Corsi c
    ON c.CorsoID = i.CorsoID
JOIN Lezioni l
    ON l.CorsoID = c.CorsoID
JOIN Aule a
    ON a.AulaID = l.AulaID
JOIN DocentiCorso dc
    ON dc.CorsoID = c.CorsoID
JOIN Docenti d
    ON d.DocenteID = dc.DocenteID
ORDER BY Studente ASC;

-- LEFT JOIN

SELECT
    s.NomeStudente + ' ' + s.CognomeStudente AS Studente,
    c.NomeCorso AS 'Nome Corso',
    c.DescrizioneCorso AS 'Descrizione Corso',
    l.OrarioInizio,
    l.DataLezione,
    a.NomeAula,
    d.Nome + ' ' + d.Cognome AS Docente,
    d.Email AS 'Docente Email',
    d.Specializzazione AS Materia
FROM Studenti s
LEFT JOIN Iscrizioni i 
    ON s.StudenteID = i.StudenteID
LEFT JOIN Corsi c
    ON c.CorsoID = i.CorsoID
LEFT JOIN Lezioni l
    ON l.CorsoID = c.CorsoID
LEFT JOIN Aule a
    ON a.AulaID = l.AulaID
LEFT JOIN DocentiCorso dc
    ON dc.CorsoID = c.CorsoID
LEFT JOIN Docenti d
    ON d.DocenteID = dc.DocenteID

SELECT 
    --ISNULL(CONVERT(VARCHAR, YEAR(DataLezione), 103), 'N/D') AS DataLezione,
    ISNULL(CONVERT(VARCHAR, DataLezione, 109), 'N/D') AS DataLezione,
    --ISNULL(CONVERT(VARCHAR, MONTH(DataLezione), 113), 'N/D') AS Mese,
    --ISNULL(CONVERT(VARCHAR, DataLezione, 108), 'N/D') AS Mese_Ora,
    --ISNULL(CONVERT(VARCHAR, OraInizio, 108), 'N/D') AS Inizio ,
   
   -- 12:00:50
   ISNULL(LEFT(CONVERT(VARCHAR, OrarioInizio, 108), 5), 'ORA NON DEFINITA') AS Inizio,
    --ISNULL(CONVERT(VARCHAR, OraFine, 108), 'N/D') AS Fine,
    ISNULL(Left(CONVERT(VARCHAR, OrarioFine, 108), 5), 'N/D') AS Fine
    ----ISNULL(Right(CONVERT(VARCHAR, OraFine, 108), 2), 'N/D') AS Fine

FROM Lezioni


-- RIGHT JOIN
SELECT DISTINCT
    ISNULL(s.NomeStudente + ' ' + s.CognomeStudente, 'Studente non assegnato') as Studente,
    ISNULL(c.NomeCorso, 'N/A') as 'Nome Corso',
    ISNULL(c.DescrizioneCorso, 'N/A') as 'Descrizione Corso',
    ISNULL(CONVERT(VARCHAR, DataLezione, 109), 'N/D') as DataLezione,
    ISNULL(LEFT(CONVERT(VARCHAR, OrarioInizio, 108), 5), 'ORA NON DEFINITA') as Inizio,
    ISNULL(Left(CONVERT(VARCHAR, OrarioFine, 108), 5), 'N/D') AS Fine,
    ISNULL(a.NomeAula, 'N/D') AS NomeAula,
    ISNULL(d.Nome + ' ' + d.Cognome, 'Docente non assegnato') AS Docente,
    ISNULL(d.Email, 'N/D') as 'Docente Mail',
    ISNULL(d.Specializzazione, 'N/D') as Materia 
FROM Studenti s
RIGHT JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
RIGHT JOIN Corsi c
    ON c.CorsoId = i.CorsoId
RIGHT JOIN Lezioni l
    ON l.CorsoId = c.CorsoId
RIGHT JOIN Aule a
    ON a.AulaId = l.AulaId
RIGHT JOIN DocentiCorso dc 
    ON dc.CorsoId = c.CorsoId
RIGHT JOIN Docenti d
    ON d.DocenteId = dc.DocenteId
Order by Studente ASC

-- ESERCIZIO 1
/*
Studenti iscritti ad un corso. Campi da restituire:
nome completo studente
codice fiscale studente
nome del corso
descrizione del corso
*/
SELECT
    NomeStudente + '' + CognomeStudente as 'Nome completo studente',
    CodiceFiscale,
    C.NomeCorso as 'Nome del corso',
    C.DescrizioneCorso as 'Descrizione del corso'
from Studenti as S
join Iscrizioni as I
    on S.StudenteId = I.StudenteId
join Corsi as C
    on I.CorsoId = C.CorsoId 

-- ESERCIZIO 2 
/*   
-- LISTA DOCENTI corso, Lezioni, aula, colonne da restituire: nome + cognome docente,
-- Nome corso, nome aula, descrizione corso, aula, durata lezione


-- Lezioni <-> Aule <- Corsi
-- Iscrizione <-> Studenti <- Corsi
-- DocentiCorso <- Docenti
*/


SELECT 
d.Nome + ' ' + d.Cognome as 'Nome Completo Docente',
c.NomeCorso as 'Nome Corso',
c.DescrizioneCorso as 'Descrizione Corso',
a.NomeAula as 'Nome Aula',
l.OrarioInizio as Inizio,
l.OrarioFine as Fine

from docenti d
JOIN DocentiCorso as dc
    on d.DocenteId = dc.DocenteId
JOIN Corsi as c
    on c.CorsoId = dc.CorsoId
join Lezioni as l
    on l.CorsoId = c.CorsoId
JOIN Aule as a
    on a.AulaId = l.AulaId

    

    
