SELECT referrals.referral_id, patients.patient_name,
       departments.department_name,
       DATE '2026-11-12' - referrals.referral_date AS days_waiting
FROM referrals
INNER JOIN patients
ON referrals.patient_id = patients.patient_id
LEFT JOIN departments
ON referrals.department_id = departments.department_id
WHERE referrals.status = 'Pending'
  AND (DATE '2026-11-12' - referrals.referral_date) > 14
ORDER BY days_waiting DESC;
