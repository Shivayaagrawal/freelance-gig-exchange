const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../web/build')));

// MySQL Database Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'tiger',
  database: 'freelance_gig_exchange',
  port: 3306
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    console.error('❌ Database connection failed:', err.message);
    process.exit(1);
  }
  console.log('✅ Connected to MySQL database');
});

// API Routes
app.get('/api/health', (req, res) => {
  res.json({
    status: 'healthy',
    database: 'connected',
    timestamp: new Date().toISOString()
  });
});

// Get all freelancers
app.get('/api/freelancers', (req, res) => {
  const query = `
    SELECT f.*, 
           GROUP_CONCAT(s.skill_name) as skills
    FROM freelancers f
    LEFT JOIN freelancer_skills fs ON f.freelancer_id = fs.freelancer_id
    LEFT JOIN skills s ON fs.skill_id = s.skill_id
    GROUP BY f.freelancer_id
    ORDER BY f.rating DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching freelancers:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get all clients
app.get('/api/clients', (req, res) => {
  const query = 'SELECT * FROM clients ORDER BY member_since DESC';
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching clients:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get all gigs with client names
app.get('/api/gigs', (req, res) => {
  const query = `
    SELECT g.*, c.name as client_name, cat.category_name
    FROM gigs g
    JOIN clients c ON g.client_id = c.client_id
    JOIN categories cat ON g.category_id = cat.category_id
    ORDER BY g.posted_date DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching gigs:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get all applications with freelancer and gig names
app.get('/api/applications', (req, res) => {
  const query = `
    SELECT a.*, f.name as freelancer_name, g.title as gig_title
    FROM applications a
    JOIN freelancers f ON a.freelancer_id = f.freelancer_id
    JOIN gigs g ON a.gig_id = g.gig_id
    ORDER BY a.applied_date DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching applications:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get all contracts
app.get('/api/contracts', (req, res) => {
  const query = `
    SELECT c.*, f.name as freelancer_name, g.title as gig_title
    FROM contracts c
    JOIN applications a ON c.application_id = a.application_id
    JOIN freelancers f ON a.freelancer_id = f.freelancer_id
    JOIN gigs g ON a.gig_id = g.gig_id
    ORDER BY c.start_date DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching contracts:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get all payments with client and freelancer names
app.get('/api/payments', (req, res) => {
  const query = `
    SELECT p.*, 
           c.name as client_name, 
           f.name as freelancer_name
    FROM payments p
    JOIN contracts co ON p.contract_id = co.contract_id
    JOIN applications a ON co.application_id = a.application_id
    JOIN freelancers f ON a.freelancer_id = f.freelancer_id
    JOIN gigs g ON a.gig_id = g.gig_id
    JOIN clients c ON g.client_id = c.client_id
    ORDER BY p.payment_date DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching payments:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get skills data
app.get('/api/skills', (req, res) => {
  const query = `
    SELECT 
      s.skill_id,
      s.skill_name,
      COUNT(fs.freelancer_id) as freelancer_count,
      AVG(f.rating) as avg_rating
    FROM skills s
    LEFT JOIN freelancer_skills fs ON s.skill_id = fs.skill_id
    LEFT JOIN freelancers f ON fs.freelancer_id = f.freelancer_id
    GROUP BY s.skill_id, s.skill_name
    ORDER BY freelancer_count DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching skills:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get messages data
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
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching messages:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get reviews data
app.get('/api/reviews', (req, res) => {
  const query = `
    SELECT 
      r.*,
      f.name as freelancer_name,
      c.name as client_name,
      g.title as project_title
    FROM reviews r
    JOIN contracts ct ON r.contract_id = ct.contract_id
    JOIN applications a ON ct.application_id = a.application_id
    JOIN freelancers f ON a.freelancer_id = f.freelancer_id
    JOIN gigs g ON a.gig_id = g.gig_id
    JOIN clients c ON g.client_id = c.client_id
    ORDER BY r.review_date DESC
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching reviews:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});

// Get analytics data
app.get('/api/analytics', (req, res) => {
  const queries = {
    freelancerStats: `
      SELECT 
        COUNT(*) as total_freelancers,
        AVG(rating) as average_rating,
        COUNT(CASE WHEN experience_level = 'Expert' THEN 1 END) as expert_count
      FROM freelancers
    `,
    gigStats: `
      SELECT 
        COUNT(*) as total_gigs,
        COUNT(CASE WHEN status = 'Open' THEN 1 END) as open_gigs,
        AVG(budget) as average_budget
      FROM gigs
    `,
    paymentStats: `
      SELECT 
        SUM(amount) as total_payments,
        COUNT(CASE WHEN status = 'Pending' THEN 1 END) as pending_count,
        AVG(amount) as average_payment
      FROM payments
    `,
    categoryDemand: `
      SELECT c.category_name, COUNT(g.gig_id) as count
      FROM categories c
      LEFT JOIN gigs g ON c.category_id = g.category_id
      GROUP BY c.category_id, c.category_name
      ORDER BY count DESC
    `,
    topFreelancers: `
      SELECT name, rating, total_completed
      FROM freelancers
      ORDER BY rating DESC, total_completed DESC
      LIMIT 5
    `
  };

  const results = {};
  let completed = 0;
  const total = Object.keys(queries).length;

  Object.keys(queries).forEach(key => {
    db.query(queries[key], (err, data) => {
      if (err) {
        console.error(`Error fetching ${key}:`, err);
        results[key] = [];
      } else {
        results[key] = data;
      }
      
      completed++;
      if (completed === total) {
        res.json({
          freelancer_stats: {
            total_freelancers: results.freelancerStats[0]?.total_freelancers || 0,
            average_rating: parseFloat(results.freelancerStats[0]?.average_rating || 0).toFixed(2),
            expert_count: results.freelancerStats[0]?.expert_count || 0
          },
          gig_stats: {
            total_gigs: results.gigStats[0]?.total_gigs || 0,
            open_gigs: results.gigStats[0]?.open_gigs || 0,
            average_budget: parseFloat(results.gigStats[0]?.average_budget || 0).toFixed(2)
          },
          payment_stats: {
            total_payments: parseFloat(results.paymentStats[0]?.total_payments || 0).toFixed(2),
            pending_count: results.paymentStats[0]?.pending_count || 0,
            average_payment: parseFloat(results.paymentStats[0]?.average_payment || 0).toFixed(2)
          },
          category_demand: results.categoryDemand || [],
          top_freelancers: results.topFreelancers || []
        });
      }
    });
  });
});

// Execute custom query
app.post('/api/query', (req, res) => {
  const { query } = req.body;
  
  if (!query) {
    return res.status(400).json({ error: 'Query is required' });
  }

  // Allow all SQL operations (SELECT, INSERT, UPDATE, DELETE, CREATE, etc.)
  const trimmedQuery = query.trim().toLowerCase();
  
  // Basic security checks
  const dangerousKeywords = ['drop', 'truncate', 'alter', 'grant', 'revoke', 'create user', 'delete user'];
  const hasDangerousKeyword = dangerousKeywords.some(keyword => trimmedQuery.includes(keyword));
  
  if (hasDangerousKeyword) {
    return res.status(400).json({ error: 'This operation is not allowed for security reasons' });
  }

  db.query(query, (err, results) => {
    if (err) {
      console.error('Query error:', err);
      return res.status(500).json({ error: err.message });
    }
    
    // Handle different types of queries
    if (trimmedQuery.startsWith('select') || trimmedQuery.startsWith('show') || trimmedQuery.startsWith('describe')) {
      res.json({ results, query, type: 'select' });
    } else if (trimmedQuery.startsWith('insert') || trimmedQuery.startsWith('update') || trimmedQuery.startsWith('delete')) {
      res.json({ 
        message: 'Query executed successfully', 
        affectedRows: results.affectedRows || 0,
        insertId: results.insertId || null,
        query, 
        type: 'modify' 
      });
    } else if (trimmedQuery.startsWith('create') || trimmedQuery.startsWith('alter')) {
      res.json({ 
        message: 'Query executed successfully', 
        query, 
        type: 'ddl' 
      });
    } else {
      res.json({ results, query, type: 'other' });
    }
  });
});

// Get database schema
app.get('/api/schema', (req, res) => {
  const query = `
    SELECT 
      TABLE_NAME,
      COLUMN_NAME,
      DATA_TYPE,
      IS_NULLABLE,
      COLUMN_KEY,
      COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = 'freelance_gig_exchange'
    ORDER BY TABLE_NAME, ORDINAL_POSITION
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching schema:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    
    // Group by table
    const schema = {};
    results.forEach(row => {
      if (!schema[row.TABLE_NAME]) {
        schema[row.TABLE_NAME] = [];
      }
      schema[row.TABLE_NAME].push({
        name: row.COLUMN_NAME,
        type: row.DATA_TYPE,
        nullable: row.IS_NULLABLE === 'YES',
        key: row.COLUMN_KEY,
        default: row.COLUMN_DEFAULT
      });
    });
    
    res.json(schema);
  });
});

// Serve React app
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '../web/build/index.html'));
});

// Start server
app.listen(PORT, () => {
  console.log('🚀 FGX Backend Server Started');
  console.log(`📊 API available at http://localhost:${PORT}/api/`);
  console.log(`🌐 Web interface at http://localhost:${PORT}/`);
  console.log('✅ Database: MySQL connected');
});
