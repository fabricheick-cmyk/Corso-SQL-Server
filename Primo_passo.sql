create database ScuolaDB;
GO

USE ScuolaDB;
GO

CREATE TABLE Studenti
(
    StudenteID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    NomeStudente NVARCHAR(50) NOT NULL,
    CognomeStudente NVARCHAR(50) NOT NULL,
    EmailStudente NVARCHAR(150) UNIQUE NULL,
    CodiceFiscale CHAR(16) NOT NULL UNIQUE,
    DataNascita DATE NULL,
    Telefono NVARCHAR(20) UNIQUE NULL,
    )

    /*
        Select restituisce il record di tutte le colonne delle tabelle
    */

        SELECT
              *
        FROM Studenti       
    
    
    /*
        Inserimento dei dati
    */
  
    INSERT INTO Studenti (NomeStudente, CognomeStudente, EmailStudente, CodiceFiscale, DataNascita, Telefono)
    VALUES ('Cheick', 'Fabri', 'cheick.fabri@example.com', 'FBRCHK85M01H501X', '1990-03-01', '+393456789012');


    SELECT * FROM Studenti;

    
        INSERT INTO Studenti (NomeStudente, CognomeStudente, EmailStudente, CodiceFiscale, DataNascita, Telefono)
        VALUES ('Mario', 'Samba', 'mario.samba@example.com', 'SMBMRO85M01H501X', '1991-08-16', '+393456781216'),
                ('Luigi', 'Rossi', 'luigi.rossi@example.com', 'RSSLGI85M01H501X', '1992-12-20', '+393456890123'),
                ('Giulia', 'Amarone', 'giulia.amarone@example.com', 'AMRGLI85M01H501F', '1990-05-10', '+393456901234'),
                ('Malika', 'Colombiana', 'malika.colombiana@example.com', 'CLBMLK85M01H501H', '1991-07-25', '+393456901235'),
                ('Alex', 'Smith', 'alex.smith@altavista.com', 'SMNLEX85M01H622Y', '1990-11-30', '+393456901236');
    
SELECT
      NomeStudente, CognomeStudente 
From Studenti
Where StudenteID = 5;
