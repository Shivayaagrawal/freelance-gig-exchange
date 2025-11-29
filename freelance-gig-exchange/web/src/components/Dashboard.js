import React, { useState, useEffect } from 'react';
import { Users, Building2, Briefcase, CreditCard, TrendingUp, DollarSign } from 'lucide-react';
import axios from 'axios';

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
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchStats();
  }, []);

  const fetchStats = async () => {
    try {
      const response = await axios.get('/api/dashboard/stats');
      setStats(response.data);
    } catch (error) {
      // Demo data if API is not available
      setStats({
        freelancers: 50,
        clients: 30,
        gigs: 100,
        applications: 200,
        contracts: 45,
        payments: 80,
        totalRevenue: 8500000,
        avgRating: 4.2
      });
    } finally {
      setLoading(false);
    }
  };

  const statCards = [
    {
      title: 'Total Freelancers',
      value: stats.freelancers,
      icon: Users,
      color: '#667eea',
      change: '+12%'
    },
    {
      title: 'Active Clients',
      value: stats.clients,
      icon: Building2,
      color: '#28a745',
      change: '+8%'
    },
    {
      title: 'Open Gigs',
      value: stats.gigs,
      icon: Briefcase,
      color: '#ffc107',
      change: '+15%'
    },
    {
      title: 'Applications',
      value: stats.applications,
      icon: TrendingUp,
      color: '#17a2b8',
      change: '+22%'
    },
    {
      title: 'Active Contracts',
      value: stats.contracts,
      icon: CreditCard,
      color: '#6f42c1',
      change: '+18%'
    },
    {
      title: 'Total Revenue',
      value: `₹${(stats.totalRevenue / 100000).toFixed(1)}L`,
      icon: DollarSign,
      color: '#fd7e14',
      change: '+25%'
    }
  ];

  if (loading) {
    return (
      <div className="loading">
        <div>Loading dashboard...</div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="dashboard-header">
        <h1>📊 Dashboard Overview</h1>
        <p>Welcome to Freelance Gig Exchange Network - Your comprehensive freelancing platform</p>
      </div>

      <div className="stats-grid">
        {statCards.map((card, index) => {
          const Icon = card.icon;
          return (
            <div key={index} className="stat-card">
              <div className="stat-icon" style={{ color: card.color }}>
                <Icon size={32} />
              </div>
              <div className="stat-number" style={{ color: card.color }}>
                {card.value}
              </div>
              <div className="stat-label">{card.title}</div>
              <div className="stat-change" style={{ color: card.color }}>
                {card.change}
              </div>
            </div>
          );
        })}
      </div>

      <div className="card">
        <h2>🎯 Quick Actions</h2>
        <div className="quick-actions">
          <button className="btn">View All Freelancers</button>
          <button className="btn">Browse Gigs</button>
          <button className="btn">Check Applications</button>
          <button className="btn">View Analytics</button>
        </div>
      </div>

      <div className="card">
        <h2>📈 Recent Activity</h2>
        <div className="activity-list">
          <div className="activity-item">
            <div className="activity-icon">👤</div>
            <div className="activity-content">
              <strong>Rohan Mehta</strong> applied for <strong>E-commerce Website Development</strong>
              <div className="activity-time">2 hours ago</div>
            </div>
          </div>
          <div className="activity-item">
            <div className="activity-icon">💼</div>
            <div className="activity-content">
              <strong>TCS Innovations</strong> posted a new gig: <strong>Data Analytics Dashboard</strong>
              <div className="activity-time">4 hours ago</div>
            </div>
          </div>
          <div className="activity-item">
            <div className="activity-icon">💰</div>
            <div className="activity-content">
              <strong>Payment of ₹140,000</strong> completed for <strong>E-commerce Website Development</strong>
              <div className="activity-time">6 hours ago</div>
            </div>
          </div>
          <div className="activity-item">
            <div className="activity-icon">⭐</div>
            <div className="activity-content">
              <strong>Priya Sharma</strong> received a 5-star rating for <strong>Data Analytics Dashboard</strong>
              <div className="activity-time">1 day ago</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;







