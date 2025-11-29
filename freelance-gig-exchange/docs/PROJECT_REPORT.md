## 0. Title Page

- **Project**: Freelance Gig Exchange Network (FGX)
- **Domain**: Full-stack DBMS (MySQL + Node.js API + React Frontend + Go CLI)
- **Author**: Shivi Agrawal
- **Academic Level**: MCA Professional Project
- **Date**: November 2025

## 1. Table of Contents

1. Title Page  
2. Table of Contents  
3. Summary  
4. Introduction  
5. Tools and Libraries Used  
6. Data Collection and Preprocessing  
7. Analysis and Implementation  
8. Results and Discussion  
9. Conclusion  

## 2. Summary

- **Brief Overview**: FGX is a production-style freelancing ecosystem that models end-to-end workflows (gigs, applications, contracts, payments, reviews, and in-app messaging) with a normalized MySQL schema, REST API, Go-based CLI, and React dashboard. Realistic Indian business data plus advanced SQL (views, stored procedures, triggers) demonstrate graduate-level DBMS proficiency.  

## 3. Introduction

- **Background & Context**: Traditional freelancing portals lack transparent analytics connecting clients, freelancers, and payments. FGX fills this gap with a single source of truth that the backend, frontend, and CLI all share.  
- **Problem Statement**: Build a database-centric platform that simultaneously supports operational workflows (posting gigs, tracking contracts, messaging) and analytical insights (top talent, pending payments, category demand) without compromising data integrity.  
- **Project Objectives**:  
  - Design a normalized schema with relational safeguards, reusable SQL assets, and realistic datasets.  
  - Expose consistent REST endpoints to power both UI and command-line experiences.  
  - Provide rich visualization and exploration tools (React dashboard, analytics, ER diagrams, custom query runner).  
- **Scope**: Covers schema design, seed/large datasets, backend services, React SPA, and Go CLI utilities. External concerns such as auth/payments gateway integrations are out of scope.  

## 4. Tools and Libraries Used

- **Database Layer**: MySQL 8, standard SQL, stored procedures, triggers, and performance indexes (`database/schema.sql`).  
- **Backend API**: Node.js 22, Express 4, MySQL2, CORS, hosted in `backend/server.js`.  
- **Frontend**: React 18 (CRA), Axios, Lucide icons, Recharts, routed SPA inside `web/`.  
- **CLI Console**: Go 1.22, `database/sql`, `go-sql-driver/mysql`, `fatih/color` for a rich terminal UX (`cli/main.go`).  
- **Dev Tooling**: npm scripts (`npm start`, `npm run build`), Go modules, shell scripts for MySQL provisioning.  

## 5. Data Collection and Preprocessing

- **Data Sources**: Curated SQL inserts in `database/sample_data.sql`, `expanded_sample_data.sql`, and `large_dataset.sql` populate 50+ freelancers, 30+ clients, 100+ gigs, and optional 500k+ records for stress tests.  
- **Schema-Driven Validation**: CHECK constraints, ENUMs, foreign keys, and triggers enforce data quality at ingestion time, eliminating the need for heavy ETL cleanup.  
- **Cleaning Techniques**: Referential integrity blocks orphaned records, while unique keys (e.g., `unique_application` on gig + freelancer) prevent duplicates.  

## 6. Analysis and Implementation

- **Database Modeling & SQL Assets**: Highly relational schema plus analytical views (top freelancers, pending payments, gig stats) and procedures (earnings, skill matches) power downstream services.  

```201:247:database/schema.sql
CREATE VIEW view_top_freelancers AS
SELECT 
    f.freelancer_id,
    f.name,
    f.rating,
    f.total_completed,
    f.experience_level,
    COUNT(DISTINCT c.contract_id) as active_contracts,
    COALESCE(SUM(p.amount), 0) as total_earnings
FROM freelancers f
LEFT JOIN applications a ON f.freelancer_id = a.freelancer_id
LEFT JOIN contracts c ON a.application_id = c.application_id
LEFT JOIN payments p ON c.contract_id = p.contract_id AND p.status = 'Paid'
GROUP BY f.freelancer_id, f.name, f.rating, f.total_completed, f.experience_level
ORDER BY f.rating DESC, total_earnings DESC;
```

- **RESTful Backend**: Express routes expose CRUD-style endpoints, analytics aggregations, schema introspection, and messaging enrichment (joins clients/freelancers to produce human-readable conversations).  

```181:208:backend/server.js
app.get('/api/messages', (req, res) => {
  const query = `
    SELECT 
      m.*,
      CASE 
        WHEN m.sender_type = 'Client' THEN c.name
        ELSE f.name
      END as sender_name,
      CASE 
        WHEN m.sender_type = 'Client' THEN f.name
        ELSE c.name
      END as receiver_name
    FROM messages m
    LEFT JOIN clients c ON (m.sender_type = 'Client' AND m.sender_id = c.client_id) 
                        OR (m.sender_type = 'Freelancer' AND m.receiver_id = c.client_id)
    LEFT JOIN freelancers f ON (m.sender_type = 'Freelancer' AND m.sender_id = f.freelancer_id)
                           OR (m.sender_type = 'Client' AND m.receiver_id = f.freelancer_id)
    ORDER BY m.sent_at DESC
  `;
```

- **Go CLI Automation**: Interactive console lets faculty/testers audit the DB without launching the UI. It gracefully falls back to demo mode when MySQL is offline and offers quick access to freelancers, clients, gigs, analytics, and custom SQL.  

```47:118:cli/main.go
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
```

- **Frontend Exploration & Visualization**: The React dashboard wires Axios calls to `/api/*`, shows live counts, charts, and quick actions, and provides dedicated screens for every entity plus a custom SQL runner/ER diagram viewer.  

```1:167:web/src/components/Dashboard.js
const Dashboard = () => {
  const [stats, setStats] = useState({
    freelancers: 0,
    clients: 0,
    gigs: 0,
    applications: 0,
    contracts: 0,
    payments: 0,
    totalRevenue: 0,
    avgRating: 0
  });
  ...
  const statCards = [
    { title: 'Total Freelancers', value: stats.freelancers, icon: Users, color: '#667eea', change: '+12%' },
    { title: 'Active Clients', value: stats.clients, icon: Building2, color: '#28a745', change: '+8%' },
    { title: 'Open Gigs', value: stats.gigs, icon: Briefcase, color: '#ffc107', change: '+15%' },
    { title: 'Applications', value: stats.applications, icon: TrendingUp, color: '#17a2b8', change: '+22%' },
    { title: 'Active Contracts', value: stats.contracts, icon: CreditCard, color: '#6f42c1', change: '+18%' },
    { title: 'Total Revenue', value: `₹${(stats.totalRevenue / 100000).toFixed(1)}L`, icon: DollarSign, color: '#fd7e14', change: '+25%' }
  ];
```

- **Data Exploration Evidence**: Each React route (Freelancers, Gigs, Payments, Analytics, Custom Query, ER diagram) echoes live tables, enabling visual verification. Screenshots can be captured from `npm start` on `web/` after seeding DB; include them in submitted PDF if required.  

- **Message Generation Logic**: `/api/messages` builds conversational payloads by resolving sender/receiver names and statuses; React uses this to render timeline-style interactions.  

## 7. Results and Discussion

- **Findings**:  
  - Top freelancers and pending payments are instantly queryable via SQL views, supporting finance/placement discussions.  
  - Category demand statistics reveal hiring hotspots, assisting academic advisories.  
  - CLI analytics + dashboard cards corroborate dataset realism (50+ freelancers, ₹85L revenue demo).  
- **System Behaviour**:  
  - All modules share the same MySQL schema, ensuring consistency between UI, API, and CLI.  
  - Stored procedures and triggers automate bookkeeping (e.g., incrementing `total_completed` when contracts finish).  
  - Message enrichment proves that relational joins can power user-friendly narratives without denormalizing data.  

## 8. Conclusion

- **Interpretation**: The project demonstrates how a rigorously normalized database can still support engaging user experiences (web + CLI) while preserving analytical depth.  
- **Achievement of Objectives**: Completed schema design, real-time API, visualization suite, and automation flows; MySQL views/triggers/stored procedures provide academic-grade depth.  
- **Future Work & Recommendations**: Add authentication/authorization, integrate payment gateways, implement WebSocket-based live messaging, and containerize the stack with Docker Compose for classroom deployment.  

- **Summary**: FGX stands as a cohesive DBMS showcase that merges SQL craftsmanship with practical user interfaces, ready for viva demonstrations and portfolio inclusion.  





