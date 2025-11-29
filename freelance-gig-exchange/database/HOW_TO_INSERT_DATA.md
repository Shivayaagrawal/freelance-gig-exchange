# 📝 How to Insert Tuples (Rows) into Database Tables

This guide shows you how to safely insert new data into your database tables **without deleting or changing anything**.

## 🎯 Methods to Insert Data

### **Method 1: Using MySQL Command Line** (Recommended)

```bash
# Connect to MySQL
mysql -u root -p

# Select the database
USE freelance_gig_exchange;

# Then run your INSERT statements (see examples below)
```

### **Method 2: Using Custom Query Feature in Frontend**

1. Open your frontend: `http://localhost:3000`
2. Navigate to **Custom Query** section
3. Paste your INSERT statements
4. Click Execute

### **Method 3: Using SQL File**

```bash
# Create a file with INSERT statements, then run:
mysql -u root -p freelance_gig_exchange < your_insert_file.sql
```

---

## 📊 Table Insertion Order (Important!)

Insert data in this order to respect foreign key relationships:

1. **Categories** (no dependencies)
2. **Skills** (no dependencies)
3. **Freelancers** (no dependencies)
4. **Clients** (no dependencies)
5. **Freelancer_Skills** (needs freelancer_id and skill_id)
6. **Gigs** (needs client_id and category_id)
7. **Applications** (needs gig_id and freelancer_id)
8. **Contracts** (needs application_id)
9. **Payments** (needs contract_id)
10. **Reviews** (needs contract_id)
11. **Messages** (needs client_id and freelancer_id)

---

## 💡 INSERT Examples for Each Table

### **1. Insert into FREELANCERS Table**

```sql
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) 
VALUES 
('John Doe', 'john.doe@example.com', '9876543210', 'Mumbai', 'Expert', 4.5, 30, '2023-01-15');
```

**Fields:**
- `name` - VARCHAR(100) - REQUIRED
- `email` - VARCHAR(100) - REQUIRED, UNIQUE
- `phone` - VARCHAR(15) - Optional
- `location` - VARCHAR(50) - Optional
- `experience_level` - ENUM('Beginner', 'Intermediate', 'Expert') - Optional (default: 'Beginner')
- `rating` - DECIMAL(2,1) - Optional (0.0 to 5.0)
- `total_completed` - INT - Optional (default: 0)
- `join_date` - DATE - Optional (default: CURRENT_DATE)

**Example with minimal fields:**
```sql
INSERT INTO freelancers (name, email) 
VALUES ('Jane Smith', 'jane.smith@example.com');
```

---

### **2. Insert into CLIENTS Table**

```sql
INSERT INTO clients (name, email, organization, location, member_since) 
VALUES 
('Tech Corp', 'contact@techcorp.com', 'Tech Corporation Ltd', 'Bangalore', '2024-01-01');
```

**Fields:**
- `name` - VARCHAR(100) - REQUIRED
- `email` - VARCHAR(100) - REQUIRED, UNIQUE
- `organization` - VARCHAR(100) - Optional
- `location` - VARCHAR(50) - Optional
- `member_since` - DATE - Optional (default: CURRENT_DATE)

**Example with minimal fields:**
```sql
INSERT INTO clients (name, email) 
VALUES ('New Client', 'newclient@example.com');
```

---

### **3. Insert into CATEGORIES Table**

```sql
INSERT INTO categories (category_name, description) 
VALUES 
('Blockchain', 'Blockchain and cryptocurrency development projects');
```

**Fields:**
- `category_name` - VARCHAR(50) - REQUIRED, UNIQUE
- `description` - TEXT - Optional

**Note:** Check existing categories first:
```sql
SELECT * FROM categories;
```

---

### **4. Insert into SKILLS Table**

```sql
INSERT INTO skills (skill_name, category) 
VALUES 
('Solidity', 'Blockchain');
```

**Fields:**
- `skill_name` - VARCHAR(50) - REQUIRED, UNIQUE
- `category` - VARCHAR(30) - Optional

**Note:** Check existing skills first:
```sql
SELECT * FROM skills;
```

---

### **5. Insert into FREELANCER_SKILLS Table** (Many-to-Many)

```sql
INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience) 
VALUES 
(1, 1, 'Advanced', 5);
```

**Fields:**
- `freelancer_id` - INT - REQUIRED (must exist in freelancers table)
- `skill_id` - INT - REQUIRED (must exist in skills table)
- `proficiency_level` - ENUM('Basic', 'Intermediate', 'Advanced') - Optional (default: 'Basic')
- `years_experience` - INT - Optional (default: 0)

**Check existing IDs:**
```sql
-- Get freelancer IDs
SELECT freelancer_id, name FROM freelancers;

-- Get skill IDs
SELECT skill_id, skill_name FROM skills;
```

---

### **6. Insert into GIGS Table**

```sql
INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status) 
VALUES 
(1, 1, 'New Website Project', 'Build a modern responsive website', 100000.00, '2024-03-01', '2024-04-01', 'Open');
```

**Fields:**
- `client_id` - INT - REQUIRED (must exist in clients table)
- `category_id` - INT - REQUIRED (must exist in categories table)
- `title` - VARCHAR(150) - REQUIRED
- `description` - TEXT - REQUIRED
- `budget` - DECIMAL(10,2) - REQUIRED (must be > 0)
- `posted_date` - DATE - Optional (default: CURRENT_DATE)
- `deadline_date` - DATE - Optional
- `status` - ENUM('Open', 'In Progress', 'Completed', 'Cancelled') - Optional (default: 'Open')

**Check existing IDs:**
```sql
-- Get client IDs
SELECT client_id, name FROM clients;

-- Get category IDs
SELECT category_id, category_name FROM categories;
```

---

### **7. Insert into APPLICATIONS Table**

```sql
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status) 
VALUES 
(1, 1, 'I have extensive experience in web development and can deliver this project on time.', 95000.00, '2024-03-02', 'Pending');
```

**Fields:**
- `gig_id` - INT - REQUIRED (must exist in gigs table)
- `freelancer_id` - INT - REQUIRED (must exist in freelancers table)
- `proposal_text` - TEXT - REQUIRED
- `bid_amount` - DECIMAL(10,2) - REQUIRED (must be > 0)
- `applied_date` - DATE - Optional (default: CURRENT_DATE)
- `status` - ENUM('Pending', 'Approved', 'Rejected') - Optional (default: 'Pending')

**Note:** A freelancer can only apply once per gig (UNIQUE constraint)

**Check existing IDs:**
```sql
-- Get gig IDs
SELECT gig_id, title FROM gigs;

-- Get freelancer IDs
SELECT freelancer_id, name FROM freelancers;
```

---

### **8. Insert into CONTRACTS Table**

```sql
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count) 
VALUES 
(1, '2024-03-05', '2024-04-01', 'Active', 95000.00, 2);
```

**Fields:**
- `application_id` - INT - REQUIRED, UNIQUE (must exist in applications table)
- `start_date` - DATE - Optional (default: CURRENT_DATE)
- `end_date` - DATE - Optional
- `work_status` - ENUM('Active', 'Completed', 'Cancelled') - Optional (default: 'Active')
- `total_payment` - DECIMAL(10,2) - REQUIRED (must be > 0)
- `milestone_count` - INT - Optional (default: 1)

**Note:** Only one contract per application (UNIQUE constraint)

**Check existing application IDs:**
```sql
SELECT application_id, gig_id, freelancer_id FROM applications WHERE status = 'Approved';
```

---

### **9. Insert into PAYMENTS Table**

```sql
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) 
VALUES 
(1, 47500.00, '2024-03-05', 'UPI', 'Paid', 'UPI987654321');
```

**Fields:**
- `contract_id` - INT - REQUIRED (must exist in contracts table)
- `amount` - DECIMAL(10,2) - REQUIRED (must be > 0)
- `payment_date` - DATE - Optional (default: CURRENT_DATE)
- `method` - ENUM('UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking') - REQUIRED
- `status` - ENUM('Paid', 'Pending', 'Failed') - Optional (default: 'Pending')
- `transaction_id` - VARCHAR(100) - Optional

**Check existing contract IDs:**
```sql
SELECT contract_id, total_payment, work_status FROM contracts;
```

---

### **10. Insert into REVIEWS Table**

```sql
INSERT INTO reviews (contract_id, rating, comments, review_date) 
VALUES 
(1, 5, 'Excellent work! Very professional and delivered on time.', '2024-04-02');
```

**Fields:**
- `contract_id` - INT - REQUIRED, UNIQUE (must exist in contracts table)
- `rating` - INT - REQUIRED (1 to 5)
- `comments` - TEXT - Optional
- `review_date` - DATE - Optional (default: CURRENT_DATE)

**Note:** Only one review per contract (UNIQUE constraint)

**Check existing contract IDs:**
```sql
SELECT contract_id FROM contracts WHERE work_status = 'Completed';
```

---

### **11. Insert into MESSAGES Table**

```sql
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES 
('Client', 1, 1, 'Hello, I would like to discuss the project details.', '2024-03-01 10:30:00', FALSE);
```

**Fields:**
- `sender_type` - ENUM('Client', 'Freelancer') - REQUIRED
- `sender_id` - INT - REQUIRED (must exist in clients or freelancers table based on sender_type)
- `receiver_id` - INT - REQUIRED (must exist in freelancers or clients table based on sender_type)
- `message_text` - TEXT - REQUIRED
- `sent_at` - DATETIME - Optional (default: CURRENT_TIMESTAMP)
- `is_read` - BOOLEAN - Optional (default: FALSE)

**Note:** 
- If `sender_type = 'Client'`, then `sender_id` must be a valid `client_id` and `receiver_id` must be a valid `freelancer_id`
- If `sender_type = 'Freelancer'`, then `sender_id` must be a valid `freelancer_id` and `receiver_id` must be a valid `client_id`

---

## 🔍 Useful Queries to Check Existing Data

### Check all existing IDs before inserting:

```sql
-- Check freelancers
SELECT freelancer_id, name, email FROM freelancers;

-- Check clients
SELECT client_id, name, email FROM clients;

-- Check categories
SELECT category_id, category_name FROM categories;

-- Check skills
SELECT skill_id, skill_name FROM skills;

-- Check gigs
SELECT gig_id, title, client_id, category_id FROM gigs;

-- Check applications
SELECT application_id, gig_id, freelancer_id, status FROM applications;

-- Check contracts
SELECT contract_id, application_id, work_status FROM contracts;
```

---

## ✅ Complete Example: Inserting a New Workflow

Here's a complete example of inserting a new freelancer, client, gig, application, contract, and payment:

```sql
-- Step 1: Insert a new freelancer
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed) 
VALUES ('Arjun Desai', 'arjun.desai@example.com', '9876543212', 'Pune', 'Expert', 4.7, 35);

-- Step 2: Insert a new client
INSERT INTO clients (name, email, organization, location) 
VALUES ('StartupXYZ', 'contact@startupxyz.com', 'StartupXYZ Technologies', 'Bangalore');

-- Step 3: Check category_id (assuming category_id = 1 exists)
-- If not, insert a category first:
-- INSERT INTO categories (category_name, description) VALUES ('Web Development', 'Web development projects');

-- Step 4: Insert a new gig (using the new client_id, let's say it's 6)
-- First, get the client_id:
SELECT client_id FROM clients WHERE email = 'contact@startupxyz.com';
-- Then insert gig (assuming client_id = 6, category_id = 1):
INSERT INTO gigs (client_id, category_id, title, description, budget, status) 
VALUES (6, 1, 'E-commerce Platform', 'Build a full-featured e-commerce platform', 200000.00, 'Open');

-- Step 5: Insert application (get freelancer_id and gig_id first)
-- Assuming freelancer_id = 11 (the new freelancer), gig_id = 11 (the new gig):
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, status) 
VALUES (11, 11, 'I have 5+ years experience in e-commerce development. Ready to start immediately.', 190000.00, 'Approved');

-- Step 6: Insert contract (get application_id first, let's say it's 16):
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment) 
VALUES (16, '2024-03-10', '2024-05-10', 'Active', 190000.00);

-- Step 7: Insert payment (get contract_id first, let's say it's 6):
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) 
VALUES (6, 95000.00, '2024-03-10', 'UPI', 'Paid', 'UPI111222333');
```

---

## 🚨 Important Notes

1. **Foreign Key Constraints**: Always ensure referenced IDs exist before inserting
2. **UNIQUE Constraints**: 
   - Email must be unique in `freelancers` and `clients`
   - A freelancer can only apply once per gig
   - Only one contract per application
   - Only one review per contract
3. **ENUM Values**: Use exact values as defined (case-sensitive)
4. **Data Types**: Match the data types correctly (dates, decimals, etc.)
5. **AUTO_INCREMENT**: Don't specify values for primary keys (they auto-increment)

---

## 🛠️ Troubleshooting

### Error: "Duplicate entry for key 'email'"
- The email already exists. Use a different email or check existing emails.

### Error: "Cannot add or update a child row: a foreign key constraint fails"
- The foreign key ID doesn't exist. Check the referenced table first.

### Error: "Data truncated for column"
- The value doesn't match the column type or ENUM value. Check the allowed values.

---

## 📝 Quick Reference: Table Relationships

```
Categories (1) ───< Gigs (M)
Clients (1) ───< Gigs (M)
Skills (1) ───< Freelancer_Skills (M) ───< Freelancers (1)
Gigs (1) ───< Applications (M) ───< Freelancers (1)
Applications (1) ───< Contracts (1)
Contracts (1) ───< Payments (M)
Contracts (1) ───< Reviews (1)
Clients (1) ───< Messages (M)
Freelancers (1) ───< Messages (M)
```

---

## 💻 Ready-to-Use SQL File Template

Save this as `insert_new_data.sql`:

```sql
USE freelance_gig_exchange;

-- Insert new freelancer
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed) 
VALUES ('Your Name', 'your.email@example.com', '9876543210', 'Your City', 'Expert', 4.5, 20);

-- Insert new client
INSERT INTO clients (name, email, organization, location) 
VALUES ('Client Name', 'client@example.com', 'Client Organization', 'Client City');

-- Insert new gig (update client_id and category_id)
INSERT INTO gigs (client_id, category_id, title, description, budget, status) 
VALUES (1, 1, 'Project Title', 'Project Description', 100000.00, 'Open');

-- Insert application (update gig_id and freelancer_id)
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, status) 
VALUES (1, 1, 'Your proposal text here', 95000.00, 'Pending');
```

Run it with:
```bash
mysql -u root -p freelance_gig_exchange < insert_new_data.sql
```

---

**Happy Inserting! 🎉**

