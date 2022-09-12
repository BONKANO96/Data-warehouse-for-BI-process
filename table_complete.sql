

CREATE OR REPLACE DIRECTORY RepertoireSrc AS 
'C:\Users\bonkano\Desktop\rep';
CREATE OR REPLACE DIRECTORY RepertoireLog AS 
'C:\Users\bonkano\Desktop\rep\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('completeData');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE completeData';
 END IF;
END;
/

CREATE TABLE completeData (
customer_id NUMBER,
name VARCHAR2(50),
pays VARCHAR2(20),
sexe VARCHAR2(10),
age NUMBER,
nombre_projet NUMBER,
compte_id NUMBER,
solde NUMBER,
age_compte NUMBER,
creditScore NUMBER,
id NUMBER,
valeur_credit NUMBER,
valeur_creditRejete NUMBER,
DueToTheBanq NUMBER,
etatDuPret VARCHAR2(25),
num_status NUMBER,
IsActiveMember NUMBER,
EstimatedSalary NUMBER,
HasCreditCard NUMBER,
exited NUMBER
)
ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY monRepertoireSrc
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY '\n'
        SKIP 0
        CHARACTERSET UTF8
        BADFILE monRepertoireLog:'import.données.bad'
        LOGFILE monRepertoireLog:'import.données.log'
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        )
    LOCATION ('donnees.csv'))
REJECT LIMIT UNLIMITED;