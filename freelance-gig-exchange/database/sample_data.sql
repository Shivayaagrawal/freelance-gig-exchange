

USE freelance_gig_exchange;


INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) VALUES
('Rohan Mehta', 'rohan.mehta@gmail.com', '9876543210', 'Delhi', 'Expert', 4.8, 45, '2021-03-15'),
('Priya Sharma', 'priya.sharma@gmail.com', '9988776655', 'Bangalore', 'Expert', 4.9, 52, '2020-11-20'),
('Amit Patel', 'amit.patel@gmail.com', '9123456789', 'Ahmedabad', 'Intermediate', 4.2, 18, '2022-06-10'),
('Neha Verma', 'neha.verma@gmail.com', '9812345678', 'Pune', 'Beginner', 4.0, 8, '2023-01-15'),
('Rajesh Kumar', 'rajesh.kumar@gmail.com', '9871234567', 'Mumbai', 'Expert', 4.7, 38, '2021-08-22'),
('Sneha Singh', 'sneha.singh@gmail.com', '9987654321', 'Chennai', 'Intermediate', 4.3, 22, '2022-02-14'),
('Vikram Joshi', 'vikram.joshi@gmail.com', '9123789456', 'Hyderabad', 'Expert', 4.6, 41, '2021-05-30'),
('Anita Reddy', 'anita.reddy@gmail.com', '9876543211', 'Bangalore', 'Intermediate', 4.1, 15, '2022-09-05'),
('Suresh Gupta', 'suresh.gupta@gmail.com', '9988776656', 'Delhi', 'Beginner', 3.8, 6, '2023-03-20'),
('Kavya Nair', 'kavya.nair@gmail.com', '9123456780', 'Kochi', 'Intermediate', 4.4, 25, '2022-01-10');


INSERT INTO clients (name, email, organization, location, member_since) VALUES
('TCS Innovations', 'contact@tcs.com', 'Tata Consultancy Services', 'Mumbai', '2021-08-01'),
('Infosys Labs', 'hr@infosys.com', 'Infosys Limited', 'Bangalore', '2022-05-15'),
('Aditya Tech Solutions', 'support@adityatech.in', 'Aditya Technologies', 'Noida', '2024-02-09'),
('Wipro Digital', 'projects@wipro.com', 'Wipro Limited', 'Pune', '2021-12-20'),
('HCL Technologies', 'business@hcl.com', 'HCL Tech', 'Chennai', '2022-03-10');


INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience) VALUES
(1, 1, 'Advanced', 5), (1, 6, 'Advanced', 4), (1, 5, 'Advanced', 3),
(2, 2, 'Advanced', 6), (2, 3, 'Advanced', 5), (2, 4, 'Advanced', 4),
(3, 8, 'Intermediate', 3), (3, 9, 'Intermediate', 2), (3, 5, 'Intermediate', 2),
(4, 11, 'Basic', 1), (4, 2, 'Basic', 1), (4, 3, 'Basic', 1),
(5, 10, 'Advanced', 4), (5, 16, 'Advanced', 3), (5, 17, 'Advanced', 3),
(6, 1, 'Intermediate', 3), (6, 18, 'Intermediate', 2), (6, 19, 'Intermediate', 2),
(7, 2, 'Advanced', 4), (7, 4, 'Advanced', 3), (7, 8, 'Advanced', 3);

-- =====================================================
-- GIGS DATA (10 entries with realistic Indian pricing)
-- =====================================================
INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status) VALUES
(1, 1, 'E-commerce Website Development', 'Build a complete e-commerce platform with payment gateway integration for Indian market', 150000.00, '2024-01-15', '2024-03-15', 'Open'),
(2, 2, 'Data Analytics Dashboard', 'Create interactive dashboard for business intelligence using Python and React', 120000.00, '2024-01-20', '2024-02-28', 'Open'),
(3, 3, 'Mobile App for Food Delivery', 'Develop iOS and Android app for food delivery service with real-time tracking', 200000.00, '2024-01-25', '2024-04-25', 'Open'),
(4, 4, 'UI/UX Design for Fintech App', 'Design modern and intuitive interface for digital banking application', 80000.00, '2024-02-01', '2024-03-01', 'Open'),
(5, 5, 'DevOps Pipeline Setup', 'Set up CI/CD pipeline using AWS and Docker for microservices architecture', 100000.00, '2024-02-05', '2024-03-20', 'Open'),
(1, 6, 'Machine Learning Model for Fraud Detection', 'Develop ML model to detect fraudulent transactions in banking system', 180000.00, '2024-02-10', '2024-04-10', 'Open'),
(2, 1, 'Corporate Website with CMS', 'Build responsive corporate website with content management system', 60000.00, '2024-02-15', '2024-03-15', 'Open'),
(3, 2, 'Customer Analytics Platform', 'Analyze customer behavior data and create insights dashboard', 90000.00, '2024-02-20', '2024-03-30', 'Open'),
(4, 3, 'Healthcare Mobile App', 'Develop telemedicine app with video consultation features', 250000.00, '2024-02-25', '2024-05-25', 'Open'),
(5, 4, 'Brand Identity Design', 'Create complete brand identity including logo, color scheme, and guidelines', 50000.00, '2024-03-01', '2024-03-20', 'Open');

-- =====================================================
-- APPLICATIONS DATA (15 entries)
-- =====================================================
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status) VALUES
(1, 1, 'I have 5+ years experience in e-commerce development with payment gateway integration. I can deliver this project within timeline with modern tech stack.', 140000.00, '2024-01-16', 'Approved'),
(1, 2, 'Expert in full-stack development with proven track record in e-commerce platforms. Ready to start immediately.', 150000.00, '2024-01-17', 'Pending'),
(2, 6, 'Data science expert with 3+ years experience in building analytics dashboards using Python and React.', 110000.00, '2024-01-21', 'Approved'),
(2, 7, 'I specialize in data analytics and visualization. Have worked on similar projects for Fortune 500 companies.', 120000.00, '2024-01-22', 'Pending'),
(3, 7, 'Mobile app development expert with 4+ years experience in iOS and Android development.', 190000.00, '2024-01-26', 'Approved'),
(3, 8, 'Full-stack mobile developer with expertise in real-time features and payment integration.', 200000.00, '2024-01-27', 'Pending'),
(4, 8, 'UI/UX designer with 2+ years experience in fintech applications. Portfolio available for review.', 75000.00, '2024-02-02', 'Approved'),
(4, 9, 'Creative designer with expertise in financial application interfaces and user experience.', 80000.00, '2024-02-03', 'Pending'),
(5, 5, 'DevOps engineer with AWS certification and 4+ years experience in CI/CD pipeline setup.', 95000.00, '2024-02-06', 'Approved'),
(5, 10, 'DevOps specialist with expertise in Docker, Kubernetes, and cloud infrastructure.', 100000.00, '2024-02-07', 'Pending'),
(6, 6, 'Machine learning expert with 4+ years experience in fraud detection systems.', 170000.00, '2024-02-11', 'Approved'),
(6, 7, 'Data scientist specializing in fraud detection and risk assessment models.', 180000.00, '2024-02-12', 'Pending'),
(7, 2, 'Full-stack developer with expertise in CMS development and responsive design.', 55000.00, '2024-02-16', 'Approved'),
(7, 3, 'React developer with CMS experience and modern web development practices.', 60000.00, '2024-02-17', 'Pending'),
(8, 9, 'Data analyst with expertise in customer behavior analysis and dashboard creation.', 85000.00, '2024-02-21', 'Approved');

-- =====================================================
-- CONTRACTS DATA (5 entries)
-- =====================================================
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment) VALUES
(1, '2024-01-20', '2024-03-15', 'Active', 140000.00),
(3, '2024-01-25', '2024-02-28', 'Active', 110000.00),
(5, '2024-01-30', '2024-04-25', 'Active', 190000.00),
(7, '2024-02-05', '2024-03-01', 'Active', 75000.00),
(9, '2024-02-10', '2024-03-20', 'Active', 95000.00);

-- =====================================================
-- PAYMENTS DATA (8 entries)
-- =====================================================
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) VALUES
(1, 70000.00, '2024-01-20', 'UPI', 'Paid', 'UPI123456789'),
(1, 70000.00, '2024-02-20', 'UPI', 'Pending', 'UPI123456790'),
(2, 55000.00, '2024-01-25', 'Bank Transfer', 'Paid', 'BT987654321'),
(2, 55000.00, '2024-02-25', 'Bank Transfer', 'Pending', 'BT987654322'),
(3, 95000.00, '2024-01-30', 'Paytm', 'Paid', 'PTM456789123'),
(3, 95000.00, '2024-02-28', 'Paytm', 'Pending', 'PTM456789124'),
(4, 37500.00, '2024-02-05', 'UPI', 'Paid', 'UPI789123456'),
(4, 37500.00, '2024-02-20', 'UPI', 'Pending', 'UPI789123457');

-- =====================================================
-- REVIEWS DATA (3 entries)
-- =====================================================
INSERT INTO reviews (contract_id, rating, comments, review_date) VALUES
(1, 5, 'Excellent work! Delivered on time with high quality code. Highly recommended for e-commerce projects.', '2024-03-16'),
(2, 4, 'Good dashboard with clear insights. Minor issues with data visualization but overall satisfied.', '2024-02-28'),
(3, 5, 'Outstanding mobile app development. Great communication and technical expertise.', '2024-04-26');

-- =====================================================
-- MESSAGES DATA (10 entries)
-- =====================================================
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at) VALUES
('Client', 1, 1, 'Hi Rohan, I am interested in your proposal for the e-commerce project. Can we discuss the timeline?', '2024-01-16 10:30:00'),
('Freelancer', 1, 1, 'Hello! Yes, I can start immediately and deliver within 8 weeks. Let me know your preferred tech stack.', '2024-01-16 11:15:00'),
('Client', 2, 6, 'Your data analytics proposal looks promising. Do you have experience with React dashboards?', '2024-01-21 14:20:00'),
('Freelancer', 6, 2, 'Yes, I have built multiple React dashboards with D3.js and Chart.js. I can show you my portfolio.', '2024-01-21 15:45:00'),
('Client', 3, 7, 'The mobile app project is quite complex. Are you comfortable with real-time tracking features?', '2024-01-26 09:10:00'),
('Freelancer', 7, 3, 'Absolutely! I have experience with Firebase real-time database and location tracking APIs.', '2024-01-26 10:30:00'),
('Client', 4, 8, 'We need the UI/UX design to be modern and user-friendly. Can you share some of your previous work?', '2024-02-02 16:00:00'),
('Freelancer', 8, 4, 'I will send you my portfolio with fintech app designs. I focus on clean, intuitive interfaces.', '2024-02-02 17:20:00'),
('Client', 5, 5, 'The DevOps setup needs to be scalable. What cloud platforms do you work with?', '2024-02-06 12:15:00'),
('Freelancer', 5, 5, 'I work with AWS, Azure, and GCP. I can set up auto-scaling and monitoring for your infrastructure.', '2024-02-06 13:30:00');

COMMIT;





