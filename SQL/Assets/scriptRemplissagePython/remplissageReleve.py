#Script python pour automatiser les requetes sql permetant de remplir la table Releve


import csv
idReleve = 0
with open('../LesTablesExcel/data_comptage_nettoyees_v2.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=';')
    next(reader)  # Ignorer la première ligne
    for row in reader:
        unCompteur = row[0]
        laDate = row[2]
        heure_0 = row[3]
        heure_1 = row[4]
        heure_2 = row[5]
        heure_3 = row[6]
        heure_4 = row[7]
        heure_5 = row[8]
        heure_6 = row[9]
        heure_7 = row[10]
        heure_8 = row[11]
        heure_9 = row[12]
        heure_10 = row[13]
        heure_11 = row[14]
        heure_12 = row[15]
        heure_13 = row[16]
        heure_14 = row[17]
        heure_15 = row[18]
        heure_16 = row[19]
        heure_17 = row[20]
        heure_18 = row[21]
        heure_19 = row[22]
        heure_20 = row[23]
        heure_21 = row[24]
        heure_22 = row[25]
        heure_23 = row[26]
        total = row[27]
        probA = row[28]
        idReleve = idReleve + 1


        # Écrire la requête SQL d'insertion
        sql_query = "INSERT INTO Releve (idReleve,unCompteur,laDate, heure0, heure1, heure2, heure3, heure4, heure5, heure6, heure7, heure8, heure9, heure10, heure11, heure12, heure13, heure14, heure15, heure16, heure17, heure18, heure19, heure20, heure21, heure22, heure23,total, probA) VALUES ({}, {}, '{}', {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},'{}');"

        # Verifier si les int sont remplies sinon mettre -1 (A modifier)
        if heure_0 == '':
            heure_0 = -1
        if heure_1 == '':
            heure_1 = -1
        if heure_2 == '':
            heure_2 = -1
        if heure_3 == '':
            heure_3 =  -1
        if heure_4 == '':
            heure_4 = -1
        if heure_5 == '':
            heure_5 = -1
        if heure_6 == '':
            heure_6 = -1
        if heure_7 == '':
            heure_7 = -1
        if heure_8 == '':
            heure_8 = -1
        if heure_9 == '':
            heure_9 = -1
        if heure_10 == '':
            heure_10 = -1
        if heure_11 == '':
            heure_11 = -1
        if heure_12 == '':
            heure_12 = -1
        if heure_13 == '':
            heure_13 = -1
        if heure_14 == '':
            heure_14 = -1
        if heure_15 == '':
            heure_15 = -1
        if heure_16 == '':
            heure_16 = -1
        if heure_17 == '':
            heure_17 = -1
        if heure_18 == '':
            heure_18 = -1
        if heure_19 == '':
            heure_19 = -1
        if heure_20 == '':
            heure_20 = -1
        if heure_21 == '':
            heure_21 = -1
        if heure_22 == '':
            heure_22 = -1
        if heure_23 == '':
            heure_23 = -1
        
        # Écrire la requête SQL pour cette mesure
        sql_insert = sql_query.format(idReleve,unCompteur,laDate, heure_0, heure_1, heure_2, heure_3, heure_4, heure_5, heure_6, heure_7, heure_8, heure_9, heure_10, heure_11, heure_12, heure_13, heure_14, heure_15, heure_16, heure_17, heure_18, heure_19, heure_20, heure_21, heure_22, heure_23,total, probA)

        # Écrire la requête SQL dans le fichier
        with open('../scriptRemplissageSQL/ReleveInsert.sql', 'a') as sql_file:
            sql_file.write(sql_insert + '\n')
