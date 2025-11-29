import React, { useState, useEffect } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import { Users, Briefcase, DollarSign, Star } from 'lucide-react';
import axios from 'axios';

const Analytics = () => {
  const [analytics, setAnalytics] = useState({
    freelancer_stats: {
      total_freelancers: 50,
      avg_rating: 4.2,
      expert_count: 15,
      intermediate_count: 20,
      beginner_count: 15,
      top_skills: ['Python', 'JavaScript', 'React', 'Java', 'AWS', 'MySQL', 'Node.js', 'Flask']
    },
    gig_stats: {
      total_gigs: 100,
      open_gigs: 25,
      average_budget: 15000
    },
    payment_stats: {
      total_amount: 5000000,
      pending_count: 10,
      average_payment: 5000
    },
    category_demand: [
      { category_name: 'Web Development', count: 25 },
      { category_name: 'Mobile Apps', count: 20 },
      { category_name: 'Data Science', count: 15 },
      { category_name: 'UI/UX Design', count: 18 },
      { category_name: 'DevOps', count: 12 },
      { category_name: 'Machine Learning', count: 10 }
    ],
    monthly_revenue: [
      { month: 'Jan', revenue: 45000 },
      { month: 'Feb', revenue: 52000 },
      { month: 'Mar', revenue: 48000 },
      { month: 'Apr', revenue: 61000 },
      { month: 'May', revenue: 55000 },
      { month: 'Jun', revenue: 67000 }
    ],
    top_freelancers: [
      { name: 'Priya Sharma', rating: 4.9, total_completed: 52 },
      { name: 'Rohan Mehta', rating: 4.8, total_completed: 45 },
      { name: 'Rajesh Kumar', rating: 4.7, total_completed: 38 },
      { name: 'Vikram Joshi', rating: 4.6, total_completed: 41 },
      { name: 'Kavya Nair', rating: 4.4, total_completed: 25 }
    ],
    beginner_analytics: {
      total_beginners: 15,
      avg_rating: 3.8,
      total_projects: 45,
      success_rate: 75,
      top_skills: ['HTML/CSS', 'JavaScript', 'Python', 'React', 'MySQL']
    }
  });
  const [loading, setLoading] = useState(false);
  const [selectedView, setSelectedView] = useState('overview');
  const [selectedPeriod, setSelectedPeriod] = useState('6months');

  useEffect(() => {
    fetchAnalytics();
  }, []);

  const fetchAnalytics = async () => {
    try {
      const response = await axios.get('/api/analytics');
      if (response.data && Object.keys(response.data).length > 0) {
        setAnalytics(response.data);
      }
    } catch (error) {
      console.error('Error fetching analytics:', error);
      // Keep default data - no need to set it again
    } finally {
      setLoading(false);
    }
  };

  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8'];

  if (loading) {
    return (
      <div className="container">
        <div className="page-header">
          <h1>📊 Analytics Dashboard</h1>
          <p>Updating analytics data...</p>
        </div>
        <div className="card">
          <div className="loading">Updating analytics...</div>
        </div>
      </div>
    );
  }

  const renderAnalyticsContent = () => {
    switch (selectedView) {
      case 'overview':
        return renderOverview();
      case 'freelancers':
        return renderFreelancerAnalytics();
      case 'beginners':
        return renderBeginnerAnalytics();
      case 'top-performers':
        return renderTopPerformers();
      default:
        return renderOverview();
    }
  };

  const renderOverview = () => (
    <>
      {/* Key Metrics */}
      <div className="metrics-grid">
        <div className="metric-card">
          <Users size={24} />
          <div className="metric-content">
            <h3>{analytics.freelancer_stats?.total_freelancers || 0}</h3>
            <p>Total Freelancers</p>
          </div>
        </div>
        <div className="metric-card">
          <Briefcase size={24} />
          <div className="metric-content">
            <h3>{analytics.gig_stats?.total_gigs || 0}</h3>
            <p>Total Gigs</p>
          </div>
        </div>
        <div className="metric-card">
          <DollarSign size={24} />
          <div className="metric-content">
            <h3>₹{((analytics.payment_stats?.total_amount || 0) / 1000000).toFixed(1)}M</h3>
            <p>Total Revenue</p>
          </div>
        </div>
        <div className="metric-card">
          <Star size={24} />
          <div className="metric-content">
            <h3>{analytics.freelancer_stats?.avg_rating || 0}</h3>
            <p>Avg Rating</p>
          </div>
        </div>
      </div>

      {/* Charts Row */}
      <div className="charts-row">
        <div className="chart-card">
          <h3>Monthly Revenue</h3>
          
          {/* Debug Info */}
          <div style={{ 
            padding: '10px', 
            backgroundColor: '#e8f4fd', 
            border: '1px solid #2196f3', 
            borderRadius: '4px',
            marginBottom: '15px',
            fontSize: '12px'
          }}>
            <strong>Debug Info:</strong><br/>
            Analytics object exists: {analytics ? 'Yes' : 'No'}<br/>
            Monthly revenue exists: {analytics.monthly_revenue ? 'Yes' : 'No'}<br/>
            Monthly revenue length: {analytics.monthly_revenue ? analytics.monthly_revenue.length : 'N/A'}<br/>
            First item: {analytics.monthly_revenue && analytics.monthly_revenue[0] ? JSON.stringify(analytics.monthly_revenue[0]) : 'N/A'}
          </div>
          
          {/* Simple Revenue Table */}
          <div style={{ 
            width: '100%', 
            backgroundColor: '#ffffff', 
            border: '2px solid #28a745', 
            borderRadius: '8px', 
            padding: '20px',
            marginBottom: '15px'
          }}>
            <h4 style={{ margin: '0 0 15px 0', color: '#28a745', textAlign: 'center' }}>
              📊 Monthly Revenue Data
            </h4>
            
            <table style={{ 
              width: '100%', 
              borderCollapse: 'collapse',
              fontSize: '14px',
              fontFamily: 'Arial, sans-serif'
            }}>
              <thead>
                <tr style={{ backgroundColor: '#f8f9fa' }}>
                  <th style={{ 
                    padding: '12px', 
                    border: '1px solid #dee2e6', 
                    textAlign: 'left',
                    fontWeight: 'bold',
                    color: '#495057'
                  }}>Month</th>
                  <th style={{ 
                    padding: '12px', 
                    border: '1px solid #dee2e6', 
                    textAlign: 'right',
                    fontWeight: 'bold',
                    color: '#495057'
                  }}>Revenue</th>
                  <th style={{ 
                    padding: '12px', 
                    border: '1px solid #dee2e6', 
                    textAlign: 'center',
                    fontWeight: 'bold',
                    color: '#495057'
                  }}>Visual</th>
                </tr>
              </thead>
              <tbody>
                {analytics.monthly_revenue && analytics.monthly_revenue.map((item, index) => (
                  <tr key={index} style={{ 
                    backgroundColor: index % 2 === 0 ? '#ffffff' : '#f8f9fa'
                  }}>
                    <td style={{ 
                      padding: '12px', 
                      border: '1px solid #dee2e6',
                      fontWeight: '500',
                      color: '#2c3e50'
                    }}>
                      {item.month}
                    </td>
                    <td style={{ 
                      padding: '12px', 
                      border: '1px solid #dee2e6',
                      textAlign: 'right',
                      fontWeight: '600',
                      color: '#28a745',
                      fontSize: '15px'
                    }}>
                      ₹{item.revenue.toLocaleString()}
                    </td>
                    <td style={{ 
                      padding: '12px', 
                      border: '1px solid #dee2e6',
                      textAlign: 'center'
                    }}>
                      <div style={{
                        width: '100%',
                        height: '20px',
                        backgroundColor: '#e9ecef',
                        borderRadius: '10px',
                        position: 'relative',
                        overflow: 'hidden'
                      }}>
                        <div style={{
                          width: `${(item.revenue / Math.max(...analytics.monthly_revenue.map(d => d.revenue))) * 100}%`,
                          height: '100%',
                          backgroundColor: index === 0 ? '#ff6b6b' : 
                                          index === 1 ? '#4ecdc4' : 
                                          index === 2 ? '#45b7d1' : 
                                          index === 3 ? '#96ceb4' : 
                                          index === 4 ? '#feca57' : '#ff9ff3',
                          borderRadius: '10px',
                          transition: 'width 0.3s ease'
                        }}></div>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
            
            <div style={{ 
              marginTop: '15px', 
              padding: '10px', 
              backgroundColor: '#d4edda', 
              border: '1px solid #c3e6cb',
              borderRadius: '4px',
              fontSize: '12px',
              color: '#155724',
              textAlign: 'center'
            }}>
              <strong>✅ REVENUE TABLE DISPLAYED!</strong><br/>
              Total Revenue: ₹{analytics.monthly_revenue ? analytics.monthly_revenue.reduce((sum, item) => sum + item.revenue, 0).toLocaleString() : '0'}<br/>
              Average Monthly: ₹{analytics.monthly_revenue ? Math.round(analytics.monthly_revenue.reduce((sum, item) => sum + item.revenue, 0) / analytics.monthly_revenue.length).toLocaleString() : '0'}
            </div>
          </div>
        </div>

        <div className="chart-card">
          <h3>Category Demand</h3>
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={analytics.category_demand || []}
                cx="50%"
                cy="50%"
                labelLine={false}
                label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                outerRadius={80}
                fill="#8884d8"
                dataKey="count"
              >
                {(analytics.category_demand || []).map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </div>
    </>
  );

  const renderFreelancerAnalytics = () => (
    <div className="freelancer-analytics">
      <div className="analytics-section">
        <h3>Freelancer Distribution</h3>
        <div className="distribution-grid">
          <div className="distribution-card">
            <h4>Beginners</h4>
            <div className="distribution-value">{analytics.freelancer_stats?.beginner_count || 0}</div>
            <div className="distribution-percentage">
              {Math.round(((analytics.freelancer_stats?.beginner_count || 0) / (analytics.freelancer_stats?.total_freelancers || 1)) * 100)}%
            </div>
          </div>
          <div className="distribution-card">
            <h4>Intermediate</h4>
            <div className="distribution-value">{analytics.freelancer_stats?.intermediate_count || 0}</div>
            <div className="distribution-percentage">
              {Math.round(((analytics.freelancer_stats?.intermediate_count || 0) / (analytics.freelancer_stats?.total_freelancers || 1)) * 100)}%
            </div>
          </div>
          <div className="distribution-card">
            <h4>Experts</h4>
            <div className="distribution-value">{analytics.freelancer_stats?.expert_count || 0}</div>
            <div className="distribution-percentage">
              {Math.round(((analytics.freelancer_stats?.expert_count || 0) / (analytics.freelancer_stats?.total_freelancers || 1)) * 100)}%
            </div>
          </div>
        </div>
      </div>

      <div className="analytics-section">
        <h3>Top Skills in Demand</h3>
        <div className="skills-list">
          {(analytics.freelancer_stats?.top_skills || []).map((skill, index) => (
            <div key={skill} className="skill-item">
              <span className="skill-rank">#{index + 1}</span>
              <span className="skill-name">{skill}</span>
              <div className="skill-bar">
                <div 
                  className="skill-progress" 
                  style={{ width: `${100 - (index * 15)}%` }}
                ></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderBeginnerAnalytics = () => (
    <div className="beginner-analytics">
      <div className="analytics-section">
        <h3>Beginner Freelancer Insights</h3>
        <div className="beginner-metrics">
          <div className="metric-card">
            <Users size={24} />
            <div className="metric-content">
              <h3>{analytics.beginner_analytics?.total_beginners || 0}</h3>
              <p>Total Beginners</p>
            </div>
          </div>
          <div className="metric-card">
            <Star size={24} />
            <div className="metric-content">
              <h3>{analytics.beginner_analytics?.avg_rating || 0}</h3>
              <p>Avg Rating</p>
            </div>
          </div>
          <div className="metric-card">
            <Briefcase size={24} />
            <div className="metric-content">
              <h3>{analytics.beginner_analytics?.total_projects || 0}</h3>
              <p>Total Projects</p>
            </div>
          </div>
          <div className="metric-card">
            <DollarSign size={24} />
            <div className="metric-content">
              <h3>{analytics.beginner_analytics?.success_rate || 0}%</h3>
              <p>Success Rate</p>
            </div>
          </div>
        </div>
      </div>

      <div className="analytics-section">
        <h3>Top Skills for Beginners</h3>
        <div className="skills-list">
          {(analytics.beginner_analytics?.top_skills || []).map((skill, index) => (
            <div key={skill} className="skill-item">
              <span className="skill-rank">#{index + 1}</span>
              <span className="skill-name">{skill}</span>
              <div className="skill-bar">
                <div 
                  className="skill-progress" 
                  style={{ width: `${100 - (index * 15)}%` }}
                ></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderTopPerformers = () => (
    <div className="top-performers">
      <div className="analytics-section">
        <h3>Top Performing Freelancers</h3>
        <div className="performers-list">
          {(analytics.top_freelancers || []).map((freelancer, index) => (
            <div key={freelancer.name} className="performer-card">
              <div className="performer-rank">#{index + 1}</div>
              <div className="performer-info">
                <h4>{freelancer.name}</h4>
                <div className="performer-stats">
                  <div className="stat">
                    <Star size={16} color="#ffc107" />
                    <span>{freelancer.rating}</span>
                  </div>
                  <div className="stat">
                    <Briefcase size={16} />
                    <span>{freelancer.projects} projects</span>
                  </div>
                  <div className="stat">
                    <DollarSign size={16} />
                    <span>₹{(freelancer.earnings / 100000).toFixed(1)}L</span>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  return (
    <div className="container">
      <div className="page-header">
        <h1>📊 Analytics Dashboard</h1>
        <p>Comprehensive insights and performance metrics</p>
        
        <div className="analytics-controls">
          <div className="view-selector">
            <label>View:</label>
            <select 
              value={selectedView} 
              onChange={(e) => setSelectedView(e.target.value)}
              className="analytics-select"
            >
              <option value="overview">Overview</option>
              <option value="freelancers">Freelancer Analytics</option>
              <option value="beginners">Beginner Analytics</option>
              <option value="top-performers">Top Performers</option>
            </select>
          </div>
          
          <div className="period-selector">
            <label>Period:</label>
            <select 
              value={selectedPeriod} 
              onChange={(e) => setSelectedPeriod(e.target.value)}
              className="analytics-select"
            >
              <option value="1month">Last Month</option>
              <option value="3months">Last 3 Months</option>
              <option value="6months">Last 6 Months</option>
              <option value="1year">Last Year</option>
            </select>
          </div>
        </div>
      </div>

      <div className="analytics-grid">
        {renderAnalyticsContent()}
      </div>
    </div>
  );
};

export default Analytics;
