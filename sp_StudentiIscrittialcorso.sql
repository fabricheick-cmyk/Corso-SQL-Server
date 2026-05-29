USE ScuolaDB
GO

CREATE PROCEDURE sp_StudentiIscrittialcorso
    @CorsoId INT
AS
BEGIN   
    SELECT
        s.StudenteId, 
        ISNULL(NomeStudente + ' ' + CognomeStudente, 'Nome completo non presente') AS 'Nome completo',
        ISNULL(CONVERT(NVARCHAR, NomeCorso), 'N/D') AS 'Corso',
        ISNULL(CONVERT(NVARCHAR, DescrizioneCorso), 'N/D') AS 'DescrizioneCorso'
    FROM Studenti S
     JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
     JOIN Corsi c ON i.CorsoId = c.CorsoId
END

SELECT * FROM Corsi

EXEC sp_StudentiIscrittialcorso 1006;
