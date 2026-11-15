SELECT referral_id, patient_id, referral_date, department_id, status
FROM referrals
WHERE department_id IS NULL
ORDER BY referral_id ASC;