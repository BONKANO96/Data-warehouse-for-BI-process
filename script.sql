SET colsep ,    
SET pagesize 0   
SET trimspool ON  
SPOOL D:\requétes\age.csv
select s.exited as Etat, count(*) as effectif,c.age_compte
FROM faitDepart f, dimension_statusDuClent s, dimension_compte c
where f.status=s.num_status AND c.compte_id=f.compte --AND s.exited='Leave'
GROUP BY s.exited,c.age_compte order by c.age_compte;
SPOOL OFF
