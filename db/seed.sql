-- USE ak26db;

-- Optional (recommended during loading)
SET FOREIGN_KEY_CHECKS = 0;

-- =========================================
-- Insert into Organization
-- =========================================
INSERT INTO Organization (organization_name, org_type, phone, email, website) VALUES
('HealthAid Foundation', 'Nonprofit', '301-555-1001', 'contact@healthaid.org', 'www.healthaid.org'),
('CareConnect Agency', 'Government', '301-555-1002', 'info@careconnect.gov', 'www.careconnect.gov'),
('Medical Relief Network', 'Nonprofit', '301-555-1003', 'support@mrn.org', 'www.mrn.org'),
('Wellness Support Center', 'Community', '301-555-1004', 'help@wellnesscenter.org', 'www.wellnesscenter.org'),
('Family Health Access', 'Nonprofit', '301-555-1005', 'admin@familyhealth.org', 'www.familyhealth.org'),
('Affordable Care Partners', 'Private', '301-555-1006', 'service@acpartners.com', 'www.acpartners.com');

-- =========================================
-- Insert into Program
-- =========================================
INSERT INTO Program (organization_id, program_name, description, eligibility_criteria, benefit_type, application_deadline) VALUES
(1, 'Prescription Assistance Program', 'Helps low-income patients pay for medications.', 'Income below 200% of poverty line', 'Medication Support', '2026-06-30'),
(2, 'Child Health Coverage Plan', 'Provides healthcare support for eligible children.', 'Families with uninsured children', 'Insurance Support', '2026-07-15'),
(3, 'Senior Medical Aid', 'Assistance for seniors with medical expenses.', 'Age 65 or older', 'Financial Aid', '2026-08-01'),
(4, 'Emergency Treatment Grant', 'Short-term financial help for urgent treatment.', 'Medical emergency with documented need', 'Emergency Grant', '2026-05-20'),
(5, 'Maternal Care Assistance', 'Support for prenatal and postnatal care.', 'Pregnant women with financial need', 'Care Support', '2026-06-10'),
(6, 'Chronic Illness Support Program', 'Assistance for patients managing chronic diseases.', 'Diagnosis of chronic illness and income verification', 'Treatment Assistance', '2026-09-01');

-- =========================================
-- Insert into ApplicantUser
-- =========================================
INSERT INTO ApplicantUser (first_name, last_name, date_of_birth, email, phone, city, state) VALUES
('John', 'Smith', '1990-04-15', 'john.smith@email.com', '240-555-2001', 'Frederick', 'MD'),
('Emily', 'Johnson', '1985-09-22', 'emily.johnson@email.com', '240-555-2002', 'Rockville', 'MD'),
('Michael', 'Brown', '1978-01-10', 'michael.brown@email.com', '240-555-2003', 'Baltimore', 'MD'),
('Sarah', 'Davis', '1995-07-08', 'sarah.davis@email.com', '240-555-2004', 'Hagerstown', 'MD'),
('David', 'Wilson', '1988-11-30', 'david.wilson@email.com', '240-555-2005', 'Gaithersburg', 'MD'),
('Olivia', 'Martinez', '1992-03-18', 'olivia.martinez@email.com', '240-555-2006', 'Silver Spring', 'MD');

-- =========================================
-- Insert into Application
-- =========================================
INSERT INTO Application (user_id, program_id, application_date, status, notes) VALUES
(1, 1, '2026-04-01', 'Pending', 'Submitted income documents.'),
(2, 2, '2026-04-03', 'Approved', 'Eligible for full child coverage support.'),
(3, 3, '2026-04-05', 'Under Review', 'Medical expense receipts attached.'),
(4, 4, '2026-04-07', 'Rejected', 'Missing proof of emergency treatment.'),
(5, 5, '2026-04-09', 'Pending', 'Awaiting physician verification.'),
(6, 6, '2026-04-11', 'Approved', 'Qualified based on chronic illness documentation.');

-- Turn checks back on
SET FOREIGN_KEY_CHECKS = 1;