# 🚀 Freelance Gig Exchange Network (FGX) - CLI

A professional Go CLI application for managing the Freelance Gig Exchange Network database.

## ✨ Features

- **Interactive Menu System** - Easy navigation with colored output
- **Real-time Database Queries** - Direct MySQL integration
- **Analytics Dashboard** - Comprehensive statistics and insights
- **Custom SQL Executor** - Run any SQL query directly
- **Professional UI** - Color-coded output for better readability

## 🛠️ Prerequisites

- Go 1.21 or higher
- MySQL 8.0 or higher
- Git

## 📦 Installation

1. **Clone and navigate to the CLI directory:**
```bash
cd freelance-gig-exchange/cli
```

2. **Install dependencies:**
```bash
go mod tidy
```

3. **Update database connection:**
Edit `main.go` line 45 and update the MySQL connection string:
```go
db, err = sql.Open("mysql", "root:your_password@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true")
```

## 🚀 Running the Application

```bash
go run main.go
```

## 📋 Menu Options

1. **👥 View Freelancers** - Browse all freelancers with ratings and experience
2. **🏢 View Clients** - List all registered clients and organizations
3. **💼 View Gigs** - Display active gigs with budgets and categories
4. **📝 View Applications** - Show recent applications and bid amounts
5. **📋 View Contracts** - List active contracts and payment details
6. **💰 View Payments** - Display payment transactions and methods
7. **📊 Analytics Dashboard** - Comprehensive statistics and insights
8. **🔍 Custom SQL Query** - Execute any SQL query directly
9. **🚪 Exit** - Close the application

## 🎨 Features

### Color-coded Output
- **Cyan** - Menu headers and navigation
- **Green** - Success messages and data
- **Yellow** - User prompts and warnings
- **Red** - Error messages
- **Blue** - Section headers
- **Magenta** - Special highlights

### Database Integration
- Direct MySQL connection
- Prepared statements for security
- Error handling and validation
- Real-time data display

### Analytics Dashboard
- Top freelancers by rating
- Category-wise gig distribution
- Payment statistics and success rates
- Revenue trends and insights

## 🔧 Customization

### Adding New Features
1. Create new functions following the existing pattern
2. Add menu options in `displayMainMenu()`
3. Update the switch statement in `main()`

### Database Queries
- All queries use prepared statements
- Error handling for database operations
- Proper connection management

## 📊 Sample Queries

The CLI includes several built-in analytics:

```sql
-- Top freelancers by rating
SELECT name, rating, experience_level, total_completed, location
FROM freelancers 
ORDER BY rating DESC 
LIMIT 5

-- Category-wise gig distribution
SELECT cat.category_name, COUNT(g.gig_id) as total_gigs, 
       AVG(g.budget) as avg_budget
FROM categories cat
LEFT JOIN gigs g ON cat.category_id = g.category_id
GROUP BY cat.category_id, cat.category_name
ORDER BY total_gigs DESC

-- Payment statistics
SELECT 
    COUNT(*) as total_payments,
    SUM(amount) as total_amount,
    AVG(amount) as avg_amount,
    COUNT(CASE WHEN status = 'Paid' THEN 1 END) as successful_payments
FROM payments
```

## 🐛 Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Check MySQL service is running
   - Verify connection string in `main.go`
   - Ensure database exists and has data

2. **Go Module Issues**
   - Run `go mod tidy` to resolve dependencies
   - Check Go version compatibility

3. **Permission Errors**
   - Ensure MySQL user has proper permissions
   - Check database access rights

## 📈 Performance

- Optimized queries with LIMIT clauses
- Efficient database connection pooling
- Minimal memory footprint
- Fast response times

## 🔒 Security

- Prepared statements prevent SQL injection
- Input validation and sanitization
- Secure database connection handling
- Error message sanitization

## 📝 License

This project is part of the Freelance Gig Exchange Network (FGX) database management system.

## 👨‍💻 Author

**Shivi Agrawal** - MCA Database Project
- Professional database design and implementation
- Go CLI development
- MySQL optimization and analytics

---

**Built with ❤️ using Go, MySQL, and modern CLI practices**






