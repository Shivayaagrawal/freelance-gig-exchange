# 📋 Complete Table Reference Guide - All Fields & Attributes

This document lists all tables, their fields, data types, constraints, and allowed values for inserting data.

---

## 📊 TABLE 1: `freelancers`

**Purpose:** Stores freelancer profile information

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `freelancer_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `name` | VARCHAR(100) | NOT NULL | ✅ | - | Any string up to 100 characters |
| `email` | VARCHAR(100) | UNIQUE, NOT NULL | ✅ | - | Valid email address (must be unique) |
| `phone` | VARCHAR(15) | - | ❌ | NULL | Phone number (max 15 chars) |
| `location` | VARCHAR(50) | - | ❌ | NULL | City/location name (max 50 chars) |
| `experience_level` | ENUM | - | ❌ | 'Beginner' | **Must be one of:** 'Beginner', 'Intermediate', 'Expert' |
| `rating` | DECIMAL(2,1) | CHECK (0.0 to 5.0) | ❌ | 0.0 | Number between 0.0 and 5.0 (e.g., 4.5) |
| `total_completed` | INT | - | ❌ | 0 | Positive integer (number of completed projects) |
| `join_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |
| `updated_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-updated |

**Example INSERT:**
```sql
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) 
VALUES ('John Doe', 'john.doe@example.com', '9876543210', 'Mumbai', 'Expert', 4.5, 30, '2023-01-15');
```

---

## 📊 TABLE 2: `clients`

**Purpose:** Stores client/company information

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `client_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `name` | VARCHAR(100) | NOT NULL | ✅ | - | Client/company name (max 100 chars) |
| `email` | VARCHAR(100) | UNIQUE, NOT NULL | ✅ | - | Valid email address (must be unique) |
| `organization` | VARCHAR(100) | - | ❌ | NULL | Organization name (max 100 chars) |
| `location` | VARCHAR(50) | - | ❌ | NULL | City/location name (max 50 chars) |
| `member_since` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |
| `updated_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-updated |

**Example INSERT:**
```sql
INSERT INTO clients (name, email, organization, location, member_since) 
VALUES ('Tech Corp', 'contact@techcorp.com', 'Tech Corporation Ltd', 'Bangalore', '2024-01-01');
```

---

## 📊 TABLE 3: `categories`

**Purpose:** Stores gig categories

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `category_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `category_name` | VARCHAR(50) | UNIQUE, NOT NULL | ✅ | - | Category name (max 50 chars, must be unique) |
| `description` | TEXT | - | ❌ | NULL | Long text description |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |

**Example INSERT:**
```sql
INSERT INTO categories (category_name, description) 
VALUES ('Blockchain', 'Blockchain and cryptocurrency development projects');
```

---

## 📊 TABLE 4: `skills`

**Purpose:** Stores available skills

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `skill_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `skill_name` | VARCHAR(50) | UNIQUE, NOT NULL | ✅ | - | Skill name (max 50 chars, must be unique) |
| `category` | VARCHAR(30) | - | ❌ | NULL | Skill category (max 30 chars) |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |

**Example INSERT:**
```sql
INSERT INTO skills (skill_name, category) 
VALUES ('Solidity', 'Blockchain');
```

---

## 📊 TABLE 5: `freelancer_skills`

**Purpose:** Many-to-many relationship between freelancers and skills

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `freelancer_id` | INT | FOREIGN KEY, PRIMARY KEY | ✅ | - | **Must exist in `freelancers` table** |
| `skill_id` | INT | FOREIGN KEY, PRIMARY KEY | ✅ | - | **Must exist in `skills` table** |
| `proficiency_level` | ENUM | - | ❌ | 'Basic' | **Must be one of:** 'Basic', 'Intermediate', 'Advanced' |
| `years_experience` | INT | - | ❌ | 0 | Positive integer (years of experience) |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |

**Foreign Keys:**
- `freelancer_id` → `freelancers.freelancer_id` (ON DELETE CASCADE)
- `skill_id` → `skills.skill_id` (ON DELETE CASCADE)

**Example INSERT:**
```sql
INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience) 
VALUES (1, 1, 'Advanced', 5);
```

---

## 📊 TABLE 6: `gigs`

**Purpose:** Stores job postings/gigs

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `gig_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `client_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **Must exist in `clients` table** |
| `category_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **Must exist in `categories` table** |
| `title` | VARCHAR(150) | NOT NULL | ✅ | - | Gig title (max 150 chars) |
| `description` | TEXT | NOT NULL | ✅ | - | Detailed description (long text) |
| `budget` | DECIMAL(10,2) | NOT NULL, CHECK (> 0) | ✅ | - | Positive decimal (e.g., 150000.00) |
| `posted_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `deadline_date` | DATE | - | ❌ | NULL | Date in format: 'YYYY-MM-DD' |
| `status` | ENUM | - | ❌ | 'Open' | **Must be one of:** 'Open', 'In Progress', 'Completed', 'Cancelled' |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |
| `updated_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-updated |

**Foreign Keys:**
- `client_id` → `clients.client_id` (ON DELETE CASCADE)
- `category_id` → `categories.category_id` (ON DELETE RESTRICT)

**Example INSERT:**
```sql
INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status) 
VALUES (1, 1, 'E-commerce Website', 'Build a complete e-commerce platform', 150000.00, '2024-03-01', '2024-04-01', 'Open');
```

---

## 📊 TABLE 7: `applications`

**Purpose:** Stores freelancer applications for gigs

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `application_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `gig_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **Must exist in `gigs` table** |
| `freelancer_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **Must exist in `freelancers` table** |
| `proposal_text` | TEXT | NOT NULL | ✅ | - | Proposal/cover letter (long text) |
| `bid_amount` | DECIMAL(10,2) | NOT NULL, CHECK (> 0) | ✅ | - | Positive decimal (e.g., 140000.00) |
| `applied_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `status` | ENUM | - | ❌ | 'Pending' | **Must be one of:** 'Pending', 'Approved', 'Rejected' |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |
| `updated_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-updated |

**Foreign Keys:**
- `gig_id` → `gigs.gig_id` (ON DELETE CASCADE)
- `freelancer_id` → `freelancers.freelancer_id` (ON DELETE CASCADE)

**Unique Constraint:**
- A freelancer can only apply once per gig: `UNIQUE(gig_id, freelancer_id)`

**Example INSERT:**
```sql
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status) 
VALUES (1, 1, 'I have extensive experience in this field...', 140000.00, '2024-03-02', 'Pending');
```

---

## 📊 TABLE 8: `contracts`

**Purpose:** Stores active contracts between clients and freelancers

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `contract_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `application_id` | INT | FOREIGN KEY, UNIQUE, NOT NULL | ✅ | - | **Must exist in `applications` table** (one contract per application) |
| `start_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `end_date` | DATE | - | ❌ | NULL | Date in format: 'YYYY-MM-DD' |
| `work_status` | ENUM | - | ❌ | 'Active' | **Must be one of:** 'Active', 'Completed', 'Cancelled' |
| `total_payment` | DECIMAL(10,2) | NOT NULL, CHECK (> 0) | ✅ | - | Positive decimal (e.g., 140000.00) |
| `milestone_count` | INT | - | ❌ | 1 | Positive integer (number of milestones) |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |
| `updated_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-updated |

**Foreign Keys:**
- `application_id` → `applications.application_id` (ON DELETE CASCADE)

**Unique Constraint:**
- Only one contract per application: `UNIQUE(application_id)`

**Example INSERT:**
```sql
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count) 
VALUES (1, '2024-03-05', '2024-04-01', 'Active', 140000.00, 2);
```

---

## 📊 TABLE 9: `payments`

**Purpose:** Stores payment transactions

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `payment_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `contract_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **Must exist in `contracts` table** |
| `amount` | DECIMAL(10,2) | NOT NULL, CHECK (> 0) | ✅ | - | Positive decimal (e.g., 70000.00) |
| `payment_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `method` | ENUM | NOT NULL | ✅ | - | **Must be one of:** 'UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking' |
| `status` | ENUM | - | ❌ | 'Pending' | **Must be one of:** 'Paid', 'Pending', 'Failed' |
| `transaction_id` | VARCHAR(100) | - | ❌ | NULL | Transaction ID (max 100 chars) |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |

**Foreign Keys:**
- `contract_id` → `contracts.contract_id` (ON DELETE CASCADE)

**Example INSERT:**
```sql
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) 
VALUES (1, 70000.00, '2024-03-05', 'UPI', 'Paid', 'UPI987654321');
```

---

## 📊 TABLE 10: `reviews`

**Purpose:** Stores client reviews for completed contracts

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `review_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `contract_id` | INT | FOREIGN KEY, UNIQUE, NOT NULL | ✅ | - | **Must exist in `contracts` table** (one review per contract) |
| `rating` | INT | NOT NULL, CHECK (1 to 5) | ✅ | - | Integer between 1 and 5 (inclusive) |
| `comments` | TEXT | - | ❌ | NULL | Review comments (long text) |
| `review_date` | DATE | - | ❌ | CURRENT_DATE | Date in format: 'YYYY-MM-DD' |
| `created_at` | TIMESTAMP | - | ❌ | CURRENT_TIMESTAMP | **DO NOT INSERT** - Auto-generated |

**Foreign Keys:**
- `contract_id` → `contracts.contract_id` (ON DELETE CASCADE)

**Unique Constraint:**
- Only one review per contract: `UNIQUE(contract_id)`

**Example INSERT:**
```sql
INSERT INTO reviews (contract_id, rating, comments, review_date) 
VALUES (1, 5, 'Excellent work! Very professional and delivered on time.', '2024-04-02');
```

---

## 📊 TABLE 11: `messages`

**Purpose:** Stores communication messages between clients and freelancers

| Field Name | Data Type | Constraints | Required | Default | Allowed Values / Notes |
|------------|-----------|-------------|----------|---------|------------------------|
| `message_id` | INT | AUTO_INCREMENT, PRIMARY KEY | ❌ | Auto | **DO NOT INSERT** - Auto-generated |
| `sender_type` | ENUM | NOT NULL | ✅ | - | **Must be one of:** 'Client', 'Freelancer' |
| `sender_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **If sender_type='Client':** must exist in `clients.client_id`<br>**If sender_type='Freelancer':** must exist in `freelancers.freelancer_id` |
| `receiver_id` | INT | FOREIGN KEY, NOT NULL | ✅ | - | **If sender_type='Client':** must exist in `freelancers.freelancer_id`<br>**If sender_type='Freelancer':** must exist in `clients.client_id` |
| `message_text` | TEXT | NOT NULL | ✅ | - | Message content (long text) |
| `sent_at` | DATETIME | - | ❌ | CURRENT_TIMESTAMP | Date and time: 'YYYY-MM-DD HH:MM:SS' |
| `is_read` | BOOLEAN | - | ❌ | FALSE | TRUE or FALSE (or 1 or 0) |

**Foreign Keys:**
- `sender_id` → `clients.client_id` (ON DELETE CASCADE)
- `receiver_id` → `freelancers.freelancer_id` (ON DELETE CASCADE)

**Important Notes:**
- If `sender_type = 'Client'`, then `sender_id` must be a valid `client_id` and `receiver_id` must be a valid `freelancer_id`
- If `sender_type = 'Freelancer'`, then `sender_id` must be a valid `freelancer_id` and `receiver_id` must be a valid `client_id`

**Example INSERT (Client to Freelancer):**
```sql
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES ('Client', 1, 1, 'Hello! I would like to discuss the project.', '2024-03-01 10:30:00', FALSE);
```

**Example INSERT (Freelancer to Client):**
```sql
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES ('Freelancer', 1, 1, 'Thank you for your message. I am available.', '2024-03-01 11:00:00', FALSE);
```

---

## 🔗 Foreign Key Relationships Summary

### Insertion Order (Respect Foreign Keys):

1. **Independent Tables** (no foreign keys):
   - `categories`
   - `skills`
   - `freelancers`
   - `clients`

2. **Dependent Tables** (require foreign keys):
   - `freelancer_skills` → needs `freelancer_id` and `skill_id`
   - `gigs` → needs `client_id` and `category_id`
   - `applications` → needs `gig_id` and `freelancer_id`
   - `contracts` → needs `application_id`
   - `payments` → needs `contract_id`
   - `reviews` → needs `contract_id`
   - `messages` → needs `client_id` and `freelancer_id`

---

## 📝 Quick Reference: ENUM Values

| Table | Field | Allowed Values |
|-------|-------|----------------|
| `freelancers` | `experience_level` | 'Beginner', 'Intermediate', 'Expert' |
| `freelancer_skills` | `proficiency_level` | 'Basic', 'Intermediate', 'Advanced' |
| `gigs` | `status` | 'Open', 'In Progress', 'Completed', 'Cancelled' |
| `applications` | `status` | 'Pending', 'Approved', 'Rejected' |
| `contracts` | `work_status` | 'Active', 'Completed', 'Cancelled' |
| `payments` | `method` | 'UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking' |
| `payments` | `status` | 'Paid', 'Pending', 'Failed' |
| `messages` | `sender_type` | 'Client', 'Freelancer' |

---

## ✅ Common INSERT Patterns

### Minimal Required Fields Only:
```sql
-- Freelancer (minimal)
INSERT INTO freelancers (name, email) VALUES ('John Doe', 'john@example.com');

-- Client (minimal)
INSERT INTO clients (name, email) VALUES ('Tech Corp', 'contact@techcorp.com');

-- Category (minimal)
INSERT INTO categories (category_name) VALUES ('Web Development');

-- Skill (minimal)
INSERT INTO skills (skill_name) VALUES ('Python');
```

### Full Example with All Fields:
```sql
-- Freelancer (full)
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) 
VALUES ('John Doe', 'john@example.com', '9876543210', 'Mumbai', 'Expert', 4.5, 30, '2023-01-15');
```

---

## 🚨 Important Constraints to Remember

1. **UNIQUE Constraints:**
   - `freelancers.email` - Must be unique
   - `clients.email` - Must be unique
   - `categories.category_name` - Must be unique
   - `skills.skill_name` - Must be unique
   - `applications(gig_id, freelancer_id)` - A freelancer can only apply once per gig
   - `contracts.application_id` - Only one contract per application
   - `reviews.contract_id` - Only one review per contract

2. **CHECK Constraints:**
   - `freelancers.rating` - Must be between 0.0 and 5.0
   - `gigs.budget` - Must be > 0
   - `applications.bid_amount` - Must be > 0
   - `contracts.total_payment` - Must be > 0
   - `payments.amount` - Must be > 0
   - `reviews.rating` - Must be between 1 and 5

3. **Foreign Key Constraints:**
   - All foreign keys must reference existing records
   - Some have CASCADE delete (data is deleted if parent is deleted)
   - Some have RESTRICT delete (prevents deletion if child exists)

---

**Happy Inserting! 🎉**

