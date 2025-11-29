
USE freelance_gig_exchange;



-- 1. Users (Base table for all users)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_type ENUM('freelancer', 'client', 'admin') NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. User Profiles
CREATE TABLE user_profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    bio TEXT,
    avatar_url VARCHAR(255),
    timezone VARCHAR(50),
    language VARCHAR(10) DEFAULT 'en',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3. Freelancers (Extended)
CREATE TABLE freelancers (
    freelancer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    business_name VARCHAR(100),
    experience_level ENUM('Beginner', 'Intermediate', 'Expert') NOT NULL,
    hourly_rate DECIMAL(10,2),
    rating DECIMAL(3,2) DEFAULT 0.00,
    total_completed INT DEFAULT 0,
    total_earnings DECIMAL(15,2) DEFAULT 0.00,
    availability_status ENUM('Available', 'Busy', 'Away', 'Offline') DEFAULT 'Available',
    response_time_hours INT DEFAULT 24,
    join_date DATE,
    last_active TIMESTAMP,
    is_featured BOOLEAN DEFAULT FALSE,
    verification_status ENUM('Unverified', 'Pending', 'Verified', 'Rejected') DEFAULT 'Unverified',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 4. Clients (Extended)
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_name VARCHAR(100),
    company_size ENUM('Startup', 'Small', 'Medium', 'Large', 'Enterprise'),
    industry VARCHAR(50),
    website VARCHAR(255),
    total_spent DECIMAL(15,2) DEFAULT 0.00,
    total_projects INT DEFAULT 0,
    member_since DATE,
    is_verified BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 5. Addresses
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    address_type ENUM('Home', 'Work', 'Billing') DEFAULT 'Home',
    street_address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50) DEFAULT 'India',
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- =====================================================
-- SKILLS AND CATEGORIES
-- =====================================================

-- 6. Categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    parent_category_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INT DEFAULT 0,
    FOREIGN KEY (parent_category_id) REFERENCES categories(category_id)
);

-- 7. Skills
CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    category_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    demand_level ENUM('Low', 'Medium', 'High', 'Very High') DEFAULT 'Medium',
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 8. Freelancer Skills
CREATE TABLE freelancer_skills (
    freelancer_skill_id INT AUTO_INCREMENT PRIMARY KEY,
    freelancer_id INT NOT NULL,
    skill_id INT NOT NULL,
    proficiency_level ENUM('Basic', 'Intermediate', 'Advanced', 'Expert') NOT NULL,
    years_experience INT DEFAULT 0,
    is_primary BOOLEAN DEFAULT FALSE,
    added_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id) ON DELETE CASCADE,
    UNIQUE KEY unique_freelancer_skill (freelancer_id, skill_id)
);

-- 9. Skill Certifications
CREATE TABLE skill_certifications (
    certification_id INT AUTO_INCREMENT PRIMARY KEY,
    freelancer_skill_id INT NOT NULL,
    certification_name VARCHAR(100),
    issuing_organization VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    certificate_url VARCHAR(255),
    verification_status ENUM('Pending', 'Verified', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (freelancer_skill_id) REFERENCES freelancer_skills(freelancer_skill_id) ON DELETE CASCADE
);

-- =====================================================
-- GIGS AND PROJECTS
-- =====================================================

-- 10. Gigs
CREATE TABLE gigs (
    gig_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    budget_min DECIMAL(10,2),
    budget_max DECIMAL(10,2),
    budget_type ENUM('Fixed', 'Hourly', 'Negotiable') DEFAULT 'Fixed',
    complexity_level ENUM('Simple', 'Medium', 'Complex', 'Very Complex') DEFAULT 'Medium',
    estimated_duration_days INT,
    posted_date DATE DEFAULT (CURRENT_DATE),
    deadline_date DATE,
    status ENUM('Draft', 'Open', 'In Progress', 'Completed', 'Cancelled', 'On Hold') DEFAULT 'Open',
    is_featured BOOLEAN DEFAULT FALSE,
    is_urgent BOOLEAN DEFAULT FALSE,
    views_count INT DEFAULT 0,
    applications_count INT DEFAULT 0,
    FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 11. Gig Requirements
CREATE TABLE gig_requirements (
    requirement_id INT AUTO_INCREMENT PRIMARY KEY,
    gig_id INT NOT NULL,
    requirement_type ENUM('Skill', 'Experience', 'Portfolio', 'Certification', 'Other') NOT NULL,
    requirement_text TEXT NOT NULL,
    is_mandatory BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE
);

-- 12. Gig Attachments
CREATE TABLE gig_attachments (
    attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    gig_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size INT,
    file_type VARCHAR(50),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE
);

-- 13. Gig Tags
CREATE TABLE gig_tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) UNIQUE NOT NULL,
    tag_color VARCHAR(7) DEFAULT '#007bff'
);

-- 14. Gig Tag Mappings
CREATE TABLE gig_tag_mappings (
    gig_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (gig_id, tag_id),
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES gig_tags(tag_id) ON DELETE CASCADE
);

-- =====================================================
-- APPLICATIONS AND PROPOSALS
-- =====================================================

-- 15. Applications
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    gig_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    proposal_text TEXT NOT NULL,
    bid_amount DECIMAL(10,2),
    estimated_days INT,
    cover_letter TEXT,
    status ENUM('Pending', 'Under Review', 'Shortlisted', 'Approved', 'Rejected', 'Withdrawn') DEFAULT 'Pending',
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reviewed_date TIMESTAMP NULL,
    reviewed_by INT,
    rejection_reason TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE,
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES users(user_id)
);

-- 16. Application Attachments
CREATE TABLE application_attachments (
    attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size INT,
    file_type VARCHAR(50),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(application_id) ON DELETE CASCADE
);

-- 17. Application Messages
CREATE TABLE application_messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    sender_id INT NOT NULL,
    message_text TEXT NOT NULL,
    message_type ENUM('Question', 'Clarification', 'Update', 'Other') DEFAULT 'Question',
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (application_id) REFERENCES applications(application_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id)
);

-- =====================================================
-- CONTRACTS AND PROJECTS
-- =====================================================

-- 18. Contracts
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    contract_title VARCHAR(150),
    start_date DATE,
    end_date DATE,
    work_status ENUM('Not Started', 'In Progress', 'On Hold', 'Completed', 'Cancelled') DEFAULT 'Not Started',
    total_payment DECIMAL(10,2),
    payment_terms TEXT,
    deliverables TEXT,
    milestones TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

-- 19. Contract Milestones
CREATE TABLE contract_milestones (
    milestone_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    milestone_name VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE,
    amount DECIMAL(10,2),
    status ENUM('Pending', 'In Progress', 'Completed', 'Approved', 'Rejected') DEFAULT 'Pending',
    completed_date DATE,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE
);

-- 20. Project Files
CREATE TABLE project_files (
    file_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    uploaded_by INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size INT,
    file_type VARCHAR(50),
    description TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE,
    FOREIGN KEY (uploaded_by) REFERENCES users(user_id)
);

-- =====================================================
-- PAYMENTS AND FINANCIAL
-- =====================================================

-- 21. Payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    milestone_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE,
    method ENUM('UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Debit Card', 'Net Banking', 'Wallet') NOT NULL,
    status ENUM('Pending', 'Processing', 'Paid', 'Failed', 'Refunded', 'Disputed') DEFAULT 'Pending',
    transaction_id VARCHAR(100),
    gateway_response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE,
    FOREIGN KEY (milestone_id) REFERENCES contract_milestones(milestone_id)
);

-- 22. Payment Methods
CREATE TABLE payment_methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    method_type ENUM('Bank Account', 'UPI', 'Card', 'Wallet') NOT NULL,
    account_details JSON,
    is_primary BOOLEAN DEFAULT FALSE,
    is_verified BOOLEAN DEFAULT FALSE,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 23. Invoices
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    invoice_number VARCHAR(50) UNIQUE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    tax_amount DECIMAL(10,2) DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('Draft', 'Sent', 'Paid', 'Overdue', 'Cancelled') DEFAULT 'Draft',
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE
);

-- 24. Financial Transactions
CREATE TABLE financial_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    transaction_type ENUM('Credit', 'Debit', 'Refund', 'Commission') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    reference_id VARCHAR(100),
    balance_after DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- =====================================================
-- REVIEWS AND RATINGS
-- =====================================================

-- 25. Reviews
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    reviewee_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    review_type ENUM('Freelancer to Client', 'Client to Freelancer') NOT NULL,
    is_public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES users(user_id),
    FOREIGN KEY (reviewee_id) REFERENCES users(user_id)
);

-- 26. Review Responses
CREATE TABLE review_responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    review_id INT NOT NULL,
    responder_id INT NOT NULL,
    response_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (review_id) REFERENCES reviews(review_id) ON DELETE CASCADE,
    FOREIGN KEY (responder_id) REFERENCES users(user_id)
);

-- =====================================================
-- MESSAGING AND COMMUNICATION
-- =====================================================

-- 27. Conversations
CREATE TABLE conversations (
    conversation_id INT AUTO_INCREMENT PRIMARY KEY,
    participant1_id INT NOT NULL,
    participant2_id INT NOT NULL,
    subject VARCHAR(200),
    last_message_at TIMESTAMP,
    is_archived BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (participant1_id) REFERENCES users(user_id),
    FOREIGN KEY (participant2_id) REFERENCES users(user_id)
);

-- 28. Messages
CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    conversation_id INT NOT NULL,
    sender_id INT NOT NULL,
    message_text TEXT NOT NULL,
    message_type ENUM('Text', 'File', 'Image', 'System') DEFAULT 'Text',
    is_read BOOLEAN DEFAULT FALSE,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    edited_at TIMESTAMP NULL,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id)
);

-- 29. Message Attachments
CREATE TABLE message_attachments (
    attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    message_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size INT,
    file_type VARCHAR(50),
    FOREIGN KEY (message_id) REFERENCES messages(message_id) ON DELETE CASCADE
);

-- =====================================================
-- NOTIFICATIONS AND ALERTS
-- =====================================================

-- 30. Notifications
CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    notification_type ENUM('Info', 'Success', 'Warning', 'Error', 'System') DEFAULT 'Info',
    is_read BOOLEAN DEFAULT FALSE,
    action_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 31. Notification Preferences
CREATE TABLE notification_preferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    email_notifications BOOLEAN DEFAULT TRUE,
    push_notifications BOOLEAN DEFAULT TRUE,
    sms_notifications BOOLEAN DEFAULT FALSE,
    new_gig_alerts BOOLEAN DEFAULT TRUE,
    application_updates BOOLEAN DEFAULT TRUE,
    payment_notifications BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- =====================================================
-- PORTFOLIO AND WORK SAMPLES
-- =====================================================

-- 32. Portfolios
CREATE TABLE portfolios (
    portfolio_id INT AUTO_INCREMENT PRIMARY KEY,
    freelancer_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    project_url VARCHAR(500),
    image_url VARCHAR(500),
    category_id INT,
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 33. Portfolio Images
CREATE TABLE portfolio_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id INT NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    caption VARCHAR(200),
    sort_order INT DEFAULT 0,
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id) ON DELETE CASCADE
);

-- =====================================================
-- ADMINISTRATION AND MODERATION
-- =====================================================

-- 34. Admin Users
CREATE TABLE admin_users (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    admin_level ENUM('Super Admin', 'Admin', 'Moderator') NOT NULL,
    permissions JSON,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 35. Reports
CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    reporter_id INT NOT NULL,
    reported_user_id INT,
    reported_gig_id INT,
    report_type ENUM('Spam', 'Inappropriate', 'Fraud', 'Harassment', 'Other') NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Pending', 'Under Review', 'Resolved', 'Dismissed') DEFAULT 'Pending',
    admin_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    FOREIGN KEY (reporter_id) REFERENCES users(user_id),
    FOREIGN KEY (reported_user_id) REFERENCES users(user_id),
    FOREIGN KEY (reported_gig_id) REFERENCES gigs(gig_id)
);

-- =====================================================
-- SYSTEM AND CONFIGURATION
-- =====================================================

-- 36. System Settings
CREATE TABLE system_settings (
    setting_id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    setting_type ENUM('String', 'Number', 'Boolean', 'JSON') DEFAULT 'String',
    description TEXT,
    is_public BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 37. User Sessions
CREATE TABLE user_sessions (
    session_id VARCHAR(128) PRIMARY KEY,
    user_id INT NOT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 38. Activity Logs
CREATE TABLE activity_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    description TEXT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- =====================================================
-- MARKETPLACE AND FEATURES
-- =====================================================

-- 39. Featured Listings
CREATE TABLE featured_listings (
    listing_id INT AUTO_INCREMENT PRIMARY KEY,
    listing_type ENUM('Freelancer', 'Gig', 'Portfolio') NOT NULL,
    listing_id_ref INT NOT NULL,
    start_date DATE,
    end_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 40. Bids and Auctions
CREATE TABLE bids (
    bid_id INT AUTO_INCREMENT PRIMARY KEY,
    gig_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    bid_amount DECIMAL(10,2) NOT NULL,
    bid_message TEXT,
    is_winning BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (gig_id) REFERENCES gigs(gig_id) ON DELETE CASCADE,
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id) ON DELETE CASCADE
);

-- =====================================================
-- ANALYTICS AND TRACKING
-- =====================================================

-- 41. Page Views
CREATE TABLE page_views (
    view_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    page_url VARCHAR(500),
    referrer_url VARCHAR(500),
    ip_address VARCHAR(45),
    user_agent TEXT,
    viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- 42. Search Queries
CREATE TABLE search_queries (
    query_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    search_term VARCHAR(200),
    filters JSON,
    results_count INT,
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- =====================================================
-- SUBSCRIPTIONS AND PLANS
-- =====================================================

-- 43. Subscription Plans
CREATE TABLE subscription_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100) NOT NULL,
    plan_type ENUM('Freelancer', 'Client', 'Both') NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_days INT NOT NULL,
    features JSON,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 44. User Subscriptions
CREATE TABLE user_subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('Active', 'Expired', 'Cancelled') DEFAULT 'Active',
    auto_renew BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);

-- =====================================================
-- SUPPORT AND HELP
-- =====================================================

-- 45. Support Tickets
CREATE TABLE support_tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    priority ENUM('Low', 'Medium', 'High', 'Urgent') DEFAULT 'Medium',
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    assigned_to INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES admin_users(admin_id)
);

-- 46. FAQ Categories
CREATE TABLE faq_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    sort_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE
);

-- 47. FAQs
CREATE TABLE faqs (
    faq_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    sort_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES faq_categories(category_id)
);

-- =====================================================
-- INTEGRATIONS AND API
-- =====================================================

-- 48. API Keys
CREATE TABLE api_keys (
    key_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    key_name VARCHAR(100) NOT NULL,
    api_key VARCHAR(255) UNIQUE NOT NULL,
    permissions JSON,
    is_active BOOLEAN DEFAULT TRUE,
    last_used_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 49. Webhooks
CREATE TABLE webhooks (
    webhook_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    webhook_url VARCHAR(500) NOT NULL,
    events JSON NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    secret_key VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 50. Integration Logs
CREATE TABLE integration_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    integration_type VARCHAR(50),
    action VARCHAR(100),
    status ENUM('Success', 'Failed', 'Pending') NOT NULL,
    request_data JSON,
    response_data JSON,
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- User-related indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_user_type ON users(user_type);
CREATE INDEX idx_freelancers_rating ON freelancers(rating);
CREATE INDEX idx_freelancers_experience ON freelancers(experience_level);
CREATE INDEX idx_clients_company ON clients(company_name);

-- Gig-related indexes
CREATE INDEX idx_gigs_status ON gigs(status);
CREATE INDEX idx_gigs_category ON gigs(category_id);
CREATE INDEX idx_gigs_budget ON gigs(budget_min, budget_max);
CREATE INDEX idx_gigs_posted_date ON gigs(posted_date);

-- Application indexes
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_applications_applied_date ON applications(applied_date);

-- Contract indexes
CREATE INDEX idx_contracts_status ON contracts(work_status);
CREATE INDEX idx_contracts_dates ON contracts(start_date, end_date);

-- Payment indexes
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_date ON payments(payment_date);

-- Message indexes
CREATE INDEX idx_messages_conversation ON messages(conversation_id);
CREATE INDEX idx_messages_sent_at ON messages(sent_at);

-- Notification indexes
CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_read ON notifications(is_read);

-- Activity log indexes
CREATE INDEX idx_activity_logs_user ON activity_logs(user_id);
CREATE INDEX idx_activity_logs_action ON activity_logs(action);
CREATE INDEX idx_activity_logs_created ON activity_logs(created_at);


