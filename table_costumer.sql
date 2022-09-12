

CREATE OR REPLACE DIRECTORY RepertoireSrc AS 
'C:\Users\bonkano\Desktop\rep';
CREATE OR REPLACE DIRECTORY RepertoireLog AS 
'C:\Users\bonkano\Desktop\rep\log';

DECLARE
 c int;
BEGIN
 SELECT count(*) INTO c FROM user_tables WHERE table_name = upper('customer');
 IF c = 1 THEN
  EXECUTE IMMEDIATE 'DROP TABLE customer';
 END IF;
END;
/

CREATE TABLE customer (
customer_id NUMBER,
name VARCHAR2(50),
pays VARCHAR2(20),
sexe VARCHAR2(10),
age NUMBER,
nombre_projet NUMBER
)
ORGANIZATION EXTERNAL(
	TYPE ORACLE_LOADER
    DEFAULT DIRECTORY monRepertoireSrc
    ACCESS PARAMETERS(
    	RECORDS DELIMITED BY '\n'
        SKIP 0
        CHARACTERSET UTF8
        BADFILE monRepertoireLog:'import.customer.bad'
        LOGFILE monRepertoireLog:'import.customer.log'
        FIELDS TERMINATED BY ','
        OPTIONALLY ENCLOSED BY '"'
        )
    LOCATION ('dataCostumer.csv'))
REJECT LIMIT UNLIMITED;