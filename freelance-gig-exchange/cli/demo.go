package main

import (
	"fmt"
	"strings"
	"time"

	"github.com/fatih/color"
)

// Color functions for better CLI output
var (
	cyan    = color.New(color.FgCyan).SprintFunc()
	green   = color.New(color.FgGreen).SprintFunc()
	yellow  = color.New(color.FgYellow).SprintFunc()
	red     = color.New(color.FgRed).SprintFunc()
	blue    = color.New(color.FgBlue).SprintFunc()
	magenta = color.New(color.FgMagenta).SprintFunc()
	bold    = color.New(color.Bold).SprintFunc()
)

func main() {
	// Display welcome message
	displayWelcome()

	// Main menu loop
	for {
		displayMainMenu()
		choice := getUserInput("Enter your choice (1-9): ")

		switch choice {
		case "1":
			viewFreelancersDemo()
		case "2":
			viewClientsDemo()
		case "3":
			viewGigsDemo()
		case "4":
			viewApplicationsDemo()
		case "5":
			viewContractsDemo()
		case "6":
			viewPaymentsDemo()
		case "7":
			runAnalyticsDemo()
		case "8":
			showDatabaseSetup()
		case "9":
			fmt.Println(cyan("Thank you for using Freelance Gig Exchange Network! 👋"))
			return
		default:
			fmt.Println(red("Invalid choice. Please try again."))
		}

		fmt.Println("\n" + strings.Repeat("=", 60))
		time.Sleep(1 * time.Second)
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
	fmt.Println(bold(yellow("📋 DEMO MODE - Database connection required for full functionality")))
	fmt.Println(strings.Repeat("=", 60))
}

func displayMainMenu() {
	fmt.Println("\n" + bold(blue("📋 MAIN MENU")))
	fmt.Println(cyan("1. 👥 View Freelancers"))
	fmt.Println(cyan("2. 🏢 View Clients"))
	fmt.Println(cyan("3. 💼 View Gigs"))
	fmt.Println(cyan("4. 📝 View Applications"))
	fmt.Println(cyan("5. 📋 View Contracts"))
	fmt.Println(cyan("6. 💰 View Payments"))
	fmt.Println(cyan("7. 📊 Analytics Dashboard"))
	fmt.Println(cyan("8. 🔧 Database Setup Guide"))
	fmt.Println(cyan("9. 🚪 Exit"))
}

func getUserInput(prompt string) string {
	fmt.Print(bold(yellow(prompt)))
	var input string
	fmt.Scanln(&input)
	return strings.TrimSpace(input)
}

func viewFreelancersDemo() {
	fmt.Println("\n" + bold(green("👥 FREELANCERS DIRECTORY (DEMO DATA)")))

	// Sample data
	freelancers := []struct {
		ID, Completed              int
		Name, Location, Experience string
		Rating                     float64
	}{
		{1, 45, "Rohan Mehta", "Delhi", "Expert", 4.8},
		{2, 52, "Priya Sharma", "Bangalore", "Expert", 4.9},
		{3, 18, "Amit Patel", "Ahmedabad", "Intermediate", 4.2},
		{4, 8, "Neha Verma", "Pune", "Beginner", 4.0},
		{5, 38, "Rajesh Kumar", "Mumbai", "Expert", 4.7},
	}

	fmt.Printf("%-4s %-20s %-15s %-12s %-10s %-8s\n",
		"ID", "Name", "Location", "Experience", "Rating", "Completed")
	fmt.Println(strings.Repeat("-", 80))

	for _, f := range freelancers {
		fmt.Printf("%-4d %-20s %-15s %-12s %-10.1f %-8d\n",
			f.ID, f.Name, f.Location, f.Experience, f.Rating, f.Completed)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 50 freelancers with real-time data!")))
}

func viewClientsDemo() {
	fmt.Println("\n" + bold(green("🏢 CLIENTS DIRECTORY (DEMO DATA)")))

	clients := []struct {
		ID                           int
		Name, Organization, Location string
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
}

func viewGigsDemo() {
	fmt.Println("\n" + bold(green("💼 ACTIVE GIGS (DEMO DATA)")))

	gigs := []struct {
		ID                      int
		Title, Client, Category string
		Budget                  float64
		Status                  string
	}{
		{1, "E-commerce Website", "TCS Innovations", "Web Development", 150000, "Open"},
		{2, "Data Analytics Dashboard", "Infosys Labs", "Data Science", 120000, "Open"},
		{3, "Mobile App Development", "Aditya Tech", "Mobile Apps", 200000, "Open"},
		{4, "UI/UX Design", "Wipro Digital", "UI/UX Design", 80000, "Open"},
		{5, "DevOps Pipeline Setup", "HCL Technologies", "DevOps", 100000, "Open"},
	}

	fmt.Printf("%-4s %-25s %-15s %-12s %-12s %-15s\n",
		"ID", "Title", "Client", "Budget (₹)", "Status", "Category")
	fmt.Println(strings.Repeat("-", 90))

	for _, g := range gigs {
		fmt.Printf("%-4d %-25s %-15s %-12.0f %-12s %-15s\n",
			g.ID, g.Title, g.Client, g.Budget, g.Status, g.Category)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 100 gigs with real-time status!")))
}

func viewApplicationsDemo() {
	fmt.Println("\n" + bold(green("📝 RECENT APPLICATIONS (DEMO DATA)")))

	applications := []struct {
		ID                   int
		GigTitle, Freelancer string
		BidAmount            float64
		Status               string
	}{
		{1, "E-commerce Website", "Rohan Mehta", 140000, "Approved"},
		{2, "Data Analytics Dashboard", "Priya Sharma", 110000, "Approved"},
		{3, "Mobile App Development", "Amit Patel", 190000, "Pending"},
		{4, "UI/UX Design", "Neha Verma", 75000, "Approved"},
		{5, "DevOps Pipeline Setup", "Rajesh Kumar", 95000, "Pending"},
	}

	fmt.Printf("%-4s %-25s %-20s %-12s %-12s\n",
		"ID", "Gig Title", "Freelancer", "Bid Amount (₹)", "Status")
	fmt.Println(strings.Repeat("-", 80))

	for _, a := range applications {
		fmt.Printf("%-4d %-25s %-20s %-12.0f %-12s\n",
			a.ID, a.GigTitle, a.Freelancer, a.BidAmount, a.Status)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 200 applications with real-time updates!")))
}

func viewContractsDemo() {
	fmt.Println("\n" + bold(green("📋 ACTIVE CONTRACTS (DEMO DATA)")))

	contracts := []struct {
		ID                           int
		GigTitle, Freelancer, Status string
		TotalPayment                 float64
		StartDate                    string
	}{
		{1, "E-commerce Website", "Rohan Mehta", "Active", 140000, "2024-01-20"},
		{2, "Data Analytics Dashboard", "Priya Sharma", "Active", 110000, "2024-01-25"},
		{3, "Mobile App Development", "Amit Patel", "Active", 190000, "2024-01-30"},
		{4, "UI/UX Design", "Neha Verma", "Active", 75000, "2024-02-05"},
		{5, "DevOps Pipeline Setup", "Rajesh Kumar", "Active", 95000, "2024-02-10"},
	}

	fmt.Printf("%-4s %-25s %-20s %-12s %-12s %-12s\n",
		"ID", "Gig Title", "Freelancer", "Status", "Payment (₹)", "Start Date")
	fmt.Println(strings.Repeat("-", 100))

	for _, c := range contracts {
		fmt.Printf("%-4d %-25s %-20s %-12s %-12.0f %-12s\n",
			c.ID, c.GigTitle, c.Freelancer, c.Status, c.TotalPayment, c.StartDate)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 50 contracts with payment tracking!")))
}

func viewPaymentsDemo() {
	fmt.Println("\n" + bold(green("💰 PAYMENT TRANSACTIONS (DEMO DATA)")))

	payments := []struct {
		ID                                 int
		Amount                             float64
		Method, Status, Freelancer, Client string
		Date                               string
	}{
		{1, 70000, "UPI", "Paid", "Rohan Mehta", "TCS Innovations", "2024-01-20"},
		{2, 55000, "Bank Transfer", "Paid", "Priya Sharma", "Infosys Labs", "2024-01-25"},
		{3, 95000, "Paytm", "Paid", "Amit Patel", "Aditya Tech", "2024-01-30"},
		{4, 37500, "UPI", "Paid", "Neha Verma", "Wipro Digital", "2024-02-05"},
		{5, 47500, "Bank Transfer", "Pending", "Rajesh Kumar", "HCL Technologies", "2024-02-10"},
	}

	fmt.Printf("%-4s %-12s %-15s %-12s %-20s %-20s %-12s\n",
		"ID", "Amount (₹)", "Method", "Status", "Freelancer", "Client", "Date")
	fmt.Println(strings.Repeat("-", 120))

	for _, p := range payments {
		fmt.Printf("%-4d %-12.0f %-15s %-12s %-20s %-20s %-12s\n",
			p.ID, p.Amount, p.Method, p.Status, p.Freelancer, p.Client, p.Date)
	}

	fmt.Println(bold(yellow("\n💡 Connect to database to see all 80 payments with transaction tracking!")))
}

func runAnalyticsDemo() {
	fmt.Println("\n" + bold(green("📊 ANALYTICS DASHBOARD (DEMO DATA)")))

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

	fmt.Println(bold(yellow("\n💡 Connect to database for real-time analytics and advanced insights!")))
}

func showDatabaseSetup() {
	fmt.Println("\n" + bold(green("🔧 DATABASE SETUP GUIDE")))

	fmt.Println(cyan("\n📋 Prerequisites:"))
	fmt.Println("• MySQL 8.0+ installed and running")
	fmt.Println("• Go 1.21+ installed")
	fmt.Println("• Database user with proper permissions")

	fmt.Println(cyan("\n🚀 Quick Setup:"))
	fmt.Println("1. Start MySQL service:")
	fmt.Println("   macOS: brew services start mysql")
	fmt.Println("   Linux: sudo systemctl start mysql")

	fmt.Println("\n2. Create database:")
	fmt.Println("   mysql -u root -p")
	fmt.Println("   CREATE DATABASE freelance_gig_exchange;")
	fmt.Println("   USE freelance_gig_exchange;")

	fmt.Println("\n3. Run schema:")
	fmt.Println("   SOURCE database/schema.sql;")

	fmt.Println("\n4. Insert sample data:")
	fmt.Println("   SOURCE database/sample_data.sql;")

	fmt.Println("\n5. Update connection in main.go:")
	fmt.Println("   Change: root:password@tcp(localhost:3306)")
	fmt.Println("   To: root:YOUR_PASSWORD@tcp(localhost:3306)")

	fmt.Println("\n6. Run the CLI:")
	fmt.Println("   go run main.go")

	fmt.Println(bold(green("\n✅ After setup, you'll have access to:")))
	fmt.Println("• 50 Freelancers with Indian names and locations")
	fmt.Println("• 30 Clients including TCS, Infosys, Wipro")
	fmt.Println("• 100 Gigs with realistic budgets in ₹")
	fmt.Println("• 200 Applications with proper relationships")
	fmt.Println("• 50 Contracts with payment tracking")
	fmt.Println("• 80 Payments using UPI, Bank Transfer, Paytm")
	fmt.Println("• 30 Reviews with ratings and comments")
	fmt.Println("• 100 Messages for communication tracking")

	fmt.Println(bold(yellow("\n💡 This demo shows the interface - connect to database for full functionality!")))
}
