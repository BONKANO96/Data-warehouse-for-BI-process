

CREATE OR REPLACE DIRECTORY RepertoireSrc AS 
'C:\Users\bonkano\Desktop\rep';
CREATE OR REPLACE DIRECTORY RepertoireLog AS 
'C:\Users\bonkano\Desktop\rep\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('credit');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE credit';
 END IF;
END;
/

CREATE TABLE credit (
    id NUMBER,
    valeur_credit NUMBER,
    valeur_creditRejete NUMBER,
    Due NUMBER,
    status_credit VARCHAR2(25)
)
ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY monRepertoireSrc
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY '\n'
        SKIP 0
        CHARACTERSET UTF8
        BADFILE monRepertoireLog:'import.credit.bad'
        LOGFILE monRepertoireLog:'import.credit.log'
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        )
    LOCATION ('newpret.csv'))
REJECT LIMIT UNLIMITED;

