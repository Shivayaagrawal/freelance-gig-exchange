# 💼 Freelance Gig Exchange Network (FGX)

> **A complete MCA-level professional project** - A comprehensive database-driven freelancing ecosystem powered by MySQL with React frontend and Node.js backend.

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [System Architecture](#-system-architecture)
- [Database Schema](#-database-schema)
- [Installation & Setup](#-installation--setup)
- [Running the Project](#-running-the-project)
- [Database Setup](#-database-setup)
- [API Endpoints](#-api-endpoints)
- [Frontend Components](#-frontend-components)
- [Features](#-features)
- [Technology Stack](#-technology-stack)

## 🎯 Project Overview

The **Freelance Gig Exchange Network (FGX)** is a comprehensive freelancing platform that handles freelancers, clients, gigs, contracts, applications, payments, reviews, skills, messages, and categories. The project focuses on **database design, normalization, relations, and SQL logic** with a fully functional web interface.

### Key Features:
- ✅ **Extensive Database**: 11+ interconnected tables with proper normalization
- ✅ **Real-time Data**: Live database connection with MySQL
- ✅ **Interactive Frontend**: React-based web interface
- ✅ **Professional UI**: Clean, modern design with full functionality
- ✅ **Indian Context**: Realistic data with Indian names, locations, and pricing
- ✅ **Complete Workflow**: From gig posting to payment completion

## 🏗️ System Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React Frontend │◄──►│  Node.js API    │◄──►│   MySQL Database │
│   (Port 8080)    │    │   (Port 8080)   │    │   (Port 3306)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🗄️ Database Schema

### **Total Tables: 11 Core Tables + 3 Views = 14 Database Objects**

#### **Core Tables:**

| **Table Name** | **Purpose** | **Key Fields** |
|----------------|-------------|----------------|
| **freelancers** | Store freelancer profiles | freelancer_id, name, email, rating, experience_level |
| **clients** | Store client information | client_id, name, email, organization |
| **categories** | Gig categories | category_id, category_name, description |
| **skills** | Available skills | skill_id, skill_name, category |
| **freelancer_skills** | Many-to-many relationship | freelancer_id, skill_id, proficiency_level |
| **gigs** | Job postings | gig_id, client_id, title, budget, status |
| **applications** | Freelancer applications | application_id, gig_id, freelancer_id, bid_amount |
| **contracts** | Active contracts | contract_id, application_id, total_payment, work_status |
| **payments** | Payment transactions | payment_id, contract_id, amount, method, status |
| **reviews** | Client reviews | review_id, contract_id, rating, comments |
| **messages** | Communication | message_id, sender_type, sender_id, receiver_id |

#### **Database Views:**

| **View Name** | **Purpose** |
|---------------|-------------|
| **view_top_freelancers** | Top performing freelancers with earnings |
| **view_pending_payments** | All pending payments with details |
| **view_gig_statistics** | Category-wise gig statistics |

### **Table Relationships:**

```
Clients (1) ───< Gigs (M) ───< Applications (M) ───< Contracts (1) ───< Payments (M)
                                                      └──< Reviews (1)
Freelancers (1) ───< Applications (M)
Freelancers (M) ───< Skills (M) [via freelancer_skills]
Clients (M) ───< Messages (M)
Freelancers (M) ───< Messages (M)
Categories (1) ───< Gigs (M)
```

## 🚀 Installation & Setup

### **Prerequisites:**
- **Node.js** (v14 or higher)
- **MySQL** (v8.0 or higher)
- **npm** or **yarn**

### **1. Clone the Repository:**
```bash
git clone <repository-url>
cd freelance-gig-exchange
```

### **2. Install Dependencies:**

#### **Backend Dependencies:**
```bash
cd backend
npm install
```

#### **Frontend Dependencies:**
```bash
cd web
npm install
```

## 🏃‍♂️ Running the Project

### **Step 1: Start MySQL Database**
```bash
# Start MySQL service
sudo systemctl start mysql  # Linux
brew services start mysql   # macOS
net start mysql            # Windows

# Or use the setup script
chmod +x setup_mysql.sh
./setup_mysql.sh
```

### **Step 2: Create Database and Import Data**
```bash
# Connect to MySQL
mysql -u root -p

# Create database
CREATE DATABASE freelance_gig_exchange;
USE freelance_gig_exchange;

# Import schema
source database/schema.sql

# Import sample data
source database/sample_data.sql

# Import advanced queries (optional)
source database/advanced_queries.sql
```

### **Step 3: Start Backend Server**
```bash
cd backend
npm start
# Server runs on http://localhost:8080
```

### **Step 4: Start Frontend**
```bash
cd web
npm run build
# Frontend is served by backend on http://localhost:8080
```

### **Step 5: Access the Application**
Open your browser and navigate to:
```
http://localhost:8080
```

## 🗃️ Database Setup

### **Manual Database Setup:**

1. **Install MySQL:**
   ```bash
   # Ubuntu/Debian
   sudo apt-get install mysql-server
   
   # macOS
   brew install mysql
   
   # Windows
   # Download from https://dev.mysql.com/downloads/mysql/
   ```

2. **Start MySQL:**
   ```bash
   sudo systemctl start mysql
   ```

3. **Set Root Password:**
   ```bash
   sudo mysql_secure_installation
   # Set password as 'tiger' (as configured in the project)
   ```

4. **Create Database:**
   ```sql
   mysql -u root -p
   CREATE DATABASE freelance_gig_exchange;
   USE freelance_gig_exchange;
   ```

5. **Import Schema:**
   ```bash
   mysql -u root -p freelance_gig_exchange < database/schema.sql
   ```

6. **Import Sample Data:**
   ```bash
   mysql -u root -p freelance_gig_exchange < database/sample_data.sql
   ```

### **Automated Setup (Recommended):**
```bash
chmod +x setup_mysql.sh
./setup_mysql.sh
```

## 🔌 API Endpoints

### **Core Endpoints:**

| **Endpoint** | **Method** | **Description** |
|--------------|------------|-----------------|
| `/api/health` | GET | System health check |
| `/api/freelancers` | GET | Get all freelancers |
| `/api/clients` | GET | Get all clients |
| `/api/gigs` | GET | Get all gigs |
| `/api/applications` | GET | Get all applications |
| `/api/contracts` | GET | Get all contracts |
| `/api/payments` | GET | Get all payments |
| `/api/skills` | GET | Get all skills |
| `/api/messages` | GET | Get all messages |
| `/api/reviews` | GET | Get all reviews |
| `/api/analytics` | GET | Get analytics data |
| `/api/schema` | GET | Get database schema |
| `/api/query` | POST | Execute custom SQL queries |

### **Example API Usage:**
```bash
# Get freelancers
curl http://localhost:8080/api/freelancers

# Get payments
curl http://localhost:8080/api/payments

# Execute custom query
curl -X POST http://localhost:8080/api/query \
  -H "Content-Type: application/json" \
  -d '{"query": "SELECT * FROM freelancers WHERE rating > 4.5"}'
```

## 🎨 Frontend Components

### **Main Components:**

| **Component** | **Route** | **Description** |
|---------------|-----------|-----------------|
| **Dashboard** | `/` | Main dashboard with statistics |
| **Freelancers** | `/freelancers` | Browse and manage freelancers |
| **Clients** | `/clients` | Browse and manage clients |
| **Gigs** | `/gigs` | Browse and apply for gigs |
| **Applications** | `/applications` | Manage job applications |
| **Contracts** | `/contracts` | Track active contracts |
| **Payments** | `/payments` | Manage payment transactions |
| **Skills** | `/skills` | Browse and manage skills |
| **Messages** | `/messages` | Communication system |
| **Reviews** | `/reviews` | Review and rating system |
| **Analytics** | `/analytics` | Data analytics and charts |
| **Database Schema** | `/schema` | Visual database schema |
| **ER Diagram** | `/enhanced-erd` | Entity relationship diagram |
| **Custom Query** | `/query` | SQL query executor |

### **Interactive Features:**
- ✅ **Real-time Data**: All components show live database data
- ✅ **Interactive Buttons**: Contact, apply, approve, reject functionality
- ✅ **Status Updates**: Mark payments as paid, approve applications
- ✅ **Search & Filter**: Filter by status, experience level, etc.
- ✅ **Responsive Design**: Works on desktop and mobile

## ✨ Features

### **Database Features:**
- ✅ **Normalization**: Proper 3NF database design
- ✅ **Foreign Keys**: Referential integrity maintained
- ✅ **Indexes**: Optimized for performance
- ✅ **Views**: Pre-computed aggregations
- ✅ **Enums**: Data validation at database level
- ✅ **Timestamps**: Automatic created_at/updated_at

### **Frontend Features:**
- ✅ **Modern UI**: Clean, professional design
- ✅ **Real-time Updates**: Live data from database
- ✅ **Interactive Elements**: Functional buttons and forms
- ✅ **Responsive Layout**: Mobile-friendly design
- ✅ **Error Handling**: Graceful fallbacks
- ✅ **Loading States**: User feedback during data loading

### **Backend Features:**
- ✅ **RESTful API**: Standard HTTP methods
- ✅ **CORS Enabled**: Cross-origin requests supported
- ✅ **Error Handling**: Comprehensive error management
- ✅ **Database Connection**: Live MySQL integration
- ✅ **Query Execution**: Custom SQL query support
- ✅ **Health Monitoring**: System status endpoints

## 🛠️ Technology Stack

### **Frontend:**
- **React** (v18) - UI framework
- **Axios** - HTTP client
- **Lucide React** - Icons
- **Recharts** - Data visualization
- **CSS3** - Styling

### **Backend:**
- **Node.js** (v14+) - Runtime
- **Express.js** - Web framework
- **MySQL2** - Database driver
- **CORS** - Cross-origin resource sharing

### **Database:**
- **MySQL** (v8.0+) - Relational database
- **SQL** - Query language

### **Development Tools:**
- **npm** - Package manager
- **Git** - Version control
- **VS Code** - Recommended IDE

## 📊 Sample Data

### **Default Dataset:**
The database includes realistic Indian context data:
- **50+ Freelancers** with Indian names and locations
- **30+ Clients** including major Indian companies
- **100+ Gigs** with realistic budgets and descriptions
- **200+ Applications** with proper relationships
- **Skills** covering modern tech stack
- **Payments** with Indian payment methods (UPI, Paytm, etc.)

### **Large Dataset (Optional):**
For performance testing, you can insert 50,000+ records:
- **50,000 Freelancers** with realistic Indian data
- **10,000 Clients** with company information
- **25,000 Gigs** with various project types
- **100,000 Applications** with proper relationships
- **200,000 Payments** with transaction details
- **Total: 585,000+ records**

**To insert large dataset:**
```bash
mysql -u root -p freelance_gig_exchange < database/large_dataset.sql
```

**Note:** Large datasets will be reflected on frontend immediately but may cause slower loading times.

## 🔧 Troubleshooting

### **Common Issues:**

1. **Database Connection Failed:**
   ```bash
   # Check MySQL status
   sudo systemctl status mysql
   
   # Restart MySQL
   sudo systemctl restart mysql
   ```

2. **Port Already in Use:**
   ```bash
   # Kill process on port 8080
   lsof -ti:8080 | xargs kill -9
   ```

3. **Frontend Not Loading:**
   ```bash
   # Rebuild frontend
   cd web
   npm run build
   ```

4. **API Errors:**
   ```bash
   # Check backend logs
   cd backend
   npm start
   ```

## 📈 Performance

- **Database**: Optimized with proper indexes
- **Frontend**: Built and minified for production
- **API**: Efficient queries with connection pooling
- **Caching**: Static assets served efficiently

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is created for educational purposes as part of MCA coursework.

## 👨‍💻 Author

**Shivi Agrawal** - MCA Student
- Database Design & Implementation
- Full-stack Development
- Project Documentation

---

## 🎉 **Quick Start Summary:**

1. **Install MySQL** and set password to 'tiger'
2. **Run setup script**: `./setup_mysql.sh`
3. **Start backend**: `cd backend && npm start`
4. **Access app**: `http://localhost:8080`

**🎯 The system is fully functional with live database connection!**