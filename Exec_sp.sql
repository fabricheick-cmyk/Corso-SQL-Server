USE ScuolaDb;
GO

-- Lista Studenti
EXEC sp_GetAllStudenti;

-- Studente con id del parametro
EXEC sp_GetStudenteById 10;

-- Cerca lo Studente tramite(dentro) il Nome del parametro
EXEC sp_GetStudenteByNome 'A';
EXEC sp_GetStudenteByNome @Nome = 'Massimo';

EXEC sp_InsertStudente 'Massimo', 'Zangardo', 'z.massimo@ferrari.it', 'MZD789OP23PC08PZ', '1985/02/10', '+3353894510'

select * from studenti;

EXEC sp_UpdateStudente 25, 'Miranda', 'Baldo', 'm.baldo@gmail.com', 'MZD789OP23PMI45', '1985/02/10', '+3353894590'

