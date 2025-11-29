

USE freelance_gig_exchange;


INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
SELECT 
    CONCAT(
        CASE (FLOOR(RAND() * 20))
            WHEN 0 THEN 'Amit' WHEN 1 THEN 'Priya' WHEN 2 THEN 'Rajesh' WHEN 3 THEN 'Neha'
            WHEN 4 THEN 'Vikram' WHEN 5 THEN 'Sneha' WHEN 6 THEN 'Arjun' WHEN 7 THEN 'Deepika'
            WHEN 8 THEN 'Rahul' WHEN 9 THEN 'Shruti' WHEN 10 THEN 'Kiran' WHEN 11 THEN 'Manish'
            WHEN 12 THEN 'Pooja' WHEN 13 THEN 'Nikhil' WHEN 14 THEN 'Ritu' WHEN 15 THEN 'Sandeep'
            WHEN 16 THEN 'Meera' WHEN 17 THEN 'Gaurav' WHEN 18 THEN 'Sunita' WHEN 19 THEN 'Vishal'
        END,
        ' ',
        CASE (FLOOR(RAND() * 20))
            WHEN 0 THEN 'Sharma' WHEN 1 THEN 'Patel' WHEN 2 THEN 'Kumar' WHEN 3 THEN 'Verma'
            WHEN 4 THEN 'Singh' WHEN 5 THEN 'Joshi' WHEN 6 THEN 'Reddy' WHEN 7 THEN 'Gupta'
            WHEN 8 THEN 'Nair' WHEN 9 THEN 'Malhotra' WHEN 10 THEN 'Iyer' WHEN 11 THEN 'Agarwal'
            WHEN 12 THEN 'Desai' WHEN 13 THEN 'Rao' WHEN 14 THEN 'Tiwari' WHEN 15 THEN 'Jain'
            WHEN 16 THEN 'Shah' WHEN 17 THEN 'Yadav' WHEN 18 THEN 'Krishnan' WHEN 19 THEN 'Saxena'
        END
    ) as name,
    CONCAT('user', n, '@gmail.com') as email,
    CONCAT('9', FLOOR(RAND() * 900000000) + 100000000) as phone,
    CASE (FLOOR(RAND() * 10))
        WHEN 0 THEN 'Delhi' WHEN 1 THEN 'Mumbai' WHEN 2 THEN 'Bangalore' WHEN 3 THEN 'Chennai'
        WHEN 4 THEN 'Kolkata' WHEN 5 THEN 'Hyderabad' WHEN 6 THEN 'Pune' WHEN 7 THEN 'Ahmedabad'
        WHEN 8 THEN 'Jaipur' WHEN 9 THEN 'Lucknow'
    END as location,
    CASE (FLOOR(RAND() * 3))
        WHEN 0 THEN 'Beginner' WHEN 1 THEN 'Intermediate' WHEN 2 THEN 'Expert'
    END as experience_level,
    ROUND(3.0 + RAND() * 2.0, 1) as rating,
    FLOOR(RAND() * 100) as total_completed,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1095) DAY) as join_date
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 50000
) numbers;

-- =====================================================
-- INSERT 10,000 CLIENTS
-- =====================================================

INSERT INTO clients (name, email, organization, location, member_since)
SELECT 
    CONCAT(
        CASE (FLOOR(RAND() * 15))
            WHEN 0 THEN 'Tech' WHEN 1 THEN 'Digital' WHEN 2 THEN 'Innovation' WHEN 3 THEN 'Solutions'
            WHEN 4 THEN 'Systems' WHEN 5 THEN 'Services' WHEN 6 THEN 'Technologies' WHEN 7 THEN 'Enterprises'
            WHEN 8 THEN 'Corporation' WHEN 9 THEN 'Labs' WHEN 10 THEN 'Group' WHEN 11 THEN 'Industries'
            WHEN 12 THEN 'Limited' WHEN 13 THEN 'Private' WHEN 14 THEN 'Global'
        END,
        ' ',
        CASE (FLOOR(RAND() * 20))
            WHEN 0 THEN 'India' WHEN 1 THEN 'Mumbai' WHEN 2 THEN 'Delhi' WHEN 3 THEN 'Bangalore'
            WHEN 4 THEN 'Chennai' WHEN 5 THEN 'Kolkata' WHEN 6 THEN 'Hyderabad' WHEN 7 THEN 'Pune'
            WHEN 8 THEN 'Ahmedabad' WHEN 9 THEN 'Jaipur' WHEN 10 THEN 'Lucknow' WHEN 11 THEN 'Kochi'
            WHEN 12 THEN 'Indore' WHEN 13 THEN 'Bhopal' WHEN 14 THEN 'Coimbatore' WHEN 15 THEN 'Nagpur'
            WHEN 16 THEN 'Vadodara' WHEN 17 THEN 'Surat' WHEN 18 THEN 'Kanpur' WHEN 19 THEN 'Patna'
        END
    ) as name,
    CONCAT('client', n, '@company.com') as email,
    CONCAT('Company ', n) as organization,
    CASE (FLOOR(RAND() * 10))
        WHEN 0 THEN 'Delhi' WHEN 1 THEN 'Mumbai' WHEN 2 THEN 'Bangalore' WHEN 3 THEN 'Chennai'
        WHEN 4 THEN 'Kolkata' WHEN 5 THEN 'Hyderabad' WHEN 6 THEN 'Pune' WHEN 7 THEN 'Ahmedabad'
        WHEN 8 THEN 'Jaipur' WHEN 9 THEN 'Lucknow'
    END as location,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1095) DAY) as member_since
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 10000
) numbers;

-- =====================================================
-- INSERT 25,000 GIGS
-- =====================================================

INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    (SELECT client_id FROM clients ORDER BY RAND() LIMIT 1) as client_id,
    (SELECT category_id FROM categories ORDER BY RAND() LIMIT 1) as category_id,
    CONCAT(
        CASE (FLOOR(RAND() * 10))
            WHEN 0 THEN 'Web Development' WHEN 1 THEN 'Mobile App' WHEN 2 THEN 'Data Analysis'
            WHEN 3 THEN 'UI/UX Design' WHEN 4 THEN 'DevOps Setup' WHEN 5 THEN 'Machine Learning'
            WHEN 6 THEN 'Database Design' WHEN 7 THEN 'API Development' WHEN 8 THEN 'Cloud Migration'
            WHEN 9 THEN 'Security Audit'
        END,
        ' Project ',
        n
    ) as title,
    CONCAT('Description for project ', n, ' - Professional development work requiring expertise in modern technologies.') as description,
    ROUND(10000 + RAND() * 490000, 2) as budget,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY) as posted_date,
    DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 90) DAY) as deadline_date,
    CASE (FLOOR(RAND() * 4))
        WHEN 0 THEN 'Open' WHEN 1 THEN 'In Progress' WHEN 2 THEN 'Completed' WHEN 3 THEN 'Cancelled'
    END as status
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 25000
) numbers;

-- =====================================================
-- INSERT 100,000 APPLICATIONS
-- =====================================================

INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    (SELECT gig_id FROM gigs ORDER BY RAND() LIMIT 1) as gig_id,
    (SELECT freelancer_id FROM freelancers ORDER BY RAND() LIMIT 1) as freelancer_id,
    CONCAT('I am interested in this project and can deliver high-quality work within the timeline. My proposal includes detailed planning and execution strategy.') as proposal_text,
    ROUND(5000 + RAND() * 495000, 2) as bid_amount,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 180) DAY) as applied_date,
    CASE (FLOOR(RAND() * 3))
        WHEN 0 THEN 'Pending' WHEN 1 THEN 'Approved' WHEN 2 THEN 'Rejected'
    END as status
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, information_schema.columns c3, (SELECT @row := 0) r
    LIMIT 100000
) numbers;

-- =====================================================
-- INSERT 50,000 CONTRACTS
-- =====================================================

INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count)
SELECT 
    (SELECT application_id FROM applications WHERE status = 'Approved' ORDER BY RAND() LIMIT 1) as application_id,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 90) DAY) as start_date,
    DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 60) DAY) as end_date,
    CASE (FLOOR(RAND() * 3))
        WHEN 0 THEN 'Active' WHEN 1 THEN 'Completed' WHEN 2 THEN 'Cancelled'
    END as work_status,
    ROUND(10000 + RAND() * 490000, 2) as total_payment,
    FLOOR(RAND() * 5) + 1 as milestone_count
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 50000
) numbers;

-- =====================================================
-- INSERT 200,000 PAYMENTS
-- =====================================================

INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id)
SELECT 
    (SELECT contract_id FROM contracts ORDER BY RAND() LIMIT 1) as contract_id,
    ROUND(1000 + RAND() * 99000, 2) as amount,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 60) DAY) as payment_date,
    CASE (FLOOR(RAND() * 4))
        WHEN 0 THEN 'UPI' WHEN 1 THEN 'Bank Transfer' WHEN 2 THEN 'Paytm' WHEN 3 THEN 'Credit Card'
    END as method,
    CASE (FLOOR(RAND() * 2))
        WHEN 0 THEN 'Paid' WHEN 1 THEN 'Pending'
    END as status,
    CONCAT('TXN', FLOOR(RAND() * 900000000) + 100000000) as transaction_id
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, information_schema.columns c3, information_schema.columns c4, (SELECT @row := 0) r
    LIMIT 200000
) numbers;

-- =====================================================
-- INSERT 50,000 REVIEWS
-- =====================================================

INSERT INTO reviews (contract_id, rating, comments, review_date)
SELECT 
    (SELECT contract_id FROM contracts WHERE work_status = 'Completed' ORDER BY RAND() LIMIT 1) as contract_id,
    FLOOR(RAND() * 5) + 1 as rating,
    CASE (FLOOR(RAND() * 5))
        WHEN 0 THEN 'Excellent work, highly recommended!'
        WHEN 1 THEN 'Great communication and quality delivery.'
        WHEN 2 THEN 'Professional and met all requirements.'
        WHEN 3 THEN 'Good work, would hire again.'
        WHEN 4 THEN 'Satisfactory work, minor improvements needed.'
    END as comments,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 30) DAY) as review_date
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 50000
) numbers;

-- =====================================================
-- INSERT 100,000 MESSAGES
-- =====================================================

INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE (FLOOR(RAND() * 2))
        WHEN 0 THEN 'Client' WHEN 1 THEN 'Freelancer'
    END as sender_type,
    CASE (FLOOR(RAND() * 2))
        WHEN 0 THEN (SELECT client_id FROM clients ORDER BY RAND() LIMIT 1)
        WHEN 1 THEN (SELECT freelancer_id FROM freelancers ORDER BY RAND() LIMIT 1)
    END as sender_id,
    CASE (FLOOR(RAND() * 2))
        WHEN 0 THEN (SELECT client_id FROM clients ORDER BY RAND() LIMIT 1)
        WHEN 1 THEN (SELECT freelancer_id FROM freelancers ORDER BY RAND() LIMIT 1)
    END as receiver_id,
    CASE (FLOOR(RAND() * 5))
        WHEN 0 THEN 'Hello, I am interested in discussing this project.'
        WHEN 1 THEN 'Can you provide more details about the requirements?'
        WHEN 2 THEN 'I have completed the first milestone, please review.'
        WHEN 3 THEN 'Thank you for the quick response and clear communication.'
        WHEN 4 THEN 'The project is progressing well, any feedback?'
    END as message_text,
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 720) HOUR) as sent_at,
    FLOOR(RAND() * 2) as is_read
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, information_schema.columns c3, information_schema.columns c4, (SELECT @row := 0) r
    LIMIT 100000
) numbers;

-- =====================================================
-- INSERT FREELANCER SKILLS (Many-to-Many)
-- =====================================================

INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience)
SELECT 
    (SELECT freelancer_id FROM freelancers ORDER BY RAND() LIMIT 1) as freelancer_id,
    (SELECT skill_id FROM skills ORDER BY RAND() LIMIT 1) as skill_id,
    CASE (FLOOR(RAND() * 3))
        WHEN 0 THEN 'Basic' WHEN 1 THEN 'Intermediate' WHEN 2 THEN 'Advanced'
    END as proficiency_level,
    FLOOR(RAND() * 10) as years_experience
FROM (
    SELECT @row := @row + 1 as n
    FROM information_schema.columns c1, information_schema.columns c2, (SELECT @row := 0) r
    LIMIT 150000
) numbers
WHERE NOT EXISTS (
    SELECT 1 FROM freelancer_skills fs 
    WHERE fs.freelancer_id = freelancer_id AND fs.skill_id = skill_id
);

-- =====================================================
-- PERFORMANCE OPTIMIZATION
-- =====================================================

-- Add indexes for better performance
CREATE INDEX idx_freelancers_location ON freelancers(location);
CREATE INDEX idx_freelancers_rating ON freelancers(rating);
CREATE INDEX idx_freelancers_experience ON freelancers(experience_level);
CREATE INDEX idx_gigs_status ON gigs(status);
CREATE INDEX idx_gigs_budget ON gigs(budget);
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_date ON payments(payment_date);
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_contracts_status ON contracts(work_status);

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

-- Check record counts
SELECT 'freelancers' as table_name, COUNT(*) as record_count FROM freelancers
UNION ALL
SELECT 'clients', COUNT(*) FROM clients
UNION ALL
SELECT 'gigs', COUNT(*) FROM gigs
UNION ALL
SELECT 'applications', COUNT(*) FROM applications
UNION ALL
SELECT 'contracts', COUNT(*) FROM contracts
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'messages', COUNT(*) FROM messages
UNION ALL
SELECT 'freelancer_skills', COUNT(*) FROM freelancer_skills;

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT 'SUCCESS: Large dataset inserted successfully!' as status,
       'Total records: ~585,000+' as total_records,
       'Frontend will now show large dataset' as note;




