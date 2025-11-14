-- 1. Write a query in SQL to obtain the name of the physician in alphabetical order
SELECT NAME FROM PHYSICIAN
ORDER BY NAME ASC;

-- 2. Write a query in SQL to obtain the full name of the patients whose gender is male.
SELECT CONCAT(PATIENT_NAME," ",SURNAME) AS FULL_NAME
FROM PATIENT WHERE GENDER = "MALE";

-- 3. Write a query in SQL to find the name of the nurse who are the head of their department and are registered.
SELECT NAME FROM NURSE
WHERE POSITION = "HEAD NURSE" 
AND REGISTERED = "YES";

-- 4. Write a query in SQL to find the name of the nurse who are Team Leader or not registered.
SELECT NAME FROM NURSE
WHERE POSITION = "TEAM LEADER"
OR REGISTERED = "NO";

-- 5. Write a query to obtain the avg cost of all the medical procedures.
SELECT AVG(COST) FROM PROCEDURES;

-- 6. Write a query to obtain name and cost of the procedure whose cost is greater than 2000.
SELECT NAME,COST FROM PROCEDURES
WHERE COST > 2000;

-- 7. Write a query to update the name of the patient to Robert Fernandez having patient id as 5.
UPDATE patient
SET PATIENT_NAME = "Robert Fernandez"
WHERE PATIENT_ID = 5;

-- 8. Write a query to drop phone column from patient table.
ALTER TABLE patient
DROP COLUMN PHONE;

-- 9. Second maximum cost of medical procedure
SELECT * FROM PROCEDURES
ORDER BY COST DESC LIMIT 1 OFFSET 1;

SELECT MAX(COST) FROM PROCEDURES
WHERE COST < (SELECT MAX(COST) FROM PROCEDURES);

-- 10. Write a query in SQL to obtain the name of the patients starting with letter A
SELECT PATIENT_NAME FROM PATIENT
WHERE PATIENT_NAME LIKE 'A%';

-- 11. Write a query in SQL to obtain the name of the patients whose third letter is M.
SELECT PATIENT_NAME FROM PATIENT
WHERE PATIENT_NAME LIKE '__M%';

-- 12. Write a query in SQL to obtain the name of the patients whose name start with letter J and ends with Z.
SELECT PATIENT_NAME FROM PATIENT
WHERE PATIENT_NAME LIKE 'J%' AND
PATIENT_NAME LIKE '%Z';

-- 13. Write a query to obtain patient details having patient id 11 to 20.
SELECT * FROM patient
WHERE PATIENT_ID between 11 AND 20;

-- 14.  Write a query in SQL to obtain the name of the physicians who are the head of each department
SELECT  PHYSICIAN.NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM PHYSICIAN
INNER JOIN DEPARTMENTS
ON PHYSICIAN.EMPLOYEE_ID = DEPARTMENTS.DEPARTMENT_HEAD_ID;

-- 15. Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatment
SELECT PATIENT.PATIENT_NAME, PHYSICIAN.NAME
FROM PHYSICIAN
INNER JOIN PATIENT
ON PHYSICIAN.EMPLOYEE_ID = PATIENT.PHYSICIAN_ID;

-- 16. Write a query in SQL to obtain the name of the physician with the department who are done with affiliation.
SELECT PHYSICIAN.NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM PHYSICIAN
INNER JOIN AFFLIATED_WITH
ON PHYSICIAN.EMPLOYEE_ID = AFFLIATED_WITH.PHYSICIAN_ID
INNER JOIN DEPARTMENTS
ON AFFLIATED_WITH.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 17. Write a query to obtain physician name, position and department they are affiliated with.
SELECT PHYSICIAN.NAME, PHYSICIAN.POSITION,DEPARTMENTS.DEPARTMENT_NAME
FROM PHYSICIAN
INNER JOIN AFFLIATED_WITH
ON PHYSICIAN.EMPLOYEE_ID = AFFLIATED_WITH.PHYSICIAN_ID
INNER JOIN DEPARTMENTS
ON AFFLIATED_WITH.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 18. Write a query in SQL to obtain the patient name from which physician they get primary checkup and also mention the patient diagnosis with prescription.
SELECT PATIENT.PATIENT_NAME, PHYSICIAN.NAME, PATIENT_DIAGNOSIS.DIAGNOSIS
FROM PHYSICIAN
INNER JOIN PATIENT_DIAGNOSIS
ON PHYSICIAN.EMPLOYEE_ID = PATIENT_DIAGNOSIS.PHYSICIAN_ID
INNER JOIN patient
ON PATIENT.PATIENT_ID = PATIENT_DIAGNOSIS.PATIENT_ID;

-- 19. Write a query in SQL to obtain the maximum cost of the medical procedure.
SELECT NAME, COST 
FROM PROCEDURES
WHERE COST = (SELECT MAX(COST) FROM PROCEDURES);

-- 20. Write a query in SQL to obtain the details of patient who has diagnosed with chronic pain.
SELECT *
FROM patient
WHERE PATIENT_ID IN (SELECT PATIENT_ID FROM 
PATIENT_DIAGNOSIS WHERE DIAGNOSIS = "CHRONIC PAIN");

-- 21. Write a query in SQL to obtain the procedure name and cost whose cost is greater than the avg cost of all the procedure.
SELECT NAME, COST
FROM PROCEDURES
WHERE COST > (SELECT AVG(COST) FROM PROCEDURES);

-- 22. Write a query in SQL to obtain the procedure name and cost whose cost is less than the avg cost of all the procedure.
SELECT NAME, COST
FROM PROCEDURES
WHERE COST < (SELECT AVG(COST) FROM PROCEDURES);

-- 23. Write a query in SQL to obtain the physician name who are either head chief or senior in their respective department.
SELECT * FROM PHYSICIAN
WHERE POSITION LIKE "HEAD CHIEF%" OR
POSITION LIKE "SENIOR%";

-- 24.  Write a query in SQL to obtain the employee id, physician name and position whose primary affiliation has not been done. 
SELECT EMPLOYEE_ID,NAME,position
FROM PHYSICIAN
WHERE EMPLOYEE_ID NOT IN (SELECT PHYSICIAN_ID
FROM AFFLIATED_WITH);