#Script python pour automatiser les requetes sql permetant de remplir la table Compteur
import csv

with open('../LesTablesExcel/TableCompteur.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    next(reader)  # Ignorer la première ligne
    for row in reader:
        idCompteur = row[0]
        libelle = row[1]
        observation = row[2]
        geolocalisation = row[3]
        unQuartier = row[4]
       
        # Split la geolocalisation
        latitude = geolocalisation.split(',')[0]
        longitude = geolocalisation.split(',')[1]

        # Écrire la requête SQL d'insertion
        sql_query = "INSERT INTO Compteur (idCompteur,unQuartier,libelle,observations,latitude,longitude) VALUES ({}, {}, '{}', '{}', {}, {});"

        # Verifier si les int sont remplies
        if unQuartier == '':
            unQuartier = 'NULL'
        
        
        # Écrire la requête SQL pour cette mesure
        sql_insert = sql_query.format(idCompteur,unQuartier,libelle,observation,latitude,longitude)

        # Écrire la requête SQL dans le fichier
        with open('../scriptRemplissageSQL/CompteurInsert.sql', 'a') as sql_file:
            sql_file.write(sql_insert + '\n')
