use ScuolaDB
GO

SELECT * FROM Corsi;

insert into Corsi (NomeCorso, DescrizioneCorso, Crediti, Durata)
VALUES 
     ('SQL SERVER', 'T-SQL Online', 50, 300),
     ('Python', 'Sviluppo Software', 50, 300),
     ('Csharp', 'Net full stack developer', 80, 250),
     ('Database', 'MongoDb/PSql/Sql/MySql/MariaDb', 50, 180),
     ('Php', 'Sviluppo App con Lavarel e Symfony', 30, 350);
