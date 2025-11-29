

-- Create database
CREATE DATABASE IF NOT EXISTS freelance_gig_exchange;
USE freelance_gig_exchange;

-- =====================================================
-- 1. FREELANCERS TABLE
-- =====================================================
CREATE TABLE freelancers (
    freelancer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    location VARCHAR(50),
    experience_level ENUM('Beginner', 'Intermediate', 'Expert') DEFAULT 'Beginner',
    rating DECIMAL(2,1) DEFAULT 0.0 CHECK (rating >= 0.0 AND rating <= 5.0),
    total_completed INT DEFAULT 0,
    join_date DATE DEFAULT (CURRENT_DATE),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 2. CLIENTS TABLE
-- =====================================================
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    organization VARCHAR(100),
    location VARCHAR(50),
    member_since DATE DEFAULT (CURRENT_DATE),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 3. CATEGORIES TABLE
-- =====================================================
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 4. SKILLS TABLE
-- =====================================================
CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL,
    category VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 5. FREELANCER_SKILLS TABLE (Many-to-Many)
-- =====================================================
CREATE TABLE freelancer_skills (
    freelancer_id INT,
    skill_id INT,
    proficiency_level ENUM('Basic', 'Intermediate', 'Advanced') DEFAULT 'Basic',
    years_experience INT DEFAULT 0,
    PRIMARY KEY (freelancer_id, skill_id),
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 6. GIGS TABLE
-- =====================================================
CREATE TABLE gigs (
    gig_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    budget DECIMAL(10,2) NOT NULL CHECK (budget > 0),
    posted_date DATE DEFAULT (CURRENT_DATE),
    deadline_date DATE,
    status ENUM('Open', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE RESTRICT
);

-- =====================================================
-- 7. APPLICATIONS TABLE
-- =====================================================
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    gig_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    proposal_text TEXT NOT NULL,
    bid_amount DECIMAL(10,2) NOT NULL CHECK (bid_amount > 0),
    applied_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE,
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    UNIQUE KEY unique_application (gig_id, freelancer_id)
);

-- =====================================================
-- 8. CONTRACTS TABLE
-- =====================================================
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT UNIQUE NOT NULL,
    start_date DATE DEFAULT (CURRENT_DATE),
    end_date DATE,
    work_status ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'Active',
    total_payment DECIMAL(10,2) NOT NULL CHECK (total_payment > 0),
    milestone_count INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(application_id) ON DELETE CASCADE
);

-- =====================================================
-- 9. PAYMENTS TABLE
-- =====================================================
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATE DEFAULT (CURRENT_DATE),
    method ENUM('UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking') NOT NULL,
    status ENUM('Paid', 'Pending', 'Failed') DEFAULT 'Pending',
    transaction_id VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE
);

-- =====================================================
-- 10. REVIEWS TABLE
-- =====================================================
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT UNIQUE NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comments TEXT,
    review_date DATE DEFAULT (CURRENT_DATE),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE
);

-- =====================================================
-- 11. MESSAGES TABLE
-- =====================================================
CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_type ENUM('Client', 'Freelancer') NOT NULL,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES clients(client_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE
);

-- =====================================================
-- INDEXES FOR PERFORMANCE OPTIMIZATION
-- =====================================================

-- Indexes for frequently queried columns
CREATE INDEX idx_freelancers_location ON freelancers(location);
CREATE INDEX idx_freelancers_rating ON freelancers(rating);
CREATE INDEX idx_freelancers_experience ON freelancers(experience_level);

CREATE INDEX idx_gigs_status ON gigs(status);
CREATE INDEX idx_gigs_budget ON gigs(budget);
CREATE INDEX idx_gigs_posted_date ON gigs(posted_date);

CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_applications_applied_date ON applications(applied_date);

CREATE INDEX idx_contracts_status ON contracts(work_status);
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_date ON payments(payment_date);

CREATE INDEX idx_messages_sent_at ON messages(sent_at);
CREATE INDEX idx_messages_sender ON messages(sender_type, sender_id);

-- =====================================================
-- VIEWS FOR COMMON QUERIES
-- =====================================================

-- View for top freelancers
CREATE VIEW view_top_freelancers AS
SELECT 
    f.freelancer_id,
    f.name,
    f.rating,
    f.total_completed,
    f.experience_level,
    COUNT(DISTINCT c.contract_id) as active_contracts,
    COALESCE(SUM(p.amount), 0) as total_earnings
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
LEFT JOIN contracts c ON a.application_id = c.application_id
LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
GROUP BY f.freelancer_id, f.name, f.rating, f.total_completed, f.experience_level
ORDER BY f.rating DESC, total_earnings DESC;

-- View for pending payments
CREATE VIEW view_pending_payments AS
SELECT 
    p.payment_id,
    p.amount,
    p.payment_date,
    p.method,
    f.name as freelancer_name,
    cl.name as client_name,
    g.title as gig_title
FROM payments p
JOIN contracts c ON p.contract_id = c.contract_id
JOIN applications a ON c.application_id = a.application_id
JOIN freelancers f ON a.freelancer_id = f.freelancer_id
JOIN gigs g ON a.gig_id = g.gig_id
JOIN clients cl ON g.client_id = cl.client_id
WHERE p.status = 'Pending';

-- View for gig statistics
CREATE VIEW view_gig_statistics AS
SELECT 
    c.category_name,
    COUNT(g.gig_id) as total_gigs,
    AVG(g.budget) as avg_budget,
    COUNT(CASE WHEN g.status = 'Open' THEN 1 END) as open_gigs,
    COUNT(CASE WHEN g.status = 'Completed' THEN 1 END) as completed_gigs
FROM categories c
LEFT JOIN gigs g ON c.category_id = g.category_id
GROUP BY c.category_id, c.category_name;

-- =====================================================
-- STORED PROCEDURES
-- =====================================================

DELIMITER //

-- Procedure to calculate total earnings for a freelancer
CREATE PROCEDURE sp_total_earning(IN freelancer_id INT)
BEGIN
    SELECT 
        f.name,
        COALESCE(SUM(p.amount), 0) as total_earnings,
        COUNT(DISTINCT c.contract_id) as completed_contracts
    FROM freelancers f
    LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
    LEFT JOIN contracts c ON a.application_id = c.application_id
    LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
    WHERE f.freelancer_id = freelancer_id
    GROUP BY f.freelancer_id, f.name;
END //

-- Procedure to get freelancer skill matches for a gig
CREATE PROCEDURE sp_skill_match(IN gig_id INT)
BEGIN
    SELECT 
        f.freelancer_id,
        f.name,
        f.rating,
        GROUP_CONCAT(s.skill_name) as matched_skills,
        COUNT(fs.skill_id) as skill_count
    FROM gigs g
    JOIN categories cat ON g.category_id = cat.category_id
    JOIN freelancer_skills fs ON fs.skill_id IN (
        SELECT skill_id FROM skills WHERE skill_name IN (
            SELECT DISTINCT skill_name FROM skills 
            WHERE skill_name LIKE CONCAT('%', cat.category_name, '%')
            OR skill_name IN ('Python', 'JavaScript', 'React', 'MySQL', 'Flask')
        )
    )
    JOIN freelancers f ON fs.freelancer_id = f.freelancer_id
    JOIN skills s ON fs.skill_id = s.skill_id
    WHERE g.gig_id = gig_id
    GROUP BY f.freelancer_id, f.name, f.rating
    ORDER BY skill_count DESC, f.rating DESC;
END //

DELIMITER ;

-- =====================================================
-- TRIGGERS FOR DATA INTEGRITY
-- =====================================================

DELIMITER //

-- Trigger to update freelancer's total_completed when contract is completed
CREATE TRIGGER tr_update_freelancer_stats
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
CREATE TRIGGER tr_update_gig_status
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

DELIMITER ;

-- =====================================================
-- SAMPLE DATA INSERTION (Basic structure)
-- =====================================================

-- Insert categories
INSERT INTO categories (category_name, description) VALUES
('Web Development', 'Frontend and backend web development projects'),
('Data Science', 'Data analysis, machine learning, and AI projects'),
('Mobile Apps', 'iOS and Android mobile application development'),
('UI/UX Design', 'User interface and user experience design'),
('DevOps', 'Infrastructure, deployment, and automation'),
('Machine Learning', 'AI and ML model development'),
('Digital Marketing', 'SEO, social media, and content marketing'),
('Content Writing', 'Blog posts, articles, and copywriting');

-- Insert skills
INSERT INTO skills (skill_name, category) VALUES
('Python', 'Programming'),
('JavaScript', 'Programming'),
('React', 'Frontend'),
('Node.js', 'Backend'),
('MySQL', 'Database'),
('Flask', 'Framework'),
('Django', 'Framework'),
('Java', 'Programming'),
('Spring Boot', 'Framework'),
('AWS', 'Cloud'),
('HTML/CSS', 'Frontend'),
('Figma', 'Design'),
('Photoshop', 'Design'),
('MongoDB', 'Database'),
('PostgreSQL', 'Database'),
('Docker', 'DevOps'),
('Kubernetes', 'DevOps'),
('TensorFlow', 'ML'),
('PyTorch', 'ML'),
('Git', 'Version Control');

COMMIT;





