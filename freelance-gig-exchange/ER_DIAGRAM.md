# 🗺️ Enhanced ER Diagram - Freelance Gig Exchange Network

## Visual Database Schema

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                           FREELANCE GIG EXCHANGE NETWORK                        │
│                              Enhanced ER Diagram                                │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   FREELANCERS   │    │     CLIENTS     │    │    CATEGORIES   │
│                 │    │                 │    │                 │
│ freelancer_id   │◄───┤ client_id       │    │ category_id     │
│ name            │    │ name            │    │ category_name    │
│ email           │    │ email           │    │                 │
│ phone           │    │ organization    │    │                 │
│ location        │    │ location        │    │                 │
│ experience_level│    │ member_since    │    │                 │
│ rating          │    │                 │    │                 │
│ total_completed │    │                 │    │                 │
│ join_date       │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ FREELANCER_SKILLS│    │      GIGS       │    │   APPLICATIONS  │
│                 │    │                 │    │                 │
│ freelancer_id   │    │ gig_id          │    │ application_id  │
│ skill_id        │    │ client_id       │    │ gig_id          │
│                 │    │ category_id      │    │ freelancer_id   │
│                 │    │ title           │    │ proposal_text   │
│                 │    │ description     │    │ bid_amount      │
│                 │    │ budget          │    │ applied_date    │
│                 │    │ posted_date     │    │ status          │
│                 │    │ status          │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     SKILLS      │    │   CONTRACTS     │    │    PAYMENTS     │
│                 │    │                 │    │                 │
│ skill_id        │    │ contract_id     │    │ payment_id      │
│ skill_name      │    │ application_id  │    │ contract_id     │
│                 │    │ start_date      │    │ amount          │
│                 │    │ end_date        │    │ payment_date    │
│                 │    │ work_status     │    │ method          │
│                 │    │ total_payment   │    │ status          │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                 │                       │
                                 │                       │
                                 │                       │
                                 ▼                       ▼
                        ┌─────────────────┐    ┌─────────────────┐
                        │     REVIEWS     │    │    MESSAGES     │
                        │                 │    │                 │
                        │ review_id       │    │ message_id      │
                        │ contract_id     │    │ sender_type     │
                        │ rating          │    │ sender_id       │
                        │ comments        │    │ receiver_id     │
                        │ review_date     │    │ message_text    │
                        │                 │    │ sent_at         │
                        └─────────────────┘    └─────────────────┘

## Relationship Types

### One-to-Many (1:N)
- Clients → Gigs (1 client can have many gigs)
- Categories → Gigs (1 category can have many gigs)
- Gigs → Applications (1 gig can have many applications)
- Freelancers → Applications (1 freelancer can apply to many gigs)
- Applications → Contracts (1 application becomes 1 contract)
- Contracts → Payments (1 contract can have many payments)
- Contracts → Reviews (1 contract can have many reviews)

### Many-to-Many (M:N)
- Freelancers ↔ Skills (through freelancer_skills table)
- Clients ↔ Freelancers (through messages table)

## Key Features

### 🔑 Primary Keys
- All tables have auto-incrementing primary keys
- Composite primary key in freelancer_skills table

### 🔗 Foreign Keys
- Proper referential integrity maintained
- Cascade delete where appropriate

### 📊 Data Types
- VARCHAR for text fields with appropriate lengths
- DECIMAL for monetary values
- ENUM for status fields
- DATE/DATETIME for temporal data

### 🎯 Business Logic
- Freelancer ratings and completion tracking
- Payment status and method tracking
- Message threading between clients and freelancers
- Review system for completed contracts

## Interactive Features

### 🖱️ Clickable Entities
- Click any entity to see detailed information
- Modal popup with attributes and relationships
- Color-coded entities for easy identification

### 🔍 Search & Filter
- Search entities by name
- Filter by relationship type
- Toggle relationship visibility

### 🎨 Visual Controls
- Zoom in/out functionality
- Pan and drag navigation
- Download diagram as PNG
- Responsive design for all screen sizes

## Entity Details

### 👨‍💻 FREELANCERS
- **Icon**: 👨‍💻
- **Color**: Blue (#3b82f6)
- **Attributes**: 9 fields including rating, experience level
- **Relationships**: Applications, Skills, Messages

### 🏢 CLIENTS
- **Icon**: 🏢
- **Color**: Green (#10b981)
- **Attributes**: 6 fields including organization
- **Relationships**: Gigs, Messages

### 💼 GIGS
- **Icon**: 💼
- **Color**: Orange (#f59e0b)
- **Attributes**: 8 fields including budget and status
- **Relationships**: Clients, Categories, Applications

### 📝 APPLICATIONS
- **Icon**: 📝
- **Color**: Purple (#8b5cf6)
- **Attributes**: 7 fields including proposal and bid
- **Relationships**: Gigs, Freelancers, Contracts

### 📋 CONTRACTS
- **Icon**: 📋
- **Color**: Red (#ef4444)
- **Attributes**: 6 fields including payment terms
- **Relationships**: Applications, Payments, Reviews

### 💰 PAYMENTS
- **Icon**: 💰
- **Color**: Cyan (#06b6d4)
- **Attributes**: 6 fields including method and status
- **Relationships**: Contracts

### ⭐ REVIEWS
- **Icon**: ⭐
- **Color**: Lime (#84cc16)
- **Attributes**: 5 fields including rating and comments
- **Relationships**: Contracts

### 🏷️ SKILLS
- **Icon**: 🏷️
- **Color**: Orange (#f97316)
- **Attributes**: 2 fields (ID and name)
- **Relationships**: Freelancer_Skills

### 🔗 FREELANCER_SKILLS
- **Icon**: 🔗
- **Color**: Pink (#ec4899)
- **Attributes**: 2 composite primary keys
- **Relationships**: Freelancers, Skills

### 📂 CATEGORIES
- **Icon**: 📂
- **Color**: Indigo (#6366f1)
- **Attributes**: 2 fields (ID and name)
- **Relationships**: Gigs

### 💬 MESSAGES
- **Icon**: 💬
- **Color**: Teal (#14b8a6)
- **Attributes**: 6 fields including sender/receiver
- **Relationships**: Clients, Freelancers

## Database Statistics

- **Total Tables**: 11
- **Total Relationships**: 15+
- **Primary Keys**: 11 (10 single, 1 composite)
- **Foreign Keys**: 15+
- **Data Integrity**: Full referential integrity
- **Normalization**: 3NF compliant

## Access Information

- **Web Interface**: http://localhost:3000/enhanced-erd
- **Interactive Features**: Click, zoom, pan, search
- **Export Options**: PNG download
- **Real-time Updates**: Connected to live MySQL database







