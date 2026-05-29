USE ScuolaDb;
GO 


-- Restituisce la lista delle tabelle 
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

/*
	Operatori di confronto

	Servono per confrontare valori:
		= → uguale
		!= o <> → diverso
		> → maggiore
		< → minore
		>= → maggiore o uguale
		<= → minore o uguale
*/


select * from Studenti
-- Operatori logici AND → tutte le condizioni devono essere vere
-- OR → almeno una vera
-- NOT → nega la condizione
-- IS NULL
SELECT 
	NomeStudente + ' ' + CognomeStudente AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE DataNascita IS NULL AND NomeStudente = 'Mario'

SELECT 
	NomeStudente + ' ' + CognomeStudente AS 'Nome completo',
	CodiceFiscale,
	Telefono,
    DataNascita
FROM Studenti
WHERE DataNascita < '1985' OR DataNascita <= '2000'
ORDER BY DataNascita ASC


 SELECT 
	NomeStudente + ' ' + CognomeStudente AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE NomeStudente IN ('Malika', 'Alex', 'Cheick', 'Giulia')

SELECT DISTINCT
    StudenteID,
    NomeStudente + ' ' + CognomeStudente AS 'Nome completo'
FROM Studenti

-- BETWEEN
SELECT * FROM Corsi
WHERE Crediti BETWEEN 10 AND 50;

-- LIKE
-- M% (m......)
-- %O (......o)
-- %A% (.....a.....)
-- _ (per un solo carattere)

SELECT 
	NomeStudente + ' ' + CognomeStudente AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE NomeStudente LIKE 'M%' OR NomeStudente LIKE 'A%'

SELECT 
    top 10 * FROM Studenti
    WHERE DataNascita is NOT NULL

SELECT 
    top 10 * FROM Studenti
    WHERE DataNascita is NULL  

/* OPERATORI DI AGGREGAZIONE

-- COUNT 
-- AVG
-- SUM
-- MIN
-- MAX
*/

SELECT COUNT (*) AS Studenti
 FROM Studenti

SELECT AVG (Crediti) AS Media
 FROM Corsi

SELECT SUM (Crediti) AS 'Totale Crediti'
 FROM Corsi

SELECT MIN (Crediti) AS 'Minimo Crediti'
 FROM Corsi

SELECT MAX (Crediti) AS 'Massimo Crediti'
 FROM Corsi

SELECT
   COUNT  (*) AS 'Totale Corsi',
   AVG (Crediti) AS Media,
   SUM (Crediti) AS Somma,
   MIN (Crediti) AS Minimo,
   MAX (Crediti) AS Massimo
FROM Corsi
