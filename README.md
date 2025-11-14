# 🏥 Hospital Management System (HMS) Database

## 📄 Overview
This project contains the SQL backend for a **Hospital Management System**. It is a relational database designed to manage the administrative and clinical data of a healthcare facility. The system handles complex relationships between medical staff (Physicians, Nurses), patients, departments, and medical procedures.

The database is populated with sample data (featuring easter eggs from the TV show *Scrubs*) to demonstrate functionality immediately upon import.

## 🗄️ Database Schema
The database `HMS` consists of the following normalized tables:

### 1. Staff Management
* **`PHYSICIAN`**: Stores doctor details including `EMPLOYEE_ID`, Name, and Position.
* **`NURSE`**: Stores nurse details. Uses a Foreign Key to link nurses to their supervising `PHYSICIAN`.
* **`AFFLIATED_WITH`**: A junction table establishing a Many-to-Many relationship between Physicians and Departments.

### 2. Patient Care
* **`PATIENT`**: Stores demographics (Name, Address, Phone) and links the patient to a primary care `PHYSICIAN`.
* **`PATIENT_DIAGNOSIS`**: The core transactional table. It records:
    * The diagnosis and prescription.
    * Links to the `PATIENT`.
    * Links to the treating `PHYSICIAN`.
    * Links to the specific `PROCEDURE_CODE`.

### 3. Hospital Administration
* **`DEPARTMENTS`**: Manages hospital wings (e.g., Surgery, Cardiology) and identifies the Department Head (linked to `PHYSICIAN`).
* **`PROCEDURES`**: A catalog of medical services (e.g., MRI, X-Ray) and their associated costs.

## 🛠️ Tech Stack
* **Database Engine:** MySQL
* **Language:** SQL (DDL & DML)

## 🚀 How to Run

1.  **Prerequisites:** Ensure you have MySQL Server and a client (like MySQL Workbench, DBeaver, or Command Line) installed.
2.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
    ```
3.  **Import the Script:**
    * Open your SQL Client.
    * Open the file `HMS database script.sql`.
    * Execute the script.
    * *Note: The script automatically creates the database named `HMS`.*

## 🔍 Sample Queries

The script includes basic `SELECT *` commands, but here are some advanced queries you can run to test the relationships:

**1. View Patient Medical History (Joins)**
*Retrieves the patient's name, their diagnosis, the procedure performed, and the treating doctor.*
```sql
SELECT 
    P.PATIENT_NAME, 
    PD.DIAGNOSIS, 
    PD.PRESCRIPTION, 
    PR.NAME AS PROCEDURE_NAME, 
    DOC.NAME AS DOCTOR_NAME
FROM PATIENT_DIAGNOSIS PD
JOIN PATIENT P ON PD.PATIENT_ID = P.PATIENT_ID
JOIN PROCEDURES PR ON PD.PROCEDURE_CODE = PR.CODE
JOIN PHYSICIAN DOC ON PD.PHYSICIAN_ID = DOC.EMPLOYEE_ID;