USE ScuolaDB
GO

-- DOCUMENTAZIONE DELLA PROCEDURE
/* 
   CREATE PROCEDURE sp_nome_delle_procedure
    AS
    BEGIN
        -- Corpo della procedura
    END
*/

-- =============================================
-- Author:		Fabrice
-- Create date: 28/05/2026
-- Description:	Restituisce tutti gli studenti presenti nella tabella Studenti
-- =============================================
CREATE PROCEDURE sp_GetAllStudenti
AS
BEGIN
	SELECT 
        StudenteId,
        ISNULL(NomeStudente + ' - ' + CognomeStudente, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, EmailStudente), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
	FROM Studenti
END
GO

EXEC sp_GetAllStudenti
GO

EXEC sp_GetStudenteById 4 
GO




         