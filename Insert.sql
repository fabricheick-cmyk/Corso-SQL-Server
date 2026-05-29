USE ScuolaDB
GO

--INSERT INTO 
--	Corsi(NomeCorso, DescrizioneCorso, Crediti, Durata) 
--VALUES
--	('SQL SERVER', 'T-SQL Online', 50, 300),
--	('Python', 'Sviluppo Sowftware', 80, 250 ),
--	('Csharp', '.Net full stack developer', 70, 150 ),
--	('Database', 'MongoDb/PSql/Sql/MySQL/MariaDb', 50, 180 ),
--	('Php', 'Sviluppo App con Laravel e Symfony', 30, 350);



-- Insert Corsi
INSERT INTO Corsi (NomeCorso, DescrizioneCorso, Crediti, Durata)
VALUES
('SQL Base','Introduzione ai database e SQL',6,40),
('SQL Avanzato','Query complesse e ottimizzazione',8,60),
('C# Base','Fondamenti di programmazione C#',8,50),
('C# Avanzato','OOP e sviluppo applicazioni',10,70),
('Python Base','Introduzione a Python',6,40),
('Python Data Analysis','Analisi dati con Python',9,60),
('Java Base','Fondamenti di Java',7,45),
('Java Spring','Sviluppo backend con Spring',10,80),
('Web HTML CSS','Creazione pagine web statiche',5,30),
('JavaScript Base','Programmazione lato client',6,40),

('JavaScript Avanzato','Framework e async programming',9,65),
('React','Sviluppo frontend moderno',10,70),
('Angular','Framework Angular completo',10,75),
('Database Design','Progettazione database relazionali',8,50),
('SQL Server','Gestione database Microsoft',9,60),
('MySQL','Database open source',7,45),
('PostgreSQL','Database avanzato open source',8,55),
('Cybersecurity Base','Fondamenti sicurezza informatica',6,40),
('Cybersecurity Avanzato','Tecniche di difesa avanzate',10,80),
('Networking','Reti informatiche base',7,50),

('Cloud Computing','Introduzione al cloud',8,60),
('Azure','Servizi cloud Microsoft Azure',9,65),
('AWS','Servizi cloud Amazon',9,65),
('Docker','Containerizzazione applicazioni',8,55),
('Kubernetes','Orchestrazione container',10,75),
('Machine Learning','Introduzione ML',10,70),
('Intelligenza Artificiale','AI e modelli avanzati',10,80),
('Data Science','Analisi e visualizzazione dati',9,65),
('Git e Versioning','Controllo versione',5,30),
('DevOps','Integrazione e deployment continuo',10,75);

SELECT * FROM Corsi;

-- INSERT DOCENTI
INSERT INTO Docenti (Nome, Cognome, Email, Specializzazione)
VALUES
('Lorenzo','Riva','doc1@email.com','Database'),
('Giovanni','Testa','doc2@email.com','Programmazione'),
('Marco','Sala','doc3@email.com','Cybersecurity'),
('Andrea','Villa','doc4@email.com','Cloud'),
('Stefano','Gallo','doc5@email.com','Networking'),
('Paolo','Ferrari','doc6@email.com','Java'),
('Davide','Greco','doc7@email.com','Python'),
('Luca','Conti','doc8@email.com','C#'),
('Alessandro','Marini','doc9@email.com','Web'),
('Simone','Barbieri','doc10@email.com','AI'),

('Matteo','Fontana','doc11@email.com','Data Science'),
('Fabio','Rossi','doc12@email.com','DevOps'),
('Antonio','Ricci','doc13@email.com','SQL'),
('Emanuele','Serra','doc14@email.com','Backend'),
('Giorgio','Leone','doc15@email.com','Frontend'),
('Claudio','Moretti','doc16@email.com','Docker'),
('Daniele','Colombo','doc17@email.com','Kubernetes'),
('Franco','Costa','doc18@email.com','Azure'),
('Roberto','De Luca','doc19@email.com','AWS'),
('Michele','Romano','doc20@email.com','Machine Learning'),

('Enrico','Gatti','doc21@email.com','AI'),
('Riccardo','Caruso','doc22@email.com','Python'),
('Christian','Fiore','doc23@email.com','JavaScript'),
('Tommaso','Bianchi','doc24@email.com','React'),
('Nicola','Pellegrini','doc25@email.com','Angular'),
('Alberto','Villa','doc26@email.com','C++'),
('Federico','Lombardi','doc27@email.com','Sicurezza'),
('Gabriele','Testa','doc28@email.com','Reti'),
('Salvatore','Greco','doc29@email.com','Cloud'),
('Vincenzo','Russo','doc30@email.com','Database');

SELECT * FROM Docenti;

-- INSERT AULE
INSERT INTO Aule (NomeAula, Capacita)
VALUES
('Aula 1',30),('Aula 2',25),('Aula 3',20),('Aula 4',35),('Aula 5',40),
('Lab 1',20),('Lab 2',20),('Lab 3',15),('Lab 4',25),('Lab 5',30),
('Aula Magna',100),('Aula 6',30),('Aula 7',25),('Aula 8',20),('Aula 9',35),
('Aula 10',40),('Lab 6',20),('Lab 7',20),('Lab 8',15),('Lab 9',25),
('Lab 10',30),('Aula 11',30),('Aula 12',25),('Aula 13',20),('Aula 14',35),
('Aula 15',40),('Aula 16',30),('Aula 17',25),('Aula 18',20),('Aula 19',35);

SELECT * FROM Aule;
SELECT * FROM Iscrizioni;
SELECT * FROM Studenti
SELECT * FROM Corsi

--INSERT ISCRIZIONI
INSERT INTO Iscrizioni (StudenteID, CorsoID, DataIscrizione)
VALUES
-- (7, 7, '2024-01-16'),
(1,1,'2024-01-10'),(2,2,'2024-01-11'),(3,3,'2024-01-12'),
(4,4,'2024-01-13'),
(5,5,'2024-01-14'),(6,6,'2024-01-15'),

--(8,1007,'2024-01-17'),
(9,1008,'2024-01-18'),
(10,1009,'2024-01-19'),
(11,1010,'2024-01-20'),(12,1011,'2024-01-21'),(13,1012,'2024-01-22'),
(14,1013,'2024-01-23'),(15,1014,'2024-01-24'),(16,1015,'2024-01-25'),
(17,1016,'2024-01-26'),(18,1017,'2024-01-27'),(19,1018,'2024-01-28'),
(20,1019,'2024-01-29'),
(21,1020,'2024-01-30'),(22,1021,'2024-01-31'),(23,1022,'2024-02-01'),
(24,1023,'2024-02-02'),(25,1024,'2024-02-03'),(26,1025,'2024-02-04');
--(27,1026,'2024-02-05'),(28,1027,'2024-02-06'),(29,1028,'2024-02-07'),
--(30,1029,'2024-02-08');

--INSERT DOCENTI-CORSO
INSERT INTO DocentiCorso (DocenteID, CorsoID)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,1006),(8,1007),(9,1008),(10,1009),

(11,1010),(12,1012),(13,1013),(14,1014),(15,1015),
(16,1016),(17,1017),(18,1018),(19,1019),(20,1020),

(21,1021),(22,1022),(23,1023),(24,1024),(25,1025),
(26,1026),(27,1027),(28,1028),(29,1029),(30,1030);

select * from DocentiCorso;

-- INSERT LEZIONI
INSERT INTO Lezioni (CorsoID, AulaID, DataLezione, OrarioInizio, OrarioFine)
VALUES
(1,1,'2024-03-01','09:00','11:00'),
(2,2,'2024-03-01','11:00','13:00'),
(3,3,'2024-03-02','09:00','11:00'),
(4,4,'2024-03-02','11:00','13:00'),
(5,5,'2024-03-03','09:00','11:00'),
(6,6,'2024-03-03','11:00','13:00'),

(1006,11,'2024-03-06','09:00','11:00'),
(1007,12,'2024-03-06','11:00','13:00'),
(1008,13,'2024-03-07','09:00','11:00'),
(1009,14,'2024-03-07','11:00','13:00'),
(1010,15,'2024-03-08','09:00','11:00'),
(1011,16,'2024-03-08','11:00','13:00'),
(1012,17,'2024-03-09','09:00','11:00'),
(1013,18,'2024-03-09','11:00','13:00'),
(1014,19,'2024-03-10','09:00','11:00'),
(1015,20,'2024-03-10','11:00','13:00'),

(1016,21,'2024-03-11','09:00','11:00'),
(1017,22,'2024-03-11','11:00','13:00'),
(1018,23,'2024-03-12','09:00','11:00'),
(1019,24,'2024-03-12','11:00','13:00'),
(1020,25,'2024-03-13','09:00','11:00'),
(1026,26,'2024-03-13','11:00','13:00'),
(1027,27,'2024-03-14','09:00','11:00'),
(1028,28,'2024-03-14','11:00','13:00'),
(1029,29,'2024-03-15','09:00','11:00'),
(1030,30,'2024-03-15','11:00','13:00');

SELECT * FROM Lezioni;