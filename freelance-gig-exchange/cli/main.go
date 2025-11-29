package main

import (
	"bufio"
	"database/sql"
	"fmt"
	"os"
	"strings"
	"time"

	"github.com/fatih/color"
	_ "github.com/go-sql-driver/mysql"
)

// Database connection
var db *sql.DB

// Color functions for better CLI output
var (
	red    = color.New(color.FgRed).SprintFunc()
	green  = color.New(color.FgGreen).SprintFunc()
	yellow = color.New(color.FgYellow).SprintFunc()
	cyan   = color.New(color.FgCyan).SprintFunc()
	bold   = color.New(color.Bold).SprintFunc()
)

// Data structures
type Freelancer struct {
	ID         int
	Name       string
	Email      string
	Location   string
	Experience string
	Rating     float64
	Completed  int
}

type Client struct {
	ID           int
	Name         string
	Email        string
	Organization string
	Location     string
	MemberSince  string
}

func main() {
	displayWelcome()
	initDB()

	for {
		displayMainMenu()
		choice := getUserInput("Enter your choice (1-9): ")

		switch choice {
		case "1":
			viewFreelancers()
		case "2":
			viewClients()
		case "3":
			viewGigs()
		case "4":
			viewApplications()
		case "5":
			viewContracts()
		case "6":
			viewPayments()
		case "7":
			runAnalytics()
		case "8":
			runCustomQuery()
		case "9":
			fmt.Println(bold(green("👋 Thank you for using FGX CLI! Goodbye!")))
			return
		default:
			fmt.Println(red("Invalid choice. Please try again."))
		}

		fmt.Println("\n" + strings.Repeat("=", 60))
		time.Sleep(1 * time.Second)
	}
}

func initDB() {
	var err error
	// Try different connection strings
	connectionStrings := []string{
		"root:@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true",
		"root:password@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true",
		"root:root@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true",
		"root:mysql@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true",
	}

	var connected bool
	for _, connStr := range connectionStrings {
		db, err = sql.Open("mysql", connStr)
		if err != nil {
			continue
		}

		// Test the connection
		if err = db.Ping(); err == nil {
			connected = true
			fmt.Println(green("✅ Database connection established successfully!"))
			break
		}
	}

	if !connected {
		fmt.Println(yellow("⚠️  Database connection failed. Running in demo mode."))
		fmt.Println(yellow("💡 To connect to database:"))
		fmt.Println(yellow("   1. Start MySQL: brew services start mysql"))
		fmt.Println(yellow("   2. Create database: CREATE DATABASE freelance_gig_exchange;"))
		fmt.Println(yellow("   3. Run schema: SOURCE database/schema.sql;"))
		fmt.Println(yellow("   4. Update connection string in main.go"))
		db = nil // Set to nil for demo mode
	}
}

func displayWelcome() {
	fmt.Println(strings.Repeat("=", 60))
	fmt.Println(bold(cyan("🚀 FREELANCE GIG EXCHANGE NETWORK (FGX)")))
	fmt.Println(bold(cyan("   Professional Database Management System")))
	fmt.Println(strings.Repeat("=", 60))
	fmt.Println(bold(green("Welcome to FGX CLI - Your Freelancing Database Dashboard")))
	fmt.Println(bold(yellow("Built with Go, MySQL, and ❤️  by Shivi Agrawal")))
	fmt.Println(strings.Repeat("=", 60))
}

func displayMainMenu() {
	fmt.Println("\n" + bold(cyan("📋 MAIN MENU")))
	fmt.Println(cyan("1. 👥 View Freelancers"))
	fmt.Println(cyan("2. 🏢 View Clients"))
	fmt.Println(cyan("3. 💼 View Gigs"))
	fmt.Println(cyan("4. 📝 View Applications"))
	fmt.Println(cyan("5. 📋 View Contracts"))
	fmt.Println(cyan("6. 💰 View Payments"))
	fmt.Println(cyan("7. 📊 Analytics Dashboard"))
	fmt.Println(cyan("8. 🔍 Custom SQL Query"))
	fmt.Println(cyan("9. 🚪 Exit"))
}

func getUserInput(prompt string) string {
	fmt.Print(bold(yellow(prompt)))
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	return strings.TrimSpace(input)
}

func viewFreelancers() {
	fmt.Println("\n" + bold(green("👥 FREELANCERS DIRECTORY")))

	if db == nil {
		viewFreelancersDemo()
		return
	}

	query := `
		SELECT freelancer_id, name, location, experience_level, rating, total_completed
		FROM freelancers 
		ORDER BY rating DESC
		LIMIT 10
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching freelancers: "), err)
		viewFreelancersDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-20s %-15s %-12s %-10s %-8s\n",
		"ID", "Name", "Location", "Experience", "Rating", "Completed")
	fmt.Println(strings.Repeat("-", 80))

	for rows.Next() {
		var f Freelancer
		err := rows.Scan(&f.ID, &f.Name, &f.Location, &f.Experience, &f.Rating, &f.Completed)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-20s %-15s %-12s %-10.1f %-8d\n",
			f.ID, f.Name, f.Location, f.Experience, f.Rating, f.Completed)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 50 freelancers with real-time data!")))
	waitForEnter()
}

func viewFreelancersDemo() {
	freelancers := []struct {
		ID         int
		Name       string
		Location   string
		Experience string
		Rating     float64
		Completed  int
	}{
		{1, "Rohan Mehta", "Delhi", "Expert", 4.8, 45},
		{2, "Priya Sharma", "Bangalore", "Expert", 4.9, 52},
		{3, "Amit Patel", "Ahmedabad", "Intermediate", 4.2, 18},
		{4, "Neha Verma", "Pune", "Beginner", 4.0, 8},
		{5, "Rajesh Kumar", "Mumbai", "Expert", 4.7, 38},
	}

	fmt.Printf("%-4s %-20s %-15s %-12s %-10s %-8s\n",
		"ID", "Name", "Location", "Experience", "Rating", "Completed")
	fmt.Println(strings.Repeat("-", 80))

	for _, f := range freelancers {
		fmt.Printf("%-4d %-20s %-15s %-12s %-10.1f %-8d\n",
			f.ID, f.Name, f.Location, f.Experience, f.Rating, f.Completed)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 50 freelancers with real-time data!")))
	waitForEnter()
}

func viewClients() {
	fmt.Println("\n" + bold(green("🏢 CLIENTS DIRECTORY")))

	if db == nil {
		viewClientsDemo()
		return
	}

	query := `
		SELECT client_id, name, email, organization, location, member_since
		FROM clients 
		ORDER BY member_since DESC
		LIMIT 15
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching clients: "), err)
		viewClientsDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-25s %-20s %-20s %-15s %-12s\n",
		"ID", "Name", "Organization", "Email", "Location", "Member Since")
	fmt.Println(strings.Repeat("-", 100))

	for rows.Next() {
		var c Client
		err := rows.Scan(&c.ID, &c.Name, &c.Email, &c.Organization, &c.Location, &c.MemberSince)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-25s %-20s %-20s %-15s %-12s\n",
			c.ID, c.Name, c.Organization, c.Email, c.Location, c.MemberSince)
	}

	waitForEnter()
}

func viewClientsDemo() {
	clients := []struct {
		ID           int
		Name         string
		Organization string
		Location     string
	}{
		{1, "TCS Innovations", "Tata Consultancy Services", "Mumbai"},
		{2, "Infosys Labs", "Infosys Limited", "Bangalore"},
		{3, "Aditya Tech Solutions", "Aditya Technologies", "Noida"},
		{4, "Wipro Digital", "Wipro Limited", "Pune"},
		{5, "HCL Technologies", "HCL Tech", "Chennai"},
	}

	fmt.Printf("%-4s %-25s %-20s %-15s\n",
		"ID", "Name", "Organization", "Location")
	fmt.Println(strings.Repeat("-", 70))

	for _, c := range clients {
		fmt.Printf("%-4d %-25s %-20s %-15s\n",
			c.ID, c.Name, c.Organization, c.Location)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 30 clients with complete details!")))
	waitForEnter()
}

func viewGigs() {
	fmt.Println("\n" + bold(green("💼 ACTIVE GIGS")))

	if db == nil {
		viewGigsDemo()
		return
	}

	query := `
		SELECT g.gig_id, g.title, c.name, g.budget, g.status, g.posted_date
		FROM gigs g
		JOIN clients c ON g.client_id = c.client_id
		WHERE g.status = 'Open'
		ORDER BY g.posted_date DESC
		LIMIT 10
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching gigs: "), err)
		viewGigsDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-30s %-20s %-12s %-10s %-12s\n",
		"ID", "Title", "Client", "Budget", "Status", "Posted Date")
	fmt.Println(strings.Repeat("-", 100))

	for rows.Next() {
		var gigID int
		var title, clientName, status, postedDate string
		var budget float64

		err := rows.Scan(&gigID, &title, &clientName, &budget, &status, &postedDate)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-30s %-20s %-12.0f %-10s %-12s\n",
			gigID, title, clientName, budget, status, postedDate)
	}

	waitForEnter()
}

func viewGigsDemo() {
	gigs := []struct {
		ID         int
		Title      string
		Client     string
		Budget     float64
		Status     string
		PostedDate string
	}{
		{1, "E-commerce Website Development", "TCS Innovations", 150000, "Open", "2024-01-15"},
		{2, "Data Analytics Dashboard", "Infosys Labs", 120000, "Open", "2024-01-20"},
		{3, "Mobile App for Food Delivery", "Aditya Tech", 200000, "Open", "2024-01-25"},
		{4, "UI/UX Design for Fintech App", "Wipro Digital", 80000, "Open", "2024-02-01"},
		{5, "DevOps Pipeline Setup", "HCL Technologies", 100000, "Open", "2024-02-05"},
	}

	fmt.Printf("%-4s %-30s %-20s %-12s %-10s %-12s\n",
		"ID", "Title", "Client", "Budget", "Status", "Posted Date")
	fmt.Println(strings.Repeat("-", 100))

	for _, g := range gigs {
		fmt.Printf("%-4d %-30s %-20s %-12.0f %-10s %-12s\n",
			g.ID, g.Title, g.Client, g.Budget, g.Status, g.PostedDate)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 100 gigs with real-time data!")))
	waitForEnter()
}

func viewApplications() {
	fmt.Println("\n" + bold(green("📝 RECENT APPLICATIONS")))

	if db == nil {
		viewApplicationsDemo()
		return
	}

	query := `
		SELECT a.application_id, f.name, g.title, a.bid_amount, a.status, a.applied_date
		FROM applications a
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		JOIN gigs g ON a.gig_id = g.gig_id
		ORDER BY a.applied_date DESC
		LIMIT 10
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching applications: "), err)
		viewApplicationsDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-20s %-30s %-12s %-10s %-12s\n",
		"ID", "Freelancer", "Gig Title", "Bid Amount", "Status", "Applied Date")
	fmt.Println(strings.Repeat("-", 100))

	for rows.Next() {
		var appID int
		var freelancerName, gigTitle, status, appliedDate string
		var bidAmount float64

		err := rows.Scan(&appID, &freelancerName, &gigTitle, &bidAmount, &status, &appliedDate)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-20s %-30s %-12.0f %-10s %-12s\n",
			appID, freelancerName, gigTitle, bidAmount, status, appliedDate)
	}

	waitForEnter()
}

func viewApplicationsDemo() {
	applications := []struct {
		ID             int
		FreelancerName string
		GigTitle       string
		BidAmount      float64
		Status         string
		AppliedDate    string
	}{
		{1, "Rohan Mehta", "E-commerce Website Development", 140000, "Approved", "2024-01-16"},
		{2, "Priya Sharma", "Data Analytics Dashboard", 110000, "Approved", "2024-01-21"},
		{3, "Amit Patel", "Mobile App for Food Delivery", 190000, "Pending", "2024-01-26"},
		{4, "Neha Verma", "UI/UX Design for Fintech App", 75000, "Approved", "2024-02-02"},
		{5, "Rajesh Kumar", "DevOps Pipeline Setup", 95000, "Pending", "2024-02-06"},
	}

	fmt.Printf("%-4s %-20s %-30s %-12s %-10s %-12s\n",
		"ID", "Freelancer", "Gig Title", "Bid Amount", "Status", "Applied Date")
	fmt.Println(strings.Repeat("-", 100))

	for _, a := range applications {
		fmt.Printf("%-4d %-20s %-30s %-12.0f %-10s %-12s\n",
			a.ID, a.FreelancerName, a.GigTitle, a.BidAmount, a.Status, a.AppliedDate)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 200 applications with real-time data!")))
	waitForEnter()
}

func viewContracts() {
	fmt.Println("\n" + bold(green("📋 ACTIVE CONTRACTS")))

	if db == nil {
		viewContractsDemo()
		return
	}

	query := `
		SELECT c.contract_id, f.name, g.title, c.total_payment, c.work_status, c.start_date
		FROM contracts c
		JOIN applications a ON c.application_id = a.application_id
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		JOIN gigs g ON a.gig_id = g.gig_id
		WHERE c.work_status = 'Active'
		ORDER BY c.start_date DESC
		LIMIT 10
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching contracts: "), err)
		viewContractsDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-20s %-30s %-12s %-10s %-12s\n",
		"ID", "Freelancer", "Gig Title", "Total Payment", "Status", "Start Date")
	fmt.Println(strings.Repeat("-", 100))

	for rows.Next() {
		var contractID int
		var freelancerName, gigTitle, workStatus, startDate string
		var totalPayment float64

		err := rows.Scan(&contractID, &freelancerName, &gigTitle, &totalPayment, &workStatus, &startDate)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-20s %-30s %-12.0f %-10s %-12s\n",
			contractID, freelancerName, gigTitle, totalPayment, workStatus, startDate)
	}

	waitForEnter()
}

func viewContractsDemo() {
	contracts := []struct {
		ID             int
		FreelancerName string
		GigTitle       string
		TotalPayment   float64
		WorkStatus     string
		StartDate      string
	}{
		{1, "Rohan Mehta", "E-commerce Website Development", 140000, "Active", "2024-01-20"},
		{2, "Priya Sharma", "Data Analytics Dashboard", 110000, "Active", "2024-01-25"},
		{3, "Neha Verma", "UI/UX Design for Fintech App", 75000, "Active", "2024-02-05"},
		{4, "Rajesh Kumar", "DevOps Pipeline Setup", 95000, "Active", "2024-02-10"},
		{5, "Amit Patel", "Mobile App for Food Delivery", 190000, "Active", "2024-02-15"},
	}

	fmt.Printf("%-4s %-20s %-30s %-12s %-10s %-12s\n",
		"ID", "Freelancer", "Gig Title", "Total Payment", "Status", "Start Date")
	fmt.Println(strings.Repeat("-", 100))

	for _, c := range contracts {
		fmt.Printf("%-4d %-20s %-30s %-12.0f %-10s %-12s\n",
			c.ID, c.FreelancerName, c.GigTitle, c.TotalPayment, c.WorkStatus, c.StartDate)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all contracts with real-time data!")))
	waitForEnter()
}

func viewPayments() {
	fmt.Println("\n" + bold(green("💰 PAYMENT HISTORY")))

	if db == nil {
		viewPaymentsDemo()
		return
	}

	query := `
		SELECT p.payment_id, f.name, p.amount, p.payment_date, p.method, p.status
		FROM payments p
		JOIN contracts c ON p.contract_id = c.contract_id
		JOIN applications a ON c.application_id = a.application_id
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		ORDER BY p.payment_date DESC
		LIMIT 10
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching payments: "), err)
		viewPaymentsDemo()
		return
	}
	defer rows.Close()

	fmt.Printf("%-4s %-20s %-12s %-12s %-15s %-10s\n",
		"ID", "Freelancer", "Amount", "Payment Date", "Method", "Status")
	fmt.Println(strings.Repeat("-", 80))

	for rows.Next() {
		var paymentID int
		var freelancerName, paymentDate, method, status string
		var amount float64

		err := rows.Scan(&paymentID, &freelancerName, &amount, &paymentDate, &method, &status)
		if err != nil {
			fmt.Println(red("Error scanning row: "), err)
			continue
		}

		fmt.Printf("%-4d %-20s %-12.0f %-12s %-15s %-10s\n",
			paymentID, freelancerName, amount, paymentDate, method, status)
	}

	waitForEnter()
}

func viewPaymentsDemo() {
	payments := []struct {
		ID             int
		FreelancerName string
		Amount         float64
		PaymentDate    string
		Method         string
		Status         string
	}{
		{1, "Rohan Mehta", 140000, "2024-01-25", "UPI", "Paid"},
		{2, "Priya Sharma", 110000, "2024-01-30", "Bank Transfer", "Paid"},
		{3, "Neha Verma", 75000, "2024-02-10", "Paytm", "Paid"},
		{4, "Rajesh Kumar", 95000, "2024-02-15", "UPI", "Pending"},
		{5, "Amit Patel", 190000, "2024-02-20", "Bank Transfer", "Paid"},
	}

	fmt.Printf("%-4s %-20s %-12s %-12s %-15s %-10s\n",
		"ID", "Freelancer", "Amount", "Payment Date", "Method", "Status")
	fmt.Println(strings.Repeat("-", 80))

	for _, p := range payments {
		fmt.Printf("%-4d %-20s %-12.0f %-12s %-15s %-10s\n",
			p.ID, p.FreelancerName, p.Amount, p.PaymentDate, p.Method, p.Status)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all payments with real-time data!")))
	waitForEnter()
}

func runAnalytics() {
	fmt.Println("\n" + bold(green("📊 ANALYTICS DASHBOARD")))

	if db == nil {
		runAnalyticsDemo()
		return
	}

	// Top freelancers by rating
	fmt.Println(cyan("\n🏆 TOP FREELANCERS BY RATING:"))
	query := `
		SELECT name, rating, total_completed, location
		FROM freelancers 
		ORDER BY rating DESC 
		LIMIT 5
	`

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching top freelancers: "), err)
		runAnalyticsDemo()
		return
	}
	defer rows.Close()

	for rows.Next() {
		var name, location string
		var rating float64
		var completed int

		err := rows.Scan(&name, &rating, &completed, &location)
		if err != nil {
			continue
		}

		fmt.Printf("⭐ %s (%.1f) - %d projects - %s\n", name, rating, completed, location)
	}

	// Gig categories
	fmt.Println(cyan("\n📈 GIG CATEGORIES:"))
	query = `
		SELECT c.category_name, COUNT(g.gig_id) as total_gigs, AVG(g.budget) as avg_budget
		FROM categories c
		LEFT JOIN gigs g ON c.category_id = g.category_id
		GROUP BY c.category_name
		ORDER BY total_gigs DESC
	`

	rows, err = db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching categories: "), err)
	} else {
		defer rows.Close()

		for rows.Next() {
			var categoryName string
			var totalGigs int
			var avgBudget float64

			err := rows.Scan(&categoryName, &totalGigs, &avgBudget)
			if err != nil {
				continue
			}

			fmt.Printf("📊 %s: %d gigs, Avg Budget: ₹%.0f\n", categoryName, totalGigs, avgBudget)
		}
	}

	// Payment statistics
	fmt.Println(cyan("\n💰 PAYMENT STATISTICS:"))
	query = `
		SELECT COUNT(*) as total_payments, SUM(amount) as total_amount, AVG(amount) as avg_amount,
			   COUNT(CASE WHEN status = 'Paid' THEN 1 END) as successful_payments
		FROM payments
	`

	rows, err = db.Query(query)
	if err != nil {
		fmt.Println(red("Error fetching payment stats: "), err)
	} else {
		defer rows.Close()

		if rows.Next() {
			var totalPayments, successfulPayments int
			var totalAmount, avgAmount float64

			err := rows.Scan(&totalPayments, &totalAmount, &avgAmount, &successfulPayments)
			if err == nil {
				fmt.Printf("💳 Total Payments: %d\n", totalPayments)
				fmt.Printf("💰 Total Amount: ₹%.0f\n", totalAmount)
				fmt.Printf("📊 Average Payment: ₹%.0f\n", avgAmount)
				fmt.Printf("✅ Success Rate: %.1f%%\n", float64(successfulPayments)/float64(totalPayments)*100)
			}
		}
	}

	waitForEnter()
}

func runAnalyticsDemo() {
	fmt.Println(cyan("\n🏆 TOP FREELANCERS BY RATING:"))
	fmt.Println("⭐ Priya Sharma (4.9) - Expert - 52 projects - Bangalore")
	fmt.Println("⭐ Rohan Mehta (4.8) - Expert - 45 projects - Delhi")
	fmt.Println("⭐ Rajesh Kumar (4.7) - Expert - 38 projects - Mumbai")
	fmt.Println("⭐ Amit Patel (4.2) - Intermediate - 18 projects - Ahmedabad")
	fmt.Println("⭐ Neha Verma (4.0) - Beginner - 8 projects - Pune")

	fmt.Println(cyan("\n📈 GIG CATEGORIES:"))
	fmt.Println("📊 Web Development: 25 gigs, Avg Budget: ₹120,000")
	fmt.Println("📊 Data Science: 20 gigs, Avg Budget: ₹150,000")
	fmt.Println("📊 Mobile Apps: 18 gigs, Avg Budget: ₹180,000")
	fmt.Println("📊 UI/UX Design: 15 gigs, Avg Budget: ₹80,000")
	fmt.Println("📊 DevOps: 12 gigs, Avg Budget: ₹110,000")

	fmt.Println(cyan("\n💰 PAYMENT STATISTICS:"))
	fmt.Println("💳 Total Payments: 80")
	fmt.Println("💰 Total Amount: ₹8,500,000")
	fmt.Println("📊 Average Payment: ₹106,250")
	fmt.Println("✅ Success Rate: 85.0%")

	if db == nil {
		fmt.Println(bold(yellow("\n💡 Connect to database for real-time analytics and advanced insights!")))
	}

	waitForEnter()
}

func runCustomQuery() {
	fmt.Println("\n" + bold(green("🔍 CUSTOM SQL QUERY EXECUTOR")))

	if db == nil {
		fmt.Println(red("❌ Database connection required for custom queries."))
		fmt.Println(yellow("💡 Connect to database first to use this feature."))
		waitForEnter()
		return
	}

	fmt.Println(yellow("Enter your SQL query (or 'exit' to go back):"))
	query := getUserInput("SQL> ")

	if strings.ToLower(query) == "exit" {
		return
	}

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(red("❌ Query Error: "), err)
		waitForEnter()
		return
	}
	defer rows.Close()

	// Get column names
	columns, err := rows.Columns()
	if err != nil {
		fmt.Println(red("❌ Error getting columns: "), err)
		waitForEnter()
		return
	}

	// Print column headers
	for _, col := range columns {
		fmt.Printf("%-15s ", col)
	}
	fmt.Println()
	fmt.Println(strings.Repeat("-", len(columns)*15))

	// Print rows
	values := make([]interface{}, len(columns))
	valuePtrs := make([]interface{}, len(columns))
	for i := range values {
		valuePtrs[i] = &values[i]
	}

	rowCount := 0
	for rows.Next() {
		err := rows.Scan(valuePtrs...)
		if err != nil {
			fmt.Println(red("❌ Error scanning row: "), err)
			continue
		}

		for _, val := range values {
			fmt.Printf("%-15v ", val)
		}
		fmt.Println()
		rowCount++
	}

	fmt.Printf(green("\n✅ Query executed successfully! %d rows returned.\n"), rowCount)
	waitForEnter()
}

func waitForEnter() {
	fmt.Print(bold(cyan("\nPress Enter to continue...")))
	reader := bufio.NewReader(os.Stdin)
	reader.ReadString('\n')
}
