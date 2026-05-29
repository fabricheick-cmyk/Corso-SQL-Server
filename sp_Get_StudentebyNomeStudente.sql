USE ScuolaDB
GO

-- =============================================
-- Author:		Fabrice
-- Create date: 28/05/2026
-- Description:	Restituisce lo studente con il nome del parametro
-- =============================================

CREATE PROCEDURE sp_GetStudenteByNomeStudente
    @NomeStudente NVARCHAR(50)   
AS
BEGIN
    SELECT 
        ISNULL(NomeStudente + ' - ' + CognomeStudente, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, EmailStudente), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
    FROM Studenti
    WHERE NomeStudente = @NomeStudente  
END
GO 

EXEC sp_GetStudenteByNomeStudente 'Lamine'
GO

-- ALTRA POSSIBILITA' DI ESECUZIONE DELLA PROCEDURE

CREATE PROCEDURE sp_GetStudenteByNome
	@Nome NVARCHAR(100) 
AS
BEGIN
	SELECT 
		ISNULL(NomeStudente + ' - ' + CognomeStudente, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, EmailStudente), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
	FROM Studenti
	WHERE NomeStudente LIKE '%' + @Nome + '%';
END