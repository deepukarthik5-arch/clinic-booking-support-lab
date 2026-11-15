# Clinic Booking Support Lab

A guided PostgreSQL portfolio project by Deepu Karthik, practising application support investigations with synthetic healthcare-style data.

## Results

- 100 fictional patients, 200 referrals and 3 departments.
- Identified 11 referrals without an assigned department.
- Found 30 Pending referrals waiting more than 14 days as of 12 November 2026; waits ranged from 16 to 28 days, including 2 records without a department.
- Practised targeted updates, COMMIT, ROLLBACK and a temporary duplicate-detection test.

All data is fictional. Pending is a database status, not evidence of clinical priority or triage status. Missing departments remain unresolved until confirmed by the responsible team.

## Reproduce

1. Create a new empty PostgreSQL database in pgAdmin.
2. Run `sql/00_setup.sql` once in its Query Tool. This recreates the final dataset after the guided corrections to referrals 103 and 105.
3. Run either investigation query in `sql/`.
4. Compare results with `exports/`. Rows with equal waiting times may appear in a different order. CSV exports use the text NULL for missing departments.

The setup creates tables and will fail if they already exist; it does not delete existing tables. Use a separate practice database. This is a small learning dataset, not a production clinical system.

## Files

- `sql/00_setup.sql`: schema and synthetic dataset.
- `sql/missing_department_check.sql`: missing-department investigation.
- `sql/overdue_pending_referrals.sql`: joined waiting-time investigation.
- `sql/duplicate_check.sql`: flags repeated patient/department/date combinations for review; a match does not prove duplication.
- `exports/`: results exported and checked during the project.
- `docs/investigation_notes.txt`: investigation findings and next actions.

## Skills practised

SELECT, WHERE, IS NULL, INNER JOIN, LEFT JOIN, GROUP BY, HAVING, COUNT, date subtraction, sorting, result validation, CSV export and transaction safety.

Built through guided exercises with AI-assisted explanations and packaging. Independent recall and further practice are ongoing.

