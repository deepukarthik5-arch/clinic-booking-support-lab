-- Run once in a new empty practice database. Synthetic data only.
BEGIN;
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL
);
CREATE TABLE referrals (
    referral_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    department_id INTEGER REFERENCES departments(department_id),
    referral_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);
INSERT INTO departments VALUES
(1, 'Oncology'), (2, 'Cardiology'), (3, 'Respiratory');
INSERT INTO patients VALUES
(1, 'Alex Morgan'), (2, 'Priya Shah'), (3, 'Daniel Reed'),
(4, 'Sara Ahmed'), (5, 'Jamie Taylor');
INSERT INTO patients
SELECT n, 'Test Patient ' || n FROM generate_series(6,100) AS n;
-- Final state: referral 103 assigned to Cardiology; 105 changed to Booked.
INSERT INTO referrals VALUES
(101,1,1,'2026-11-01','Pending'),
(102,2,2,'2026-11-02','Booked'),
(103,3,2,'2026-11-03','Pending'),
(104,4,1,'2026-11-04','Completed'),
(105,5,3,'2026-11-05','Booked'),
(106,1,2,'2026-11-06','Booked');
INSERT INTO referrals
SELECT 106+n, ((n-1)%100)+1,
       CASE WHEN n%17=0 THEN NULL ELSE ((n-1)%3)+1 END,
       DATE '2026-11-12'-(n%30),
       CASE WHEN n%3=0 THEN 'Completed'
            WHEN n%3=1 THEN 'Pending' ELSE 'Booked' END
FROM generate_series(1,194) AS n;
COMMIT;
