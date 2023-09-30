DROP TABLE Releve;
DROP TABLE Compteur;
DROP TABLE Jour; 
DROP TABLE Quartier;

/* Création des tables */

CREATE TABLE Quartier (
    idQuartier NUMBER
        CONSTRAINT pk_Quartier PRIMARY KEY,
    nomQuartier VARCHAR2(3000),
    longueurPiste NUMBER
);

CREATE TABLE Jour (
    datej DATE
        CONSTRAINT pk_Jour PRIMARY KEY,
    jourDeLaSemaine NUMBER,
    temperature FLOAT,
    vacanceZoneB VARCHAR2(3000)
);

CREATE TABLE Compteur (
    idCompteur NUMBER
        CONSTRAINT pk_Compteur PRIMARY KEY,
    unQuartier NUMBER
        CONSTRAINT fk_Compteur_Quartier REFERENCES Quartier(idQuartier),
    libelle VARCHAR2(3000),
    observations VARCHAR2(3000),
    latitude FLOAT,
    longitude FLOAT
);


CREATE TABLE Releve (
    idReleve NUMBER 
    CONSTRAINT pk_releve PRIMARY KEY,
    unCompteur NUMBER,
    laDate DATE,
    heure0 NUMBER,
    heure1 NUMBER,
    heure2 NUMBER,
    heure3 NUMBER,
    heure4 NUMBER,
    heure5 NUMBER,
    heure6 NUMBER,
    heure7 NUMBER,
    heure8 NUMBER,
    heure9 NUMBER,
    heure10 NUMBER,
    heure11 NUMBER,
    heure12 NUMBER,
    heure13 NUMBER,
    heure14 NUMBER,
    heure15 NUMBER,
    heure16 NUMBER,
    heure17 NUMBER,
    heure18 NUMBER,
    heure19 NUMBER,
    heure20 NUMBER,
    heure21 NUMBER,
    heure22 NUMBER,
    heure23 NUMBER,

    total NUMBER,

    probA VARCHAR2(3000),

    FOREIGN KEY (unCompteur) REFERENCES compteur(idCompteur),
    FOREIGN KEY (laDate) REFERENCES jour(datej)
);