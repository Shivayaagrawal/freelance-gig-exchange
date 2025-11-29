# 🚀 FGX Setup Guide

## Prerequisites

- **MySQL 8.0+** (or MariaDB 10.3+)
- **Go 1.21+** 
- **Git** (for cloning)

## 📦 Installation Steps

### 1. Database Setup

```bash
# Start MySQL service
# macOS: brew services start mysql
# Linux: sudo systemctl start mysql
# Windows: Start MySQL from Services

# Connect to MySQL
mysql -u root -p

# Create database
CREATE DATABASE freelance_gig_exchange;
USE freelance_gig_exchange;

# Run schema
SOURCE database/schema.sql;

# Insert sample data
SOURCE database/sample_data.sql;

# Verify setup
SHOW TABLES;
SELECT COUNT(*) FROM freelancers;
```

### 2. Go CLI Setup

```bash
# Navigate to CLI directory
cd freelance-gig-exchange/cli

# Install dependencies
go mod tidy

# Update database connection (if needed)
# Edit main.go line 45:
# Change: root:password@tcp(localhost:3306)
# To: root:YOUR_PASSWORD@tcp(localhost:3306)

# Run the application
go run main.go
# OR use the runner script
./run.sh
```

## 🔧 Configuration

### Database Connection
Update the connection string in `cli/main.go`:

```go
// Line 45 - Update with your MySQL credentials
db, err = sql.Open("mysql", "root:YOUR_PASSWORD@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true")
```

### MySQL User Permissions
Ensure your MySQL user has proper permissions:

```sql
GRANT ALL PRIVILEGES ON freelance_gig_exchange.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
```

## 🚀 Running the Application

### Method 1: Direct Go Run
```bash
cd cli
go run main.go
```

### Method 2: Using Runner Script
```bash
cd cli
./run.sh
```

### Method 3: Build and Run
```bash
cd cli
go build -o fgx-cli main.go
./fgx-cli
```

## 📊 Verification

### Check Database
```sql
-- Verify tables exist
SHOW TABLES;

-- Check data
SELECT COUNT(*) FROM freelancers;
SELECT COUNT(*) FROM clients;
SELECT COUNT(*) FROM gigs;
```

### Test CLI
1. Launch the application
2. Navigate through menu options
3. View freelancers, clients, gigs
4. Run analytics dashboard
5. Test custom SQL queries

## 🐛 Troubleshooting

### Common Issues

**Database Connection Error**
```bash
# Check MySQL is running
pgrep mysqld

# Check connection string in main.go
# Verify username/password
# Ensure database exists
```

**Go Module Issues**
```bash
# Clean and reinstall
go clean -modcache
go mod tidy
```

**Permission Errors**
```bash
# Make runner script executable
chmod +x run.sh

# Check MySQL user permissions
mysql -u root -p
SHOW GRANTS;
```

## 📈 Performance Tips

1. **Database Indexes** - Already optimized in schema
2. **Connection Pooling** - Handled by Go MySQL driver
3. **Query Optimization** - LIMIT clauses for large datasets
4. **Memory Management** - Proper connection closing

## 🎯 Next Steps

1. **Explore the CLI** - Navigate through all menu options
2. **Run Analytics** - Check the dashboard for insights
3. **Custom Queries** - Try your own SQL queries
4. **Extend Functionality** - Add new features to the CLI
5. **Database Optimization** - Analyze query performance

## 📚 Additional Resources

- **MySQL Documentation** - https://dev.mysql.com/doc/
- **Go Database Tutorial** - https://golang.org/pkg/database/sql/
- **CLI Best Practices** - https://clig.dev/

---

**Ready to explore your Freelance Gig Exchange Network! 🚀**







