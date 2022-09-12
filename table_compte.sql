

CREATE OR REPLACE DIRECTORY RepertoireSrc AS 
'C:\Users\bonkano\Desktop\rep';
CREATE OR REPLACE DIRECTORY RepertoireLog AS 
'C:\Users\bonkano\Desktop\rep\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('compte_bancaire');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE compte_bancaire';
 END IF;
END;
/

CREATE TABLE compte_bancaire (
compte_id NUMBER,
solde NUMBER,
age_compte NUMBER,
creditScore NUMBER
)
ORGANIZATION EXTERNAL(
	TYPE ORACLE_LOADER
    DEFAULT DIRECTORY monRepertoireSrc
    ACCESS PARAMETERS(
    	RECORDS DELIMITED BY '\n'
        SKIP 0
        CHARACTERSET UTF8
        BADFILE monRepertoireLog:'import.compte_bancaire.bad'
        LOGFILE monRepertoireLog:'import.compte_bancaire.log'
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        )
    LOCATION ('Data_compte (1).csv'))
REJECT LIMIT UNLIMITED;