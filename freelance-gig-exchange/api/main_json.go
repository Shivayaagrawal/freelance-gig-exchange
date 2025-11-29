package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

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
	ClientID    int     `json:"client_id"`
	CategoryID  int     `json:"category_id"`
	Title       string  `json:"title"`
	Description string  `json:"description"`
	Budget      float64 `json:"budget"`
	PostedDate  string  `json:"posted_date"`
	Status      string  `json:"status"`
	ClientName  string  `json:"client_name"`
}

type Application struct {
	ID             int     `json:"id"`
	GigID          int     `json:"gig_id"`
	FreelancerID   int     `json:"freelancer_id"`
	ProposalText   string  `json:"proposal_text"`
	BidAmount      float64 `json:"bid_amount"`
	AppliedDate    string  `json:"applied_date"`
	Status         string  `json:"status"`
	FreelancerName string  `json:"freelancer_name"`
	GigTitle       string  `json:"gig_title"`
}

type Contract struct {
	ID            int     `json:"id"`
	ApplicationID int     `json:"application_id"`
	StartDate     string  `json:"start_date"`
	EndDate       string  `json:"end_date"`
	WorkStatus    string  `json:"work_status"`
	TotalPayment  float64 `json:"total_payment"`
}

type Payment struct {
	ID             int     `json:"id"`
	ContractID     int     `json:"contract_id"`
	Amount         float64 `json:"amount"`
	PaymentDate    string  `json:"payment_date"`
	Method         string  `json:"method"`
	Status         string  `json:"status"`
	ClientName     string  `json:"client_name"`
	FreelancerName string  `json:"freelancer_name"`
}

type DashboardStats struct {
	TotalFreelancers  int     `json:"total_freelancers"`
	TotalClients      int     `json:"total_clients"`
	TotalGigs         int     `json:"total_gigs"`
	TotalApplications int     `json:"total_applications"`
	TotalContracts    int     `json:"total_contracts"`
	TotalPayments     float64 `json:"total_payments"`
}

type Analytics struct {
	FreelancerStats struct {
		TotalFreelancers int      `json:"total_freelancers"`
		AverageRating    float64  `json:"average_rating"`
		TopSkills        []string `json:"top_skills"`
	} `json:"freelancer_stats"`
	GigStats struct {
		TotalGigs     int     `json:"total_gigs"`
		OpenGigs      int     `json:"open_gigs"`
		AverageBudget float64 `json:"average_budget"`
	} `json:"gig_stats"`
	PaymentStats struct {
		TotalPayments   float64 `json:"total_payments"`
		PendingPayments float64 `json:"pending_payments"`
		AveragePayment  float64 `json:"average_payment"`
	} `json:"payment_stats"`
	CategoryDemand []struct {
		Category string `json:"category"`
		Count    int    `json:"count"`
	} `json:"category_demand"`
	MonthlyRevenue []struct {
		Month   string  `json:"month"`
		Revenue float64 `json:"revenue"`
	} `json:"monthly_revenue"`
	TopFreelancers []struct {
		Name     string  `json:"name"`
		Rating   float64 `json:"rating"`
		Earnings float64 `json:"earnings"`
	} `json:"top_freelancers"`
	BeginnerAnalytics struct {
		TotalBeginners int     `json:"total_beginners"`
		AverageRating  float64 `json:"average_rating"`
		SuccessRate    float64 `json:"success_rate"`
	} `json:"beginner_analytics"`
}

// Demo data
var demoFreelancers = []Freelancer{
	{1, "Rohan Mehta", "rohan.mehta@gmail.com", "9876543210", "Delhi", "Expert", 4.8, 45, "2021-03-15"},
	{2, "Priya Sharma", "priya.sharma@gmail.com", "9988776655", "Bangalore", "Expert", 4.9, 52, "2020-11-20"},
	{3, "Amit Patel", "amit.patel@gmail.com", "9123456789", "Ahmedabad", "Intermediate", 4.2, 18, "2022-06-10"},
	{4, "Neha Verma", "neha.verma@gmail.com", "9812345678", "Pune", "Beginner", 4.0, 8, "2023-01-15"},
	{5, "Rajesh Kumar", "rajesh.kumar@gmail.com", "9871234567", "Mumbai", "Expert", 4.7, 38, "2021-08-22"},
}

var demoClients = []Client{
	{1, "TCS Innovations", "contact@tcs.com", "Tata Consultancy Services", "Mumbai", "2021-08-01"},
	{2, "Infosys Labs", "hr@infosys.com", "Infosys Limited", "Bangalore", "2022-05-15"},
	{3, "Aditya Tech Solutions", "support@adityatech.in", "Aditya Technologies", "Noida", "2024-02-09"},
	{4, "Wipro Digital", "projects@wipro.com", "Wipro Limited", "Pune", "2021-12-20"},
	{5, "HCL Technologies", "business@hcl.com", "HCL Tech", "Chennai", "2022-03-10"},
}

var demoGigs = []Gig{
	{1, 1, 1, "E-commerce Website Development", "Build a complete e-commerce platform with payment gateway integration", 150000.00, "2024-01-15", "Open", "TCS Innovations"},
	{2, 2, 2, "Data Analytics Dashboard", "Create interactive dashboard for business intelligence using Python and React", 120000.00, "2024-01-20", "Open", "Infosys Labs"},
	{3, 3, 3, "Mobile App for Food Delivery", "Develop iOS and Android app for food delivery service", 200000.00, "2024-01-25", "Open", "Aditya Tech Solutions"},
	{4, 4, 4, "UI/UX Design for Fintech App", "Design modern and intuitive interface for digital banking", 80000.00, "2024-02-01", "Open", "Wipro Digital"},
	{5, 5, 5, "DevOps Pipeline Setup", "Set up CI/CD pipeline using AWS and Docker", 100000.00, "2024-02-05", "Open", "HCL Technologies"},
}

var demoApplications = []Application{
	{1, 1, 1, "I have 5+ years experience in e-commerce development with payment gateway integration.", 140000.00, "2024-01-16", "Approved", "Rohan Mehta", "E-commerce Website Development"},
	{2, 1, 2, "Expert in full-stack development with proven track record in e-commerce platforms.", 150000.00, "2024-01-17", "Pending", "Priya Sharma", "E-commerce Website Development"},
	{3, 2, 3, "Data science expert with 3+ years experience in building analytics dashboards.", 110000.00, "2024-01-21", "Approved", "Amit Patel", "Data Analytics Dashboard"},
	{4, 2, 4, "I specialize in data analytics and visualization. Have worked on similar projects.", 120000.00, "2024-01-22", "Pending", "Neha Verma", "Data Analytics Dashboard"},
	{5, 3, 5, "Mobile app development expert with 4+ years experience in iOS and Android.", 190000.00, "2024-01-26", "Approved", "Rajesh Kumar", "Mobile App for Food Delivery"},
}

var demoContracts = []Contract{
	{1, 1, "2024-01-20", "2024-03-20", "Active", 140000.00},
	{2, 3, "2024-01-25", "2024-02-25", "Active", 110000.00},
	{3, 5, "2024-01-30", "2024-04-30", "Active", 190000.00},
}

var demoPayments = []Payment{
	{1, 1, 70000.00, "2024-01-25", "UPI", "Paid", "TCS Innovations", "Rohan Mehta"},
	{2, 2, 55000.00, "2024-01-30", "Bank Transfer", "Paid", "Infosys Labs", "Amit Patel"},
	{3, 3, 95000.00, "2024-02-05", "UPI", "Pending", "Aditya Tech Solutions", "Rajesh Kumar"},
}

var demoAnalytics = Analytics{
	FreelancerStats: struct {
		TotalFreelancers int      `json:"total_freelancers"`
		AverageRating    float64  `json:"average_rating"`
		TopSkills        []string `json:"top_skills"`
	}{
		TotalFreelancers: 5,
		AverageRating:    4.52,
		TopSkills:        []string{"Python", "React", "JavaScript", "MySQL", "AWS"},
	},
	GigStats: struct {
		TotalGigs     int     `json:"total_gigs"`
		OpenGigs      int     `json:"open_gigs"`
		AverageBudget float64 `json:"average_budget"`
	}{
		TotalGigs:     5,
		OpenGigs:      5,
		AverageBudget: 130000.00,
	},
	PaymentStats: struct {
		TotalPayments   float64 `json:"total_payments"`
		PendingPayments float64 `json:"pending_payments"`
		AveragePayment  float64 `json:"average_payment"`
	}{
		TotalPayments:   220000.00,
		PendingPayments: 95000.00,
		AveragePayment:  73333.33,
	},
	CategoryDemand: []struct {
		Category string `json:"category"`
		Count    int    `json:"count"`
	}{
		{"Web Development", 2},
		{"Data Science", 1},
		{"Mobile Apps", 1},
		{"UI/UX Design", 1},
	},
	MonthlyRevenue: []struct {
		Month   string  `json:"month"`
		Revenue float64 `json:"revenue"`
	}{
		{"January", 125000.00},
		{"February", 95000.00},
		{"March", 150000.00},
	},
	TopFreelancers: []struct {
		Name     string  `json:"name"`
		Rating   float64 `json:"rating"`
		Earnings float64 `json:"earnings"`
	}{
		{"Priya Sharma", 4.9, 150000.00},
		{"Rohan Mehta", 4.8, 140000.00},
		{"Rajesh Kumar", 4.7, 190000.00},
	},
	BeginnerAnalytics: struct {
		TotalBeginners int     `json:"total_beginners"`
		AverageRating  float64 `json:"average_rating"`
		SuccessRate    float64 `json:"success_rate"`
	}{
		TotalBeginners: 1,
		AverageRating:  4.0,
		SuccessRate:    75.0,
	},
}

func main() {
	fmt.Println("🚀 Starting FGX API Server (JSON Mode)")
	fmt.Println("📊 Using demo data - no database connection required")
	fmt.Println("🌐 API will be available at: http://localhost:8080")
	fmt.Println("🔗 React frontend should connect to: http://localhost:8080")

	r := mux.NewRouter()

	// CORS middleware
	c := handlers.CORS(
		handlers.AllowedOrigins([]string{"http://localhost:3000", "http://localhost:3001", "http://localhost:3002"}),
		handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}),
		handlers.AllowedHeaders([]string{"Content-Type", "Authorization"}),
	)

	// API routes
	r.HandleFunc("/api/health", healthCheck).Methods("GET")
	r.HandleFunc("/api/freelancers", getFreelancers).Methods("GET")
	r.HandleFunc("/api/clients", getClients).Methods("GET")
	r.HandleFunc("/api/gigs", getGigs).Methods("GET")
	r.HandleFunc("/api/applications", getApplications).Methods("GET")
	r.HandleFunc("/api/contracts", getContracts).Methods("GET")
	r.HandleFunc("/api/payments", getPayments).Methods("GET")
	r.HandleFunc("/api/analytics", getAnalytics).Methods("GET")
	r.HandleFunc("/api/query", executeCustomQuery).Methods("POST")

	// Serve static files from React build
	r.PathPrefix("/").Handler(http.FileServer(http.Dir("../web/build/")))

	// Start server
	fmt.Println("✅ Server starting on port 8080...")
	log.Fatal(http.ListenAndServe(":8080", c(r)))
}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{
		"status":  "healthy",
		"mode":    "demo",
		"message": "FGX API running in demo mode with JSON data",
	})
}

func getFreelancers(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoFreelancers)
}

func getClients(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoClients)
}

func getGigs(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoGigs)
}

func getApplications(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoApplications)
}

func getContracts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoContracts)
}

func getPayments(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoPayments)
}

func getAnalytics(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(demoAnalytics)
}

func executeCustomQuery(w http.ResponseWriter, r *http.Request) {
	var query struct {
		Query string `json:"query"`
	}

	if err := json.NewDecoder(r.Body).Decode(&query); err != nil {
		http.Error(w, "Invalid JSON", http.StatusBadRequest)
		return
	}

	// Demo query results
	results := map[string]interface{}{
		"query": query.Query,
		"results": []map[string]interface{}{
			{"id": 1, "name": "Rohan Mehta", "rating": 4.8, "earnings": 140000.00},
			{"id": 2, "name": "Priya Sharma", "rating": 4.9, "earnings": 150000.00},
			{"id": 3, "name": "Amit Patel", "rating": 4.2, "earnings": 110000.00},
		},
		"message": "Demo query executed successfully",
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(results)
}







