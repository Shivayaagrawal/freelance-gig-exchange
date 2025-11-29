# ⚡ Quick Insert Reference - All Tables & Fields

Quick reference for inserting data into all tables.

---

## 📋 TABLE 1: `freelancers`

```sql
INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) 
VALUES ('Name', 'email@example.com', '9876543210', 'City', 'Expert', 4.5, 30, '2024-01-15');
```

**Required:** `name`, `email` (unique)  
**Optional:** `phone`, `location`, `experience_level` ('Beginner'/'Intermediate'/'Expert'), `rating` (0.0-5.0), `total_completed` (int), `join_date` ('YYYY-MM-DD')

---

## 📋 TABLE 2: `clients`

```sql
INSERT INTO clients (name, email, organization, location, member_since) 
VALUES ('Client Name', 'contact@example.com', 'Organization', 'City', '2024-01-01');
```

**Required:** `name`, `email` (unique)  
**Optional:** `organization`, `location`, `member_since` ('YYYY-MM-DD')

---

## 📋 TABLE 3: `categories`

```sql
INSERT INTO categories (category_name, description) 
VALUES ('Category Name', 'Description text');
```

**Required:** `category_name` (unique)  
**Optional:** `description`

---

## 📋 TABLE 4: `skills`

```sql
INSERT INTO skills (skill_name, category) 
VALUES ('Skill Name', 'Category');
```

**Required:** `skill_name` (unique)  
**Optional:** `category`

---

## 📋 TABLE 5: `freelancer_skills`

```sql
INSERT INTO freelancer_skills (freelancer_id, skill_id, proficiency_level, years_experience) 
VALUES (1, 1, 'Advanced', 5);
```

**Required:** `freelancer_id` (exists in freelancers), `skill_id` (exists in skills)  
**Optional:** `proficiency_level` ('Basic'/'Intermediate'/'Advanced'), `years_experience` (int)

---

## 📋 TABLE 6: `gigs`

```sql
INSERT INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status) 
VALUES (1, 1, 'Project Title', 'Description', 150000.00, '2024-03-01', '2024-04-01', 'Open');
```

**Required:** `client_id` (exists in clients), `category_id` (exists in categories), `title`, `description`, `budget` (> 0)  
**Optional:** `posted_date` ('YYYY-MM-DD'), `deadline_date` ('YYYY-MM-DD'), `status` ('Open'/'In Progress'/'Completed'/'Cancelled')

---

## 📋 TABLE 7: `applications`

```sql
INSERT INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status) 
VALUES (1, 1, 'Proposal text...', 140000.00, '2024-03-02', 'Pending');
```

**Required:** `gig_id` (exists in gigs), `freelancer_id` (exists in freelancers), `proposal_text`, `bid_amount` (> 0)  
**Optional:** `applied_date` ('YYYY-MM-DD'), `status` ('Pending'/'Approved'/'Rejected')  
**Note:** One freelancer can only apply once per gig

---

## 📋 TABLE 8: `contracts`

```sql
INSERT INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count) 
VALUES (1, '2024-03-05', '2024-04-01', 'Active', 140000.00, 2);
```

**Required:** `application_id` (exists in applications, unique), `total_payment` (> 0)  
**Optional:** `start_date` ('YYYY-MM-DD'), `end_date` ('YYYY-MM-DD'), `work_status` ('Active'/'Completed'/'Cancelled'), `milestone_count` (int)  
**Note:** Only one contract per application

---

## 📋 TABLE 9: `payments`

```sql
INSERT INTO payments (contract_id, amount, payment_date, method, status, transaction_id) 
VALUES (1, 70000.00, '2024-03-05', 'UPI', 'Paid', 'UPI987654321');
```

**Required:** `contract_id` (exists in contracts), `amount` (> 0), `method`  
**Optional:** `payment_date` ('YYYY-MM-DD'), `status` ('Paid'/'Pending'/'Failed'), `transaction_id`  
**Method values:** 'UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking'

---

## 📋 TABLE 10: `reviews`

```sql
INSERT INTO reviews (contract_id, rating, comments, review_date) 
VALUES (1, 5, 'Excellent work!', '2024-04-02');
```

**Required:** `contract_id` (exists in contracts, unique), `rating` (1-5)  
**Optional:** `comments`, `review_date` ('YYYY-MM-DD')  
**Note:** Only one review per contract

---

## 📋 TABLE 11: `messages`

```sql
-- Client to Freelancer
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES ('Client', 1, 1, 'Message text', '2024-03-01 10:30:00', FALSE);

-- Freelancer to Client
INSERT INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read) 
VALUES ('Freelancer', 1, 1, 'Message text', '2024-03-01 11:00:00', FALSE);
```

**Required:** `sender_type` ('Client'/'Freelancer'), `sender_id`, `receiver_id`, `message_text`  
**Optional:** `sent_at` ('YYYY-MM-DD HH:MM:SS'), `is_read` (TRUE/FALSE)  
**Note:** If sender_type='Client', sender_id=client_id, receiver_id=freelancer_id  
If sender_type='Freelancer', sender_id=freelancer_id, receiver_id=client_id

---

## 🔍 Get IDs Before Inserting

```sql
-- Get freelancer IDs
SELECT freelancer_id, name FROM freelancers;

-- Get client IDs
SELECT client_id, name FROM clients;

-- Get category IDs
SELECT category_id, category_name FROM categories;

-- Get skill IDs
SELECT skill_id, skill_name FROM skills;

-- Get gig IDs
SELECT gig_id, title FROM gigs;

-- Get application IDs
SELECT application_id, gig_id, freelancer_id FROM applications;

-- Get contract IDs
SELECT contract_id, application_id FROM contracts;
```

---

## 📊 Insertion Order

1. `categories` (no dependencies)
2. `skills` (no dependencies)
3. `freelancers` (no dependencies)
4. `clients` (no dependencies)
5. `freelancer_skills` (needs freelancer_id, skill_id)
6. `gigs` (needs client_id, category_id)
7. `applications` (needs gig_id, freelancer_id)
8. `contracts` (needs application_id)
9. `payments` (needs contract_id)
10. `reviews` (needs contract_id)
11. `messages` (needs client_id, freelancer_id)

---

## ⚠️ Common Errors & Solutions

| Error | Solution |
|-------|----------|
| Duplicate entry for key 'email' | Email already exists. Use different email. |
| Foreign key constraint fails | Referenced ID doesn't exist. Check parent table. |
| Data truncated for column | Value doesn't match ENUM or data type. Check allowed values. |
| Check constraint fails | Value outside allowed range (e.g., rating > 5.0). |

---

**For detailed information, see `TABLE_REFERENCE_GUIDE.md`**

