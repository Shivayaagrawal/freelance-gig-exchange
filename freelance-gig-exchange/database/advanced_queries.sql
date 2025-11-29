

USE freelance_gig_exchange;


SELECT 
    f.name,
    f.rating,
    f.experience_level,
    f.total_completed,
    COALESCE(SUM(p.amount), 0) as total_earnings,
    COUNT(DISTINCT c.contract_id) as active_contracts
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
LEFT JOIN contracts c ON a.application_id = c.application_id
LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
GROUP BY f.freelancer_id, f.name, f.rating, f.experience_level, f.total_completed
ORDER BY f.rating DESC, total_earnings DESC
LIMIT 5;

-- 2. Category-wise Gig Demand Analysis
SELECT 
    c.category_name,
    COUNT(g.gig_id) as total_gigs,
    AVG(g.budget) as avg_budget,
    SUM(g.budget) as total_budget,
    COUNT(CASE WHEN g.status = 'Open' THEN 1 END) as open_gigs,
    COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) as completed_gigs,
    ROUND((COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) * 100.0 / COUNT(g.gig_id)), 2) as completion_rate
FROM categories c
LEFT JOIN gigs g ON c.category_id = g.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_gigs DESC;

-- 3. Freelancer Skill Match Analysis
SELECT 
    f.name as freelancer_name,
    f.location,
    f.experience_level,
    GROUP_CONCAT(s.skill_name SEPARATOR ', ') as skills,
    COUNT(fs.skill_id) as skill_count,
    f.rating
FROM freelancers f
JOIN freelancer_skills fs ON f.freelancer_id = fs.freelancer_id
JOIN skills s ON fs.skill_id = s.skill_id
GROUP BY f.freelancer_id, f.name, f.location, f.experience_level, f.rating
ORDER BY skill_count DESC, f.rating DESC;

-- 4. Client Spending Analysis
SELECT 
    cl.name as client_name,
    cl.organization,
    COUNT(g.gig_id) as total_gigs_posted,
    SUM(g.budget) as total_budget_allocated,
    AVG(g.budget) as avg_gig_budget,
    COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) as completed_gigs,
    COUNT(CASE WHEN g.status = 'Open' THEN 1 END) as open_gigs
FROM clients cl
LEFT JOIN gigs g ON cl.client_id = g.client_id
GROUP BY cl.client_id, cl.name, cl.organization
ORDER BY total_budget_allocated DESC;

-- 5. Monthly Revenue Trends
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') as payment_month,
    COUNT(p.payment_id) as total_payments,
    SUM(p.amount) as total_revenue,
    AVG(p.amount) as avg_payment_amount,
    COUNT(CASE WHEN p.status = 'Paid' THEN 1 END) as successful_payments,
    COUNT(CASE WHEN p.status = 'Pending' THEN 1 END) as pending_payments
FROM payments p
GROUP BY DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY payment_month DESC;

-- 6. Freelancer Performance by Location
SELECT 
    f.location,
    COUNT(DISTINCT f.freelancer_id) as total_freelancers,
    AVG(f.rating) as avg_rating,
    SUM(f.total_completed) as total_projects_completed,
    COUNT(DISTINCT a.application_id) as total_applications,
    COUNT(DISTINCT c.contract_id) as total_contracts
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
LEFT JOIN contracts c ON a.application_id = c.application_id
GROUP BY f.location
ORDER BY avg_rating DESC;

-- 7. Skill Demand Analysis
SELECT 
    s.skill_name,
    s.category,
    COUNT(fs.freelancer_id) as freelancers_with_skill,
    COUNT(g.gig_id) as gigs_requiring_skill,
    AVG(g.budget) as avg_budget_for_skill
FROM skills s
LEFT JOIN freelancer_skills fs ON s.skill_id = fs.skill_id
LEFT JOIN gigs g ON g.description LIKE CONCAT('%', s.skill_name, '%')
GROUP BY s.skill_id, s.skill_name, s.category
ORDER BY freelancers_with_skill DESC;

-- 8. Contract Success Rate Analysis
SELECT 
    f.name as freelancer_name,
    COUNT(c.contract_id) as total_contracts,
    COUNT(CASE WHEN c.work_status = 'Completed' THEN 1 END) as completed_contracts,
    COUNT(CASE WHEN c.work_status = 'Active' THEN 1 END) as active_contracts,
    ROUND((COUNT(CASE WHEN c.work_status = 'Completed' THEN 1 END) * 100.0 / COUNT(c.contract_id)), 2) as success_rate,
    AVG(r.rating) as avg_rating_received
FROM freelancers f
JOIN applications a ON f.freelancer_id = a.freelancer_id
JOIN contracts c ON a.application_id = c.application_id
LEFT JOIN reviews r ON c.contract_id = r.contract_id
GROUP BY f.freelancer_id, f.name
HAVING total_contracts > 0
ORDER BY success_rate DESC, avg_rating_received DESC;

-- 9. Payment Method Analysis
SELECT 
    p.method,
    COUNT(p.payment_id) as total_payments,
    SUM(p.amount) as total_amount,
    AVG(p.amount) as avg_payment,
    COUNT(CASE WHEN p.status = 'Paid' THEN 1 END) as successful_payments,
    COUNT(CASE WHEN p.status = 'Pending' THEN 1 END) as pending_payments,
    ROUND((COUNT(CASE WHEN p.status = 'Paid' THEN 1 END) * 100.0 / COUNT(p.payment_id)), 2) as success_rate
FROM payments p
GROUP BY p.method
ORDER BY total_amount DESC;

-- 10. Application Success Rate by Experience Level
SELECT 
    f.experience_level,
    COUNT(a.application_id) as total_applications,
    COUNT(CASE WHEN a.status = 'Approved' THEN 1 END) as approved_applications,
    COUNT(CASE WHEN a.status = 'Pending' THEN 1 END) as pending_applications,
    COUNT(CASE WHEN a.status = 'Rejected' THEN 1 END) as rejected_applications,
    ROUND((COUNT(CASE WHEN a.status = 'Approved' THEN 1 END) * 100.0 / COUNT(a.application_id)), 2) as approval_rate
FROM freelancers f
JOIN applications a ON f.freelancer_id = a.freelancer_id
GROUP BY f.experience_level
ORDER BY approval_rate DESC;

-- =====================================================
-- COMPLEX JOINS AND SUBQUERIES
-- =====================================================

-- 11. Freelancers with Highest Earning Potential
SELECT 
    f.name,
    f.rating,
    f.experience_level,
    COALESCE(SUM(p.amount), 0) as total_earnings,
    COUNT(DISTINCT c.contract_id) as completed_contracts,
    ROUND(COALESCE(SUM(p.amount), 0) / NULLIF(COUNT(DISTINCT c.contract_id), 0), 2) as avg_earning_per_contract
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
LEFT JOIN contracts c ON a.application_id = c.application_id AND c.work_status = 'Completed'
LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
GROUP BY f.freelancer_id, f.name, f.rating, f.experience_level
ORDER BY total_earnings DESC;

-- 12. Most Profitable Gig Categories
SELECT 
    c.category_name,
    COUNT(g.gig_id) as total_gigs,
    AVG(g.budget) as avg_budget,
    SUM(g.budget) as total_budget,
    COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) as completed_gigs,
    ROUND((COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) * 100.0 / COUNT(g.gig_id)), 2) as completion_rate
FROM categories c
JOIN gigs g ON c.category_id = g.category_id
GROUP BY c.category_id, c.category_name
HAVING total_gigs > 0
ORDER BY avg_budget DESC;

-- 13. Freelancer-Client Communication Analysis
SELECT 
    f.name as freelancer_name,
    cl.name as client_name,
    COUNT(m.message_id) as total_messages,
    COUNT(CASE WHEN m.sender_type = 'Freelancer' THEN 1 END) as messages_sent,
    COUNT(CASE WHEN m.sender_type = 'Client' THEN 1 END) as messages_received,
    MAX(m.sent_at) as last_message_time
FROM freelancers f
JOIN applications a ON f.freelancer_id = a.freelancer_id
JOIN gigs g ON a.gig_id = g.gig_id
JOIN clients cl ON g.client_id = cl.client_id
JOIN messages m ON (m.sender_id = f.freelancer_id AND m.receiver_id = cl.client_id) 
    OR (m.sender_id = cl.client_id AND m.receiver_id = f.freelancer_id)
GROUP BY f.freelancer_id, f.name, cl.client_id, cl.name
ORDER BY total_messages DESC;

-- =====================================================
-- STORED PROCEDURES
-- =====================================================

DELIMITER //

-- Procedure to get freelancer total earnings
CREATE PROCEDURE sp_get_freelancer_earnings(IN freelancer_id INT)
BEGIN
    SELECT 
        f.name,
        f.rating,
        f.experience_level,
        COALESCE(SUM(p.amount), 0) as total_earnings,
        COUNT(DISTINCT c.contract_id) as completed_contracts,
        COUNT(DISTINCT a.application_id) as total_applications,
        ROUND(COALESCE(SUM(p.amount), 0) / NULLIF(COUNT(DISTINCT c.contract_id), 0), 2) as avg_earning_per_contract
    FROM freelancers f
    LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
    LEFT JOIN contracts c ON a.application_id = c.application_id AND c.work_status = 'Completed'
    LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
    WHERE f.freelancer_id = freelancer_id
    GROUP BY f.freelancer_id, f.name, f.rating, f.experience_level;
END //

-- Procedure to find skill-matched freelancers for a gig
CREATE PROCEDURE sp_find_skill_matches(IN gig_id INT)
BEGIN
    SELECT 
        f.freelancer_id,
        f.name,
        f.rating,
        f.experience_level,
        f.location,
        GROUP_CONCAT(s.skill_name SEPARATOR ', ') as matched_skills,
        COUNT(fs.skill_id) as skill_match_count,
        a.bid_amount,
        a.applied_date
    FROM gigs g
    JOIN categories cat ON g.category_id = cat.category_id
    JOIN freelancer_skills fs ON fs.skill_id IN (
        SELECT skill_id FROM skills 
        WHERE skill_name IN ('Python', 'JavaScript', 'React', 'MySQL', 'Flask', 'Java', 'Spring Boot', 'AWS', 'HTML/CSS', 'Figma')
    )
    JOIN freelancers f ON fs.freelancer_id = f.freelancer_id
    JOIN skills s ON fs.skill_id = s.skill_id
    LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id AND a.gig_id = g.gig_id
    WHERE g.gig_id = gig_id
    GROUP BY f.freelancer_id, f.name, f.rating, f.experience_level, f.location, a.bid_amount, a.applied_date
    ORDER BY skill_match_count DESC, f.rating DESC;
END //

-- Procedure to get client spending summary
CREATE PROCEDURE sp_get_client_spending(IN client_id INT)
BEGIN
    SELECT 
        cl.name,
        cl.organization,
        COUNT(g.gig_id) as total_gigs_posted,
        SUM(g.budget) as total_budget_allocated,
        AVG(g.budget) as avg_gig_budget,
        COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) as completed_gigs,
        COUNT(CASE WHEN g.status = 'Open' THEN 1 END) as open_gigs,
        COUNT(CASE WHEN g.status = 'In Progress' THEN 1 END) as in_progress_gigs,
        COALESCE(SUM(p.amount), 0) as total_amount_paid
    FROM clients cl
    LEFT JOIN gigs g ON cl.client_id = g.client_id
    LEFT JOIN applications a ON g.gig_id = a.gig_id AND a.status = 'Approved'
    LEFT JOIN contracts c ON a.application_id = c.application_id
    LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
    WHERE cl.client_id = client_id
    GROUP BY cl.client_id, cl.name, cl.organization;
END //

-- Procedure to get monthly analytics
CREATE PROCEDURE sp_get_monthly_analytics(IN year_month VARCHAR(7))
BEGIN
    SELECT 
        'Freelancers' as metric,
        COUNT(DISTINCT f.freelancer_id) as count,
        NULL as amount
    FROM freelancers f
    WHERE DATE_FORMAT(f.join_date, '%Y-%m') = year_month
    
    UNION ALL
    
    SELECT 
        'Gigs Posted' as metric,
        COUNT(DISTINCT g.gig_id) as count,
        SUM(g.budget) as amount
    FROM gigs g
    WHERE DATE_FORMAT(g.posted_date, '%Y-%m') = year_month
    
    UNION ALL
    
    SELECT 
        'Applications' as metric,
        COUNT(DISTINCT a.application_id) as count,
        NULL as amount
    FROM applications a
    WHERE DATE_FORMAT(a.applied_date, '%Y-%m') = year_month
    
    UNION ALL
    
    SELECT 
        'Contracts' as metric,
        COUNT(DISTINCT c.contract_id) as count,
        SUM(c.total_payment) as amount
    FROM contracts c
    WHERE DATE_FORMAT(c.start_date, '%Y-%m') = year_month
    
    UNION ALL
    
    SELECT 
        'Payments' as metric,
        COUNT(DISTINCT p.payment_id) as count,
        SUM(p.amount) as amount
    FROM payments p
    WHERE DATE_FORMAT(p.payment_date, '%Y-%m') = year_month;
END //

DELIMITER ;

-- =====================================================
-- TRIGGERS FOR AUTOMATION
-- =====================================================

DELIMITER //

-- Trigger to update freelancer stats when contract is completed
CREATE TRIGGER tr_update_freelancer_completion
AFTER UPDATE ON contracts
FOR EACH ROW
BEGIN
    IF NEW.work_status = 'Completed' AND OLD.work_status != 'Completed' THEN
        UPDATE freelancers 
        SET total_completed = total_completed + 1
        WHERE freelancer_id = (
            SELECT a.freelancer_id 
            FROM applications a 
            WHERE a.application_id = NEW.application_id
        );
    END IF;
END //

-- Trigger to update gig status when contract is created
CREATE TRIGGER tr_update_gig_status_on_contract
AFTER INSERT ON contracts
FOR EACH ROW
BEGIN
    UPDATE gigs 
    SET status = 'In Progress'
    WHERE gig_id = (
        SELECT a.gig_id 
        FROM applications a 
        WHERE a.application_id = NEW.application_id
    );
END //

-- Trigger to update gig status when contract is completed
CREATE TRIGGER tr_complete_gig_on_contract_completion
AFTER UPDATE ON contracts
FOR EACH ROW
BEGIN
    IF NEW.work_status = 'Completed' AND OLD.work_status != 'Completed' THEN
        UPDATE gigs 
        SET status = 'Completed'
        WHERE gig_id = (
            SELECT a.gig_id 
            FROM applications a 
            WHERE a.application_id = NEW.application_id
        );
    END IF;
END //

DELIMITER ;

-- =====================================================
-- PERFORMANCE OPTIMIZATION QUERIES
-- =====================================================

-- 14. Index Usage Analysis
SHOW INDEX FROM freelancers;
SHOW INDEX FROM gigs;
SHOW INDEX FROM applications;
SHOW INDEX FROM contracts;
SHOW INDEX FROM payments;

-- 15. Query Performance Analysis
EXPLAIN SELECT f.name, f.rating, COUNT(a.application_id) as total_applications
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
WHERE f.rating > 4.0
GROUP BY f.freelancer_id, f.name, f.rating
ORDER BY f.rating DESC;

-- 16. Database Statistics
SELECT 
    'Total Freelancers' as metric,
    COUNT(*) as count
FROM freelancers
UNION ALL
SELECT 
    'Total Clients' as metric,
    COUNT(*) as count
FROM clients
UNION ALL
SELECT 
    'Total Gigs' as metric,
    COUNT(*) as count
FROM gigs
UNION ALL
SELECT 
    'Total Applications' as metric,
    COUNT(*) as count
FROM applications
UNION ALL
SELECT 
    'Total Contracts' as metric,
    COUNT(*) as count
FROM contracts
UNION ALL
SELECT 
    'Total Payments' as metric,
    COUNT(*) as count
FROM payments;

COMMIT;







