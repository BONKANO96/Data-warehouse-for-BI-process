

CREATE OR REPLACE DIRECTORY RepertoireSrc AS 
'C:\Users\bonkano\Desktop\rep';
CREATE OR REPLACE DIRECTORY RepertoireLog AS 
'C:\Users\bonkano\Desktop\rep\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('status');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE status';
 END IF;
END;
/

CREATE TABLE status (
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
        BADFILE monRepertoireLog:'import.status.bad'
        LOGFILE monRepertoireLog:'import.status.log'
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        )
    LOCATION ('Data_statut_client.csv'))
REJECT LIMIT UNLIMITED;