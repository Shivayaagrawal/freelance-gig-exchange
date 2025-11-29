package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

// Database connection
var db *sql.DB

// Data structures
type Freelancer struct {
	ID              int     `json:"id"`
	Name            string  `json:"name"`
	Email           string  `json:"email"`
	Phone           string  `json:"phone"`
	Location        string  `json:"location"`
	ExperienceLevel string  `json:"experience_level"`
	Rating          float64 `json:"rating"`
	TotalCompleted  int     `json:"total_completed"`
	JoinDate        string  `json:"join_date"`
}

type Client struct {
	ID           int    `json:"id"`
	Name         string `json:"name"`
	Email        string `json:"email"`
	Organization string `json:"organization"`
	Location     string `json:"location"`
	MemberSince  string `json:"member_since"`
}

type Gig struct {
	ID          int     `json:"id"`
	Title       string  `json:"title"`
	Description string  `json:"description"`
	Budget      float64 `json:"budget"`
	Status      string  `json:"status"`
	PostedDate  string  `json:"posted_date"`
	ClientName  string  `json:"client_name"`
}

type Application struct {
	ID             int     `json:"id"`
	FreelancerName string  `json:"freelancer_name"`
	GigTitle       string  `json:"gig_title"`
	BidAmount      float64 `json:"bid_amount"`
	Status         string  `json:"status"`
	AppliedDate    string  `json:"applied_date"`
}

type Contract struct {
	ID             int     `json:"id"`
	FreelancerName string  `json:"freelancer_name"`
	GigTitle       string  `json:"gig_title"`
	TotalPayment   float64 `json:"total_payment"`
	WorkStatus     string  `json:"work_status"`
	StartDate      string  `json:"start_date"`
}

type Payment struct {
	ID             int     `json:"id"`
	FreelancerName string  `json:"freelancer_name"`
	Amount         float64 `json:"amount"`
	PaymentDate    string  `json:"payment_date"`
	Method         string  `json:"method"`
	Status         string  `json:"status"`
}

type DashboardStats struct {
	Freelancers  int     `json:"freelancers"`
	Clients      int     `json:"clients"`
	Gigs         int     `json:"gigs"`
	Applications int     `json:"applications"`
	Contracts    int     `json:"contracts"`
	Payments     int     `json:"payments"`
	TotalRevenue float64 `json:"total_revenue"`
	AvgRating    float64 `json:"avg_rating"`
}

func main() {
	initDB()

	r := mux.NewRouter()

	// CORS middleware
	corsHandler := handlers.CORS(
		handlers.AllowedOrigins([]string{"http://localhost:3000"}),
		handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}),
		handlers.AllowedHeaders([]string{"Content-Type", "Authorization"}),
	)

	// API routes
	r.HandleFunc("/api/health", healthCheck).Methods("GET")
	r.HandleFunc("/api/dashboard/stats", getDashboardStats).Methods("GET")
	r.HandleFunc("/api/freelancers", getFreelancers).Methods("GET")
	r.HandleFunc("/api/clients", getClients).Methods("GET")
	r.HandleFunc("/api/gigs", getGigs).Methods("GET")
	r.HandleFunc("/api/applications", getApplications).Methods("GET")
	r.HandleFunc("/api/contracts", getContracts).Methods("GET")
	r.HandleFunc("/api/payments", getPayments).Methods("GET")
	r.HandleFunc("/api/analytics", getAnalytics).Methods("GET")
	r.HandleFunc("/api/query", executeCustomQuery).Methods("POST")

	// Serve static files
	r.PathPrefix("/").Handler(http.FileServer(http.Dir("./web/build/")))

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	fmt.Printf("🚀 Server starting on port %s\n", port)
	fmt.Printf("📊 API available at http://localhost:%s/api/\n", port)
	fmt.Printf("🌐 Web interface at http://localhost:%s/\n", port)

	log.Fatal(http.ListenAndServe(":"+port, corsHandler(r)))
}

func initDB() {
	var err error
	connectionStrings := []string{
		"root:tiger@tcp(localhost:3306)/freelance_gig_exchange?parseTime=true",
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

		if err = db.Ping(); err == nil {
			connected = true
			fmt.Println("✅ Database connection established!")
			break
		}
	}

	if !connected {
		fmt.Println("⚠️  Database connection failed. Running in demo mode.")
		fmt.Println("")
		fmt.Println("📋 To connect to real database and see live data:")
		fmt.Println("   1. Install MySQL: brew install mysql")
		fmt.Println("   2. Start MySQL: brew services start mysql")
		fmt.Println("   3. Create database: mysql -u root -p")
		fmt.Println("   4. Import schema: mysql -u root -p freelance_gig_exchange < ../database/expanded_schema.sql")
		fmt.Println("   5. Import data: mysql -u root -p freelance_gig_exchange < ../database/expanded_sample_data.sql")
		fmt.Println("   6. Restart this API server")
		fmt.Println("")
		fmt.Println("💡 Once connected, data inserted into MySQL will show in React frontend!")
		fmt.Println("")
		db = nil
	}
}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	status := "disconnected"
	if db != nil {
		if err := db.Ping(); err == nil {
			status = "connected"
		}
	}

	response := map[string]string{
		"status":    status,
		"timestamp": time.Now().Format(time.RFC3339),
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func getDashboardStats(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		stats := DashboardStats{
			Freelancers:  50,
			Clients:      30,
			Gigs:         100,
			Applications: 200,
			Contracts:    45,
			Payments:     80,
			TotalRevenue: 8500000,
			AvgRating:    4.2,
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(stats)
		return
	}

	// Real database queries
	stats := DashboardStats{}

	// Count freelancers
	db.QueryRow("SELECT COUNT(*) FROM freelancers").Scan(&stats.Freelancers)

	// Count clients
	db.QueryRow("SELECT COUNT(*) FROM clients").Scan(&stats.Clients)

	// Count gigs
	db.QueryRow("SELECT COUNT(*) FROM gigs").Scan(&stats.Gigs)

	// Count applications
	db.QueryRow("SELECT COUNT(*) FROM applications").Scan(&stats.Applications)

	// Count contracts
	db.QueryRow("SELECT COUNT(*) FROM contracts").Scan(&stats.Contracts)

	// Count payments
	db.QueryRow("SELECT COUNT(*) FROM payments").Scan(&stats.Payments)

	// Total revenue
	db.QueryRow("SELECT SUM(amount) FROM payments WHERE status = 'Paid'").Scan(&stats.TotalRevenue)

	// Average rating
	db.QueryRow("SELECT AVG(rating) FROM freelancers").Scan(&stats.AvgRating)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(stats)
}

func getFreelancers(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		freelancers := []Freelancer{
			{1, "Rohan Mehta", "rohan.mehta@gmail.com", "9876543210", "Delhi", "Expert", 4.8, 45, "2021-03-15"},
			{2, "Priya Sharma", "priya.sharma@gmail.com", "9988776655", "Bangalore", "Expert", 4.9, 52, "2020-11-20"},
			{3, "Amit Patel", "amit.patel@gmail.com", "9123456789", "Ahmedabad", "Intermediate", 4.2, 18, "2022-06-10"},
			{4, "Neha Verma", "neha.verma@gmail.com", "9812345678", "Pune", "Beginner", 4.0, 8, "2023-01-15"},
			{5, "Rajesh Kumar", "rajesh.kumar@gmail.com", "9871234567", "Mumbai", "Expert", 4.7, 38, "2021-08-22"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(freelancers)
		return
	}

	rows, err := db.Query(`
		SELECT freelancer_id, name, email, phone, location, experience_level, rating, total_completed, join_date
		FROM freelancers 
		ORDER BY rating DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var freelancers []Freelancer
	for rows.Next() {
		var f Freelancer
		err := rows.Scan(&f.ID, &f.Name, &f.Email, &f.Phone, &f.Location, &f.ExperienceLevel, &f.Rating, &f.TotalCompleted, &f.JoinDate)
		if err != nil {
			continue
		}
		freelancers = append(freelancers, f)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(freelancers)
}

func getClients(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		clients := []Client{
			{1, "TCS Innovations", "contact@tcs.com", "Tata Consultancy Services", "Mumbai", "2021-08-01"},
			{2, "Infosys Labs", "hr@infosys.com", "Infosys Limited", "Bangalore", "2022-05-15"},
			{3, "Aditya Tech Solutions", "support@adityatech.in", "Aditya Technologies", "Noida", "2024-02-09"},
			{4, "Wipro Digital", "projects@wipro.com", "Wipro Limited", "Pune", "2021-12-20"},
			{5, "HCL Technologies", "business@hcl.com", "HCL Tech", "Chennai", "2022-03-10"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(clients)
		return
	}

	rows, err := db.Query(`
		SELECT client_id, name, email, organization, location, member_since
		FROM clients 
		ORDER BY member_since DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var clients []Client
	for rows.Next() {
		var c Client
		err := rows.Scan(&c.ID, &c.Name, &c.Email, &c.Organization, &c.Location, &c.MemberSince)
		if err != nil {
			continue
		}
		clients = append(clients, c)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(clients)
}

func getGigs(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		gigs := []Gig{
			{1, "E-commerce Website Development", "Build a complete e-commerce platform", 150000, "Open", "2024-01-15", "TCS Innovations"},
			{2, "Data Analytics Dashboard", "Create interactive dashboard", 120000, "Open", "2024-01-20", "Infosys Labs"},
			{3, "Mobile App for Food Delivery", "Develop iOS and Android app", 200000, "Open", "2024-01-25", "Aditya Tech Solutions"},
			{4, "UI/UX Design for Fintech App", "Design modern interface", 80000, "Open", "2024-02-01", "Wipro Digital"},
			{5, "DevOps Pipeline Setup", "Set up CI/CD pipeline", 100000, "Open", "2024-02-05", "HCL Technologies"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(gigs)
		return
	}

	rows, err := db.Query(`
		SELECT g.gig_id, g.title, g.description, g.budget, g.status, g.posted_date, c.name
		FROM gigs g
		JOIN clients c ON g.client_id = c.client_id
		ORDER BY g.posted_date DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var gigs []Gig
	for rows.Next() {
		var g Gig
		err := rows.Scan(&g.ID, &g.Title, &g.Description, &g.Budget, &g.Status, &g.PostedDate, &g.ClientName)
		if err != nil {
			continue
		}
		gigs = append(gigs, g)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(gigs)
}

func getApplications(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		applications := []Application{
			{1, "Rohan Mehta", "E-commerce Website Development", 140000, "Approved", "2024-01-16"},
			{2, "Priya Sharma", "Data Analytics Dashboard", 110000, "Approved", "2024-01-21"},
			{3, "Amit Patel", "Mobile App for Food Delivery", 190000, "Pending", "2024-01-26"},
			{4, "Neha Verma", "UI/UX Design for Fintech App", 75000, "Approved", "2024-02-02"},
			{5, "Rajesh Kumar", "DevOps Pipeline Setup", 95000, "Pending", "2024-02-06"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(applications)
		return
	}

	rows, err := db.Query(`
		SELECT a.application_id, f.name, g.title, a.bid_amount, a.status, a.applied_date
		FROM applications a
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		JOIN gigs g ON a.gig_id = g.gig_id
		ORDER BY a.applied_date DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var applications []Application
	for rows.Next() {
		var a Application
		err := rows.Scan(&a.ID, &a.FreelancerName, &a.GigTitle, &a.BidAmount, &a.Status, &a.AppliedDate)
		if err != nil {
			continue
		}
		applications = append(applications, a)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(applications)
}

func getContracts(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		contracts := []Contract{
			{1, "Rohan Mehta", "E-commerce Website Development", 140000, "Active", "2024-01-20"},
			{2, "Priya Sharma", "Data Analytics Dashboard", 110000, "Active", "2024-01-25"},
			{3, "Neha Verma", "UI/UX Design for Fintech App", 75000, "Active", "2024-02-05"},
			{4, "Rajesh Kumar", "DevOps Pipeline Setup", 95000, "Active", "2024-02-10"},
			{5, "Amit Patel", "Mobile App for Food Delivery", 190000, "Active", "2024-02-15"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(contracts)
		return
	}

	rows, err := db.Query(`
		SELECT c.contract_id, f.name, g.title, c.total_payment, c.work_status, c.start_date
		FROM contracts c
		JOIN applications a ON c.application_id = a.application_id
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		JOIN gigs g ON a.gig_id = g.gig_id
		ORDER BY c.start_date DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var contracts []Contract
	for rows.Next() {
		var c Contract
		err := rows.Scan(&c.ID, &c.FreelancerName, &c.GigTitle, &c.TotalPayment, &c.WorkStatus, &c.StartDate)
		if err != nil {
			continue
		}
		contracts = append(contracts, c)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(contracts)
}

func getPayments(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		// Demo data
		payments := []Payment{
			{1, "Rohan Mehta", 140000, "2024-01-25", "UPI", "Paid"},
			{2, "Priya Sharma", 110000, "2024-01-30", "Bank Transfer", "Paid"},
			{3, "Neha Verma", 75000, "2024-02-10", "Paytm", "Paid"},
			{4, "Rajesh Kumar", 95000, "2024-02-15", "UPI", "Pending"},
			{5, "Amit Patel", 190000, "2024-02-20", "Bank Transfer", "Paid"},
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(payments)
		return
	}

	rows, err := db.Query(`
		SELECT p.payment_id, f.name, p.amount, p.payment_date, p.method, p.status
		FROM payments p
		JOIN contracts c ON p.contract_id = c.contract_id
		JOIN applications a ON c.application_id = a.application_id
		JOIN freelancers f ON a.freelancer_id = f.freelancer_id
		ORDER BY p.payment_date DESC
		LIMIT 50
	`)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var payments []Payment
	for rows.Next() {
		var p Payment
		err := rows.Scan(&p.ID, &p.FreelancerName, &p.Amount, &p.PaymentDate, &p.Method, &p.Status)
		if err != nil {
			continue
		}
		payments = append(payments, p)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(payments)
}

func getAnalytics(w http.ResponseWriter, r *http.Request) {
	// Enhanced analytics data
	analytics := map[string]interface{}{
		"freelancer_stats": map[string]interface{}{
			"total_freelancers":  60,
			"avg_rating":         4.2,
			"top_skills":         []string{"Python", "React", "JavaScript", "Java", "AWS", "Node.js", "Docker", "Kubernetes"},
			"beginner_count":     15,
			"intermediate_count": 25,
			"expert_count":       20,
		},
		"gig_stats": map[string]interface{}{
			"total_gigs":     150,
			"open_gigs":      65,
			"completed_gigs": 55,
			"cancelled_gigs": 30,
			"avg_budget":     125000,
		},
		"payment_stats": map[string]interface{}{
			"total_payments": 120,
			"total_amount":   12500000,
			"avg_payment":    104167,
			"success_rate":   88.0,
		},
		"category_demand": []map[string]interface{}{
			{"name": "Web Development", "value": 45, "count": 45, "revenue": 5400000},
			{"name": "Mobile Apps", "value": 35, "count": 35, "revenue": 4200000},
			{"name": "Data Science", "value": 25, "count": 25, "revenue": 3000000},
			{"name": "UI/UX Design", "value": 20, "count": 20, "revenue": 2400000},
			{"name": "DevOps", "value": 15, "count": 15, "revenue": 1800000},
			{"name": "Machine Learning", "value": 10, "count": 10, "revenue": 1200000},
		},
		"monthly_revenue": []map[string]interface{}{
			{"month": "Jan", "revenue": 1200000, "freelancers": 45, "gigs": 85},
			{"month": "Feb", "revenue": 1500000, "freelancers": 47, "gigs": 92},
			{"month": "Mar", "revenue": 1800000, "freelancers": 48, "gigs": 88},
			{"month": "Apr", "revenue": 2000000, "freelancers": 49, "gigs": 95},
			{"month": "May", "revenue": 2200000, "freelancers": 50, "gigs": 98},
			{"month": "Jun", "revenue": 2500000, "freelancers": 60, "gigs": 120},
		},
		"top_freelancers": []map[string]interface{}{
			{"name": "Rohan Mehta", "rating": 4.8, "projects": 45, "earnings": 1200000},
			{"name": "Priya Sharma", "rating": 4.9, "projects": 52, "earnings": 1350000},
			{"name": "Rajesh Kumar", "rating": 4.7, "projects": 38, "earnings": 950000},
			{"name": "Amit Patel", "rating": 4.2, "projects": 18, "earnings": 450000},
			{"name": "Neha Verma", "rating": 4.0, "projects": 8, "earnings": 200000},
		},
		"beginner_analytics": map[string]interface{}{
			"total_beginners": 15,
			"avg_rating":      3.8,
			"total_projects":  45,
			"success_rate":    75.0,
			"top_skills":      []string{"HTML/CSS", "JavaScript", "React", "Python", "Git"},
		},
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(analytics)
}

func executeCustomQuery(w http.ResponseWriter, r *http.Request) {
	if db == nil {
		http.Error(w, "Database connection required for custom queries", http.StatusServiceUnavailable)
		return
	}

	var request struct {
		Query string `json:"query"`
	}

	if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
		http.Error(w, "Invalid JSON", http.StatusBadRequest)
		return
	}

	rows, err := db.Query(request.Query)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	defer rows.Close()

	columns, err := rows.Columns()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	var results []map[string]interface{}
	for rows.Next() {
		values := make([]interface{}, len(columns))
		valuePtrs := make([]interface{}, len(columns))
		for i := range values {
			valuePtrs[i] = &values[i]
		}

		if err := rows.Scan(valuePtrs...); err != nil {
			continue
		}

		row := make(map[string]interface{})
		for i, col := range columns {
			row[col] = values[i]
		}
		results = append(results, row)
	}

	response := map[string]interface{}{
		"columns": columns,
		"rows":    results,
		"count":   len(results),
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}
