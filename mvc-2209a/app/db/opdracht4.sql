-- Step: 01
-- Goal: Fill table Voertuigen with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `Mvc-2209a-P4`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `Mvc-2209a-P4`;

-- Use database Mvc-2209a-P4
Use `Mvc-2209a-P4`;

-- Step: 02
-- Goal: Fill table Voertuigen with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/

-- Drop table voertuigen if it exists
DROP TABLE IF EXISTS Voertuigen;


CREATE TABLE IF NOT EXISTS Voertuigen (
   Id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
   Kenteken VARCHAR(50) NOT NULL,
   Type VARCHAR(10) NOT NULL,
   Bouwjaar DATE NOT NULL,
   Brandstof VARCHAR(12) NOT NULL,
   TypevoertuigId TINYINT NOT NULL,
   CONSTRAINT PK_Voertuigen_Id PRIMARY KEY CLUSTERED (Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Voertuigen with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/

INSERT INTO Voertuigen
(
     Kenteken
    ,Type
    ,Bouwjaar
    ,Brandstof
    ,TypevoertuigId
)
VALUES
    ('AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1)
    ,('TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2)
    ,('TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1)
    ,('90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1)
    ,('34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2)
    ,('YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1)
    ,('UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2)
    ,('ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1)
    ,('123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4)
    ,('DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4)
    ,('STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4)
    ,('45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3)
;


-- Step: 04
-- Goal: Fill table TypeVoertuig with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/

DROP TABLE IF EXISTS TypeVoertuig;

CREATE TABLE IF NOT EXISTS TypeVoertuig
(
    Id                     TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,TypeVoertuig           VARCHAR(50)                     NOT NULL
   ,Rijbewijscategorie     VARCHAR(10)                     NOT NULL

   ,CONSTRAINT      PK_TypeVoertuig_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;

INSERT INTO TypeVoertuig
(
     TypeVoertuig
    ,Rijbewijscategorie
)
VALUES
    ('Personenauto', 'B')
    ,('Vrachtwagen', 'C')
    ,('Bus', 'D')
    ,('Bromfiets', 'AM')
;

-- Step: 05
-- Goal: Fill table Instructeurs with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/

DROP TABLE IF EXISTS Instructeur;

CREATE TABLE IF NOT EXISTS Instructeur
(
  Id TINYINT PRIMARY KEY,
  Voornaam VARCHAR(255),
  Tussenvoegsel VARCHAR(255),
  Achternaam VARCHAR(255),
  Mobiel VARCHAR(255),
  DatumInDienst DATE,
  AantalSterren VARCHAR(10)
);

INSERT INTO Instructeur (Id, Voornaam, Tussenvoegsel, Achternaam, Mobiel, DatumInDienst, AantalSterren)
VALUES
(1, 'Li', 'Zhan', '06-28493827', NULL, '17-04-2015', 3),
(2, 'Leroy', 'Boerhaven', NULL, '06-39398734', '25-06-2018', 1),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', 3),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', 4),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', 5);

-- Step: 06
-- Goal: Fill table VoertuigInstructeur with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            11-04-2023      Bram Smits                  New
-- **********************************************************************************/


DROP TABLE IF EXISTS VoertuigInstructeur;

CREATE TABLE IF NOT EXISTS VoertuigInstructeur
(
    Id              TINYINT                          NOT NULL    AUTO_INCREMENT
   ,VoertuigId      TINYINT         UNSIGNED         NOT NULL
   ,InstructeurId   TINYINT                          NOT NULL
   ,DatumToekenning DATE                             NOT NULL

   ,CONSTRAINT      PK_VoertuigInstructeur_Id   PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_VoertuigId              FOREIGN KEY (VoertuigId) REFERENCES Voertuigen(Id)
   ,CONSTRAINT      FK_InstructeurId           FOREIGN KEY (InstructeurId) REFERENCES Instructeur(Id)
) ENGINE=InnoDB;
