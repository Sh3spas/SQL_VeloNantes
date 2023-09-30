#Script python pour automatiser les requetes sql permetant de remplir la table Jour

import csv
occurence = 0
with open('../LesTablesExcel/data_comptage_nettoyees_v2.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    next(reader)  # Ignorer la première ligne
    for row in reader:
        datej = row[2]
        jourDeLaSemaine = row[29]
        vacancesZoneB = row[32]
        temperature = row[33]


        # Écrire la requête SQL d'insertion
        sql_query = "INSERT INTO Jour (datej,jourDeLaSemaine,temperature,vacanceZoneB) VALUES ('{}', {}, {} ,'{}');"

       
        # Écrire la requête SQL pour cette mesure
        sql_insert = sql_query.format(datej,jourDeLaSemaine,temperature,vacancesZoneB)

        if datej == '01/01/2020':
            occurence += 1
        
        if occurence == 2:
            break
        
        # Écrire la requête SQL dans le fichier
        with open('JourInsert.sql', 'a') as sql_file:
            sql_file.write(sql_insert + '\n')
