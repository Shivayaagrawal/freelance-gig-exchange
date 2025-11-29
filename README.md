Here is a **complete README.md** for your Freelance Gig Exchange Network project — clean, professional, and submission-ready.

---

# 📦 **Freelance Gig Exchange Network (FGX)**

*A Complete DBMS Project using MySQL + Flask UI*

---

## 📖 Overview

The **Freelance Gig Exchange Network (FGX)** is a database-centric system designed to manage freelancing workflows — including **freelancers, clients, gigs, contracts, payments, reviews, messaging, and skill mappings**.

The goal is to build an **organized, searchable, scalable freelancing backend** with MySQL as the core engine.
A minimal **Flask + HTML + Bootstrap UI** is included to interact with the database visually.

---

## 🔥 Key Highlights

| Feature                                                        | Description |
| -------------------------------------------------------------- | ----------- |
| 📌 Full relational DB design (10+ tables)                      |             |
| 📌 Normalized schema (1NF → 3NF)                               |             |
| 📌 Freelancer-Client-Gig workflow modeled end-to-end           |             |
| 📌 SQL joins, aggregations, views, triggers, stored procedures |             |
| 📌 Sample data with Indian names and real tech skills          |             |
| 📌 Lightweight web interface for database interaction          |             |
| 📌 Extensible for mobile/web later                             |             |

---

## 🗂 Database Structure

### **Core Entities**

* Freelancers
* Clients
* Skills
* Freelancer Skill Mapping (M:M)
* Categories
* Gigs
* Applications
* Contracts
* Payments
* Reviews
* Messaging System

### ERD (Concept Flow)

```
Clients 1 ──< Gigs >── 1 Applications 1 ──< Contracts ──< Payments
                      └────────────────────< Reviews

Freelancers >── M:M ── Skills
```

---

## ⚙️ Tech Stack

| Component              | Technology                        |
| ---------------------- | --------------------------------- |
| Backend Database       | **MySQL** (main focus of project) |
| UI / Interaction Layer | Flask + HTML + Bootstrap          |
| Tools                  | MySQL Workbench / phpMyAdmin      |

> Note: Security, authentication & session handling intentionally minimal to emphasize DBMS concepts.

---

## 📁 Project Folder Structure

```
freelance-gig-exchange/
│
├── database/
│   ├── schema.sql            # All table creation scripts
│   ├── sample_data.sql       # Inserted dummy data
│   ├── views_procs_triggers.sql
│
├── app/
│   ├── app.py                # Flask server
│   ├── templates/            # HTML UI pages
│   │   ├── index.html
│   │   ├── freelancers.html
│   │   ├── clients.html
│   │   ├── gigs.html
│   │   ├── payments.html
│   ├── static/style.css
│
├── ER_Diagram.png
└── README.md
```

---

## 🚀 How to Run

### 1️⃣ Import Database

```bash
mysql -u root -p
SOURCE database/schema.sql;
SOURCE database/sample_data.sql;
SOURCE database/views_procs_triggers.sql;
```

### 2️⃣ Install Requirements

```bash
pip install flask flask-mysqldb
```

### 3️⃣ Start Web Application

```bash
cd app
python app.py
```

Then open browser → **[http://localhost:5000](http://localhost:5000)**

---

## 🔍 UI Screens (Flask)

| Route          | Purpose                      |
| -------------- | ---------------------------- |
| `/`            | Dashboard & stats            |
| `/freelancers` | List/Add Freelancers         |
| `/clients`     | Manage Clients               |
| `/gigs`        | Post & Browse Gigs           |
| `/payments`    | Payment history              |
| `/reviews`     | Contract feedback            |
| `/query`       | Execute SQL queries manually |

---

## 🧪 Example SQL Queries

```sql
-- Top freelancers by rating
SELECT name, rating FROM freelancers ORDER BY rating DESC;

-- Total earnings per freelancer
SELECT f.name, SUM(p.amount) AS earned
FROM freelancers f
JOIN applications a ON f.freelancer_id = a.freelancer_id
JOIN contracts c ON a.application_id = c.application_id
JOIN payments p ON c.contract_id = p.contract_id
GROUP BY f.name;
```

---

## ⭐ Additional Features

| Feature                              | Status |
| ------------------------------------ | ------ |
| Freelancers-Skill Mapping            | ✔      |
| Gig category-wise filter             | ✔      |
| Messaging between users              | ✔      |
| Payment ledger tracking              | ✔      |
| Stored procedures for earnings       | ✔      |
| Trigger to update completed projects | ✔      |
| Analytics view for demand report     | ✔      |

---

## 🎯 Conclusion

This project demonstrates:

✔ Real-world DBMS implementation
✔ Normalized relational schema
✔ Complete workflow of a freelancing eco-system
✔ Practical SQL operations & UI integration

Designed to be scalable, analyzable, and perfect for **academic submission + real deployment basics**.

---

