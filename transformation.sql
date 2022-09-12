--Les donnees complétes enrégistrées 
drop table t_completeData;
CREATE OR REPLACE TYPE completeData_TYPE AS OBJECT (
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
  exited NUMBER,
  MEMBER FUNCTION get_customer_id RETURN NUMBER,
  MEMBER FUNCTION get_pays RETURN VARCHAR2,
  MEMBER FUNCTION get_sexe RETURN VARCHAR2,
  MEMBER FUNCTION get_age RETURN NUMBER,
  MEMBER FUNCTION get_nombre_projet RETURN NUMBER,
  MEMBER FUNCTION get_name RETURN VARCHAR2,
  MEMBER FUNCTION get_compte_id RETURN NUMBER,
  MEMBER FUNCTION get_solde RETURN NUMBER,
  MEMBER FUNCTION get_creditScore RETURN NUMBER,
  MEMBER FUNCTION get_age_compte RETURN NUMBER,
  MEMBER FUNCTION get_id RETURN NUMBER,
  MEMBER FUNCTION get_valCredit RETURN NUMBER,
  MEMBER FUNCTION get_valCreditRejette RETURN NUMBER,
  MEMBER FUNCTION get_due RETURN NUMBER,
  MEMBER FUNCTION get_etatDuPret RETURN VARCHAR2,
  MEMBER FUNCTION get_num_status RETURN NUMBER,
  MEMBER FUNCTION get_isActiveMember RETURN VARCHAR2,
  MEMBER FUNCTION get_hasCrCard RETURN VARCHAR2,
  MEMBER FUNCTION get_estimatedSalary RETURN NUMBER,
  MEMBER FUNCTION get_exited RETURN VARCHAR2);
/
show errors;
CREATE OR REPLACE TYPE BODY completeData_TYPE AS 
   MEMBER FUNCTION get_customer_id RETURN NUMBER IS
   BEGIN
      RETURN customer_id;
   END;

   MEMBER FUNCTION get_pays RETURN VARCHAR2 IS
   BEGIN
      RETURN pays;
   END;

   MEMBER FUNCTION get_sexe RETURN VARCHAR2 IS
   BEGIN
      RETURN sexe;
   END;

   MEMBER FUNCTION get_name RETURN VARCHAR2 IS
   BEGIN
      RETURN name;
   END;

   MEMBER FUNCTION get_nombre_projet RETURN NUMBER IS
   BEGIN
      RETURN nombre_projet;
   END;

   MEMBER FUNCTION get_age RETURN NUMBER IS
   BEGIN
      RETURN age;
   END;

   MEMBER FUNCTION get_compte_id RETURN NUMBER IS
   BEGIN
      RETURN compte_id;
   END;

   MEMBER FUNCTION get_solde RETURN NUMBER IS
   BEGIN
      RETURN solde;
   END;

   MEMBER FUNCTION get_age_compte RETURN NUMBER IS
   BEGIN
      RETURN age_compte;
   END;

   MEMBER FUNCTION get_creditScore RETURN NUMBER IS
   BEGIN
      RETURN creditScore;
   END;

   MEMBER FUNCTION get_id RETURN NUMBER IS
   BEGIN
      RETURN id;
   END;

   MEMBER FUNCTION get_valCredit RETURN NUMBER IS
   BEGIN
      RETURN valeur_credit;
   END;

   MEMBER FUNCTION get_valCreditRejette RETURN NUMBER IS
   BEGIN
      RETURN valeur_creditRejete;
   END;

   MEMBER FUNCTION get_due RETURN NUMBER IS
   BEGIN
      RETURN DueToTheBanq;
   END;

   MEMBER FUNCTION get_etatDuPret RETURN VARCHAR2 IS
   BEGIN
      RETURN etatDuPret;
   END;

    MEMBER FUNCTION get_num_status RETURN NUMBER IS
   BEGIN
      RETURN num_status;
   END;

   MEMBER FUNCTION get_isActiveMember RETURN VARCHAR2 IS
   v VARCHAR2(3);
   BEGIN
       IF IsActiveMember=1 THEN
             v:='Yes';
       ELSE 
             v:='No';
       END IF;
       RETURN v;
   END;

   MEMBER FUNCTION get_hasCrCard RETURN VARCHAR2 IS
   v VARCHAR2(3);
   BEGIN
       IF HasCreditCard=1 THEN
             v:='Yes';
       ELSE 
             v:='No';
       END IF;
       RETURN v;
   END;

   MEMBER FUNCTION get_estimatedSalary RETURN NUMBER IS
   BEGIN
      RETURN EstimatedSalary;
   END;

   MEMBER FUNCTION get_exited RETURN VARCHAR2 IS
   v VARCHAR2(5);
   BEGIN
       IF exited=1 THEN
             v:='Leave';
       ELSE 
             v:='Stay';
       END IF;
       RETURN v;
   END;






 END;
 /
show errors;
CREATE TABLE t_completeData OF completeData_TYPE;
INSERT INTO t_completeData SELECT * FROM completeData;













































CREATE OR REPLACE TYPE CUSTOMER_TYPE AS OBJECT (
	customer_id NUMBER,
  name VARCHAR2(50),
  pays VARCHAR2(20),
  sexe VARCHAR2(10),
  age NUMBER,
  nombre_projet NUMBER,
	MEMBER FUNCTION get_customer_id RETURN NUMBER,
  MEMBER FUNCTION get_pays RETURN VARCHAR2,
  MEMBER FUNCTION get_sexe RETURN VARCHAR2,
  MEMBER FUNCTION get_age RETURN NUMBER,
  MEMBER FUNCTION get_nombre_projet RETURN NUMBER,
	MEMBER FUNCTION get_name RETURN VARCHAR2);
/
show errors;
CREATE OR REPLACE TYPE BODY CUSTOMER_TYPE AS 
   MEMBER FUNCTION get_customer_id RETURN NUMBER IS
   BEGIN
      RETURN customer_id;
   END;

   MEMBER FUNCTION get_pays RETURN VARCHAR2 IS
   BEGIN
      RETURN pays;
   END;

   MEMBER FUNCTION get_sexe RETURN VARCHAR2 IS
   BEGIN
      RETURN sexe;
   END;

   MEMBER FUNCTION get_name RETURN VARCHAR2 IS
   BEGIN
      RETURN name;
   END;

   MEMBER FUNCTION get_nombre_projet RETURN NUMBER IS
   BEGIN
      RETURN nombre_projet;
   END;

   MEMBER FUNCTION get_age RETURN NUMBER IS
   BEGIN
      RETURN age;
   END;



 END;
 /
show errors;
CREATE TABLE t_customer OF CUSTOMER_TYPE
( CONSTRAINT PK_customer PRIMARY KEY (customer_id));

ALTER TABLE t_customer DISABLE CONSTRAINT PK_customer;

INSERT INTO t_customer(customer_id,name,pays,sexe,age,nombre_projet) SELECT customer_id,name,pays,sexe,age,nombre_projet FROM CUSTOMER;

ALTER TABLE t_customer ENABLE CONSTRAINT PK_customer;
















































CREATE OR REPLACE TYPE COMPTE_BANCAIRE_TYPE AS OBJECT (
  compte_id NUMBER,
  solde NUMBER,
  age_compte NUMBER,
  creditScore NUMBER,
  MEMBER FUNCTION get_compte_id RETURN NUMBER,
  MEMBER FUNCTION get_solde RETURN NUMBER,
  MEMBER FUNCTION get_creditScore RETURN NUMBER,
  MEMBER FUNCTION get_age_compte RETURN NUMBER);
/
show errors;
CREATE OR REPLACE TYPE BODY COMPTE_BANCAIRE_TYPE AS 
   MEMBER FUNCTION get_compte_id RETURN NUMBER IS
   BEGIN
      RETURN compte_id;
   END;

   MEMBER FUNCTION get_solde RETURN NUMBER IS
   BEGIN
      RETURN solde;
   END;

   MEMBER FUNCTION get_age_compte RETURN NUMBER IS
   BEGIN
      RETURN age_compte;
   END;

   MEMBER FUNCTION get_creditScore RETURN NUMBER IS
   BEGIN
      RETURN creditScore;
   END;



 END;
 /
show errors;
CREATE TABLE t_account OF COMPTE_BANCAIRE_TYPE
( CONSTRAINT PK_account PRIMARY KEY (compte_id));

ALTER TABLE t_account DISABLE CONSTRAINT PK_account;

INSERT INTO t_account(compte_id,solde,age_compte,creditScore) SELECT compte_id,solde,age_compte,creditScore FROM COMPTE_BANCAIRE;

ALTER TABLE t_account ENABLE CONSTRAINT PK_account;








































drop table t_status;
CREATE OR REPLACE TYPE STATUT_CLIENT_TYPE AS OBJECT (
  num_status NUMBER,
  IsActiveMember NUMBER,
  HasCreditCard NUMBER,
  EstimatedSalary NUMBER,
  exited NUMBER,
  MEMBER FUNCTION get_num_status RETURN NUMBER,
  MEMBER FUNCTION get_isActiveMember RETURN VARCHAR2,
  MEMBER FUNCTION get_hasCrCard RETURN VARCHAR2,
  MEMBER FUNCTION get_estimatedSalary RETURN NUMBER,
  MEMBER FUNCTION get_exited RETURN VARCHAR2);
/
show errors;
SET SERVEROUTPUT ON;
CREATE OR REPLACE TYPE BODY STATUT_CLIENT_TYPE AS 
   MEMBER FUNCTION get_num_status RETURN NUMBER IS
   BEGIN
      RETURN num_status;
   END;

   MEMBER FUNCTION get_isActiveMember RETURN VARCHAR2 IS
   v VARCHAR2(3);
   BEGIN
       IF IsActiveMember=1 THEN
             v:='Yes';
       ELSE 
             v:='No';
       END IF;
       RETURN v;
   END;

   MEMBER FUNCTION get_hasCrCard RETURN VARCHAR2 IS
   v VARCHAR2(3);
   BEGIN
       IF HasCreditCard=1 THEN
             v:='Yes';
       ELSE 
             v:='No';
       END IF;
       RETURN v;
   END;

   MEMBER FUNCTION get_estimatedSalary RETURN NUMBER IS
   BEGIN
      RETURN EstimatedSalary;
   END;

   MEMBER FUNCTION get_exited RETURN VARCHAR2 IS
   v VARCHAR2(5);
   BEGIN
       IF exited=1 THEN
             v:='Leave';
       ELSE 
             v:='Stay';
       END IF;
       RETURN v;
   END;



 END;
 /
show errors;
CREATE TABLE t_status OF STATUT_CLIENT_TYPE
( CONSTRAINT PK_status PRIMARY KEY (num_status));

ALTER TABLE t_status DISABLE CONSTRAINT PK_status;

INSERT INTO t_status(num_status,IsActiveMember,EstimatedSalary,HasCreditCard,exited) SELECT num_status,IsActiveMember,EstimatedSalary,HasCreditCard,exited FROM status;

ALTER TABLE t_status ENABLE CONSTRAINT PK_status;












































drop table t_pret;
CREATE OR REPLACE TYPE PRET_TYPE AS OBJECT (
  id NUMBER,
  valeur_credit NUMBER,
  valeur_creditRejette NUMBER,
  Due NUMBER,
  status_credit VARCHAR2(25),
  MEMBER FUNCTION get_id RETURN NUMBER,
  MEMBER FUNCTION get_valCredit RETURN NUMBER,
  MEMBER FUNCTION get_valCreditRejette RETURN NUMBER,
  MEMBER FUNCTION get_due RETURN NUMBER,
  MEMBER FUNCTION get_etatDuPret RETURN VARCHAR2);
/
show errors;
CREATE OR REPLACE TYPE BODY PRET_TYPE AS
   MEMBER FUNCTION get_id RETURN NUMBER IS
   BEGIN
      RETURN id;
   END;

   MEMBER FUNCTION get_valCredit RETURN NUMBER IS
   BEGIN
      RETURN valeur_credit;
   END;

   MEMBER FUNCTION get_valCreditRejette RETURN NUMBER IS
   BEGIN
      RETURN valeur_creditRejette;
   END;

   MEMBER FUNCTION get_due RETURN NUMBER IS
   BEGIN
      RETURN Due;
   END;

   MEMBER FUNCTION get_etatDuPret RETURN VARCHAR2 IS
   BEGIN
      RETURN status_credit;
   END;


 END;
 /
show errors;
CREATE TABLE t_pret OF PRET_TYPE
( CONSTRAINT PK_pret PRIMARY KEY (id));

ALTER TABLE t_pret DISABLE CONSTRAINT PK_pret;

INSERT INTO t_pret(id,valeur_credit,valeur_creditRejette,Due,status_credit) SELECT id,valeur_credit,valeur_creditRejete,Due,status_credit FROM credit;

ALTER TABLE t_pret ENABLE CONSTRAINT PK_pret;


