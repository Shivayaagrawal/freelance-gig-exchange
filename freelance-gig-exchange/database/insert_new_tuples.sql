
USE freelance_gig_exchange;


INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) 
VALUES 
('New Freelancer', 'new.freelancer@example.com', '9876543210', 'Mumbai', 'Expert', 4.5, 25, '2024-01-01');


INSERT INTO clients (name, email, organization, location, member_since) 
VALUES 
('New Client Company', 'contact@newclient.com', 'New Client Organization', 'Bangalore', '2024-01-01');


INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience) 
VALUES 
(1, 1, 'Advanced', 5);


INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status) 
VALUES 
(1, 1, 'New Project Title', 'Detailed description of the project requirements and scope', 150000.00, '2024-03-01', '2024-04-01', 'Open');

-- =====================================================
-- 7. INSERT NEW APPLICATION
-- =====================================================
-- First, get gig_id and freelancer_id:
-- SELECT gig_id, title FROM gigs;
-- SELECT freelancer_id, name FROM freelancers;
-- Then insert (replace 1, 1 with actual IDs):
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status) 
VALUES 
(1, 1, 'I have extensive experience in this field and can deliver high-quality work within the specified timeline.', 140000.00, '2024-03-02', 'Pending');

-- =====================================================
-- 8. INSERT NEW CONTRACT
-- =====================================================
-- First, get application_id (must be Approved):
-- SELECT application_id, gig_id, freelancer_id FROM applications WHERE status = 'Approved';
-- Then insert (replace 1 with actual application_id):
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count) 
VALUES 
(1, '2024-03-05', '2024-04-01', 'Active', 140000.00, 2);

-- =====================================================
-- 9. INSERT NEW PAYMENT
-- =====================================================
-- First, get contract_id:
-- SELECT contract_id, total_payment FROM contracts;
-- Then insert (replace 1 with actual contract_id):
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) 
VALUES 
(1, 70000.00, '2024-03-05', 'UPI', 'Paid', 'UPI987654321');

-- =====================================================
-- 10. INSERT NEW REVIEW
-- =====================================================
-- First, get contract_id (contract should be Completed):
-- SELECT contract_id FROM contracts WHERE work_status = 'Completed';
-- Then insert (replace 1 with actual contract_id):
INSERT INTO reviews (contract_id, rating, comments, review_date) 
VALUES 
(1, 5, 'Excellent work! Very professional and delivered on time with high quality.', '2024-04-02');

-- =====================================================
-- 11. INSERT NEW MESSAGE
-- =====================================================
-- First, get client_id and freelancer_id:
-- SELECT client_id, name FROM clients;
-- SELECT freelancer_id, name FROM freelancers;
-- Then insert (replace IDs with actual values):
-- For Client to Freelancer:
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES 
('Client', 1, 1, 'Hello! I would like to discuss the project details with you.', '2024-03-01 10:30:00', FALSE);



COMMIT;



