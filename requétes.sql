
--Mise en évidence de la 1ere vue

--impact de la variable age du compte sur le fait départ
select s.exited as Etat, count(*) as effectif,c.age_compte
FROM faitDepart f, dimension_statusDuClent s, dimension_compte c
where f.status=s.num_status AND c.compte_id=f.compte --AND s.exited='Leave'
GROUP BY s.exited,c.age_compte order by c.age_compte;
--age du compte est negligeable plus que tous les attribus de cette variable ont le memes taux de clients ayant quités: environ 20%

--impact de la variable solde du compte sur le fait départ
select s.exited as Etat, count(*) as effectif,c.solde
FROM faitDepart f, dimension_statusDuClent s, dimension_compte c
where f.status=s.num_status AND c.compte_id=f.compte --AND s.exited='Leave'
GROUP BY s.exited,c.solde order by effectif ;
--Prés de 25% des déshabonnes avaient leurs solde null avant leur depart



--impact de la variable active member du compte sur le fait départ
select s.exited as Etat, count(*) as effectif,s.IsActiveMember
FROM faitDepart f, dimension_statusDuClent s
where f.status=s.num_status 
GROUP BY s.exited,s.IsActiveMember order by effectif ;
--Environ 15% des clients actif on quittés contre 30% des clients non actifs, soit le double; ceux qui est logique
--Rappelons que est dit actif un client qui effectue ou recois pluxieurs transactions



--impact de la variable carte de crédit sur le fait départ
select s.exited as Etat, count(*) as effectif,s.HasCreditCard as CrCard
FROM faitDepart f, dimension_statusDuClent s
where f.status=s.num_status 
GROUP BY s.exited,s.HasCreditCard;









--cette variable impact faiblement sur le deshabonnement

































--Réquetes nécessaire a la mise en évidence de la 2e data mart

--impact de la variable salaire sur le fait départ
select s.exited as Etat, count(*) as effectif,s.EstimatedSalary as salaire
FROM faitDepart f, dimension_statusDuClent s
where f.status=s.num_status AND s.exited='Leave'
GROUP BY s.exited,s.EstimatedSalary order by s.EstimatedSalary;
--conclusion: le salaire n'intervient sur le déshabonnement des clients



--impact de la variable sexe de crédit sur le fait départ
select s.exited as Etat, count(*) as effectif,c.sexe
FROM faitDepart f, dimension_statusDuClent s, dimension_client c
where f.status=s.num_status AND c.customer_id=f.client
GROUP BY s.exited,c.sexe ;
--25% de femme contre prés de 17% d'hommes ont désértés la banque


--impact de la variable age de crédit sur le fait départ
select s.exited as Etat, count(*) as effectif,c.age
FROM faitDepart f, dimension_statusDuClent s, dimension_client c
where f.status=s.num_status AND c.customer_id=f.client-- AND s.exited='Leave'
GROUP BY s.exited,c.age order by c.age, effectif ;
-- On remarque que les personnes agées entre 38 et 67 ans borne non inclus ont le plus grand taux de déshabonnement,
--taux qui est compris entre prés de 20% à plus de 40%



--impact de la variable pays sur le fait départ
select s.exited as Etat, count(*) as effectif, c.age,c.sexe,c.pays,s.HasCreditCard as CrCard
FROM faitDepart f, dimension_statusDuClent s, dimension_client c
where f.status=s.num_status AND c.customer_id=f.client 
GROUP BY s.exited,c.age,c.sexe,c.pays,s.HasCreditCard order by c.age;
--On remarque le fait ne dépend pas trop de la variable pays vu que le fait étudié garde presque les memes attribus lorque l'origine des individus varient











































--Manipulation de la 3e vue

--impact de la variable crédit score du compte sur le fait départ
select s.exited as Etat, count(*) as effectif,c.creditScore
FROM faitDepart f, dimension_statusDuClent s, dimension_compte c
where f.status=s.num_status AND c.compte_id=f.compte 
GROUP BY s.exited,c.creditScore order by c.creditScore ;
--On remarque que les clients ayant un score inferieur à 407 on tous désértés la banque
--c'est à dire ts les clients ayant un dégré de solvabilité faible ont decides de quittes la banque, certainement du au fait
--qu'avec leurs scores ils ne pourrons point profité d'un préts auprés de la banque.


--impact de la variable  nombre de projet sur le fait départ
select s.exited as Etat, count(*) as effectif,c.nombre_projet
FROM faitDepart f, dimension_statusDuClent s, dimension_client c
where f.status=s.num_status AND c.customer_id=f.client 
GROUP BY s.exited,c.nombre_projet order by c.nombre_projet ;
--28% des clients qui ont un projet rejetté par la banque ont quités contre 8% pour ceux qui eu 2 projet rejettés
--Cependant ceux qui ont 3 voir 4 projet rejetés ont respectivement un taux de 82% et 100% de deshabonnement



--impact de la variable  état du prét sur le fait départ
select s.exited as Etat, count(*) as effectif,p.etatDuPret
FROM faitDepart f, dimension_statusDuClent s, dimension_pret p
where f.status=s.num_status AND p.id=f.pret 
GROUP BY s.exited,p.etatDuPret order by p.etatDuPret ;
--1.5% des clients qui ont rembourser complétement leur crédit bancaire ont quité contre 15% à 25% pour les autres attributs


