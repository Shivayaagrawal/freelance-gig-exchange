import React, { useState } from 'react';
import { Play, Download, AlertCircle } from 'lucide-react';
import axios from 'axios';

const CustomQuery = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const executeQuery = async () => {
    if (!query.trim()) {
      setError('Please enter a SQL query');
      return;
    }

    setLoading(true);
    setError(null);
    setResults(null);

    try {
      const response = await axios.post('/api/query', { query });
      setResults(response.data);
      setError(null);
    } catch (err) {
      console.error('Query execution error:', err);
      setError(err.response?.data?.error || 'Query execution failed. Please check your SQL syntax.');
      setResults(null);
    } finally {
      setLoading(false);
    }
  };

  const downloadResults = () => {
    if (!results || !results.results) return;
    
    const csvContent = [
      Object.keys(results.results[0] || {}).join(','),
      ...results.results.map(row => 
        Object.values(row).map(value => 
          typeof value === 'string' && value.includes(',') 
            ? `"${value}"` 
            : value
        ).join(',')
      )
    ].join('\n');

    const blob = new Blob([csvContent], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'query_results.csv';
    a.click();
    window.URL.revokeObjectURL(url);
  };

  const sampleQueries = [
    {
      name: 'Top Freelancers by Rating',
      query: 'SELECT name, rating, total_completed FROM freelancers ORDER BY rating DESC LIMIT 10;'
    },
    {
      name: 'Active Gigs by Category',
      query: 'SELECT c.category_name, COUNT(g.gig_id) as total_gigs FROM categories c LEFT JOIN gigs g ON c.category_id = g.category_id WHERE g.status = "Open" GROUP BY c.category_name;'
    },
    {
      name: 'Payment Summary',
      query: 'SELECT method, COUNT(*) as count, SUM(amount) as total FROM payments WHERE status = "Paid" GROUP BY method;'
    },
    {
      name: 'Insert New Freelancer',
      query: 'INSERT INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date) VALUES ("John Doe", "john.doe@email.com", "9876543210", "Mumbai", "Intermediate", 4.5, 10, "2024-01-01");'
    },
    {
      name: 'Create New Table',
      query: 'CREATE TABLE notifications (id INT AUTO_INCREMENT PRIMARY KEY, user_id INT, message TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);'
    },
    {
      name: 'Update Freelancer Rating',
      query: 'UPDATE freelancers SET rating = 4.8 WHERE freelancer_id = 1;'
    },
    {
      name: 'Delete Old Messages',
      query: 'DELETE FROM messages WHERE sent_at < "2023-01-01";'
    },
    {
      name: 'Freelancer Skills Distribution',
      query: 'SELECT s.skill_name, COUNT(fs.freelancer_id) as freelancer_count FROM skills s JOIN freelancer_skills fs ON s.skill_id = fs.skill_id GROUP BY s.skill_name ORDER BY freelancer_count DESC;'
    }
  ];

  return (
    <div className="container">
      <div className="page-header">
        <h1>🔍 Custom SQL Query</h1>
        <p>Execute custom SQL queries against the database</p>
      </div>

      <div className="query-container">
        <div className="query-editor">
          <div className="editor-header">
            <h3>SQL Query Editor</h3>
            <div className="editor-actions">
              <button 
                className="btn btn-primary" 
                onClick={executeQuery}
                disabled={loading}
              >
                <Play size={16} />
                {loading ? 'Executing...' : 'Execute'}
              </button>
              {results && (
                <button className="btn btn-secondary" onClick={downloadResults}>
                  <Download size={16} />
                  Download CSV
                </button>
              )}
            </div>
          </div>
          
          <textarea
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Enter your SQL query here..."
            className="query-textarea"
            rows={8}
          />
        </div>

        <div className="sample-queries">
          <h3>Sample Queries</h3>
          <div className="query-samples">
            {sampleQueries.map((sample, index) => (
              <div key={index} className="sample-query">
                <h4>{sample.name}</h4>
                <code>{sample.query}</code>
                <button 
                  className="btn btn-sm"
                  onClick={() => setQuery(sample.query)}
                >
                  Use This Query
                </button>
              </div>
            ))}
          </div>
        </div>
      </div>

      {error && (
        <div className="error-message">
          <AlertCircle size={16} />
          <span>{error}</span>
        </div>
      )}

      {results && (
        <div className="results-container">
          <div className="results-header">
            <h3>Query Results</h3>
            <div className="results-info">
              {results.type === 'select' && results.results && (
                <span>{results.results.length} rows returned</span>
              )}
              {results.type === 'modify' && (
                <span>✅ {results.message} - {results.affectedRows} rows affected</span>
              )}
              {results.type === 'ddl' && (
                <span>✅ {results.message}</span>
              )}
            </div>
          </div>
          
          {results.type === 'select' && results.results && results.results.length > 0 && (
            <div className="results-table-container">
              <table className="results-table">
                <thead>
                  <tr>
                    {Object.keys(results.results[0]).map((column, index) => (
                      <th key={index}>{column}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {results.results.slice(0, 100).map((row, rowIndex) => (
                    <tr key={rowIndex}>
                      {Object.values(row).map((value, colIndex) => (
                        <td key={colIndex}>{value}</td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
              {results.results.length > 100 && (
                <div className="results-note">
                  Showing first 100 rows of {results.results.length} total results
                </div>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
};

export default CustomQuery;
