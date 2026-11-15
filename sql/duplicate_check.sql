-- Candidate matches require source-document review, not automatic deletion.
SELECT referral_date, patient_id, department_id, COUNT(*) AS duplicate_count
FROM referrals
GROUP BY referral_date, patient_id, department_id
HAVING COUNT(*) > 1;
