import React, { useState, useEffect } from 'react';
import { Briefcase, DollarSign, Building2, Calendar, CheckCircle } from 'lucide-react';
import axios from 'axios';

const Gigs = () => {
  const [gigs, setGigs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchGigs();
  }, []);

  const fetchGigs = async () => {
    try {
      const response = await axios.get('/api/gigs');
      setGigs(response.data);
    } catch (error) {
      setGigs([
        { id: 1, title: 'E-commerce Website Development', description: 'Build a complete e-commerce platform with payment gateway integration', budget: 150000, client_name: 'TCS Innovations', posted_date: '2024-01-15', status: 'Open' },
        { id: 2, title: 'Data Analytics Dashboard', description: 'Create interactive dashboard for business intelligence using Python and React', budget: 120000, client_name: 'Infosys Labs', posted_date: '2024-01-20', status: 'Open' },
        { id: 3, title: 'Mobile App for Food Delivery', description: 'Develop iOS and Android app for food delivery service with real-time tracking', budget: 200000, client_name: 'Aditya Tech Solutions', posted_date: '2024-01-25', status: 'Open' },
        { id: 4, title: 'UI/UX Design for Fintech App', description: 'Design modern and intuitive interface for digital banking application', budget: 80000, client_name: 'Wipro Digital', posted_date: '2024-02-01', status: 'Open' },
        { id: 5, title: 'DevOps Pipeline Setup', description: 'Set up CI/CD pipeline using AWS and Docker for microservices architecture', budget: 100000, client_name: 'HCL Technologies', posted_date: '2024-02-05', status: 'Open' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const getStatusColor = (status) => {
    switch (status.toLowerCase()) {
      case 'open': return '#28a745';
      case 'in progress': return '#ffc107';
      case 'completed': return '#17a2b8';
      case 'cancelled': return '#dc3545';
      default: return '#6c757d';
    }
  };

  if (loading) {
    return <div className="loading">Loading gigs...</div>;
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>💼 Available Gigs</h1>
        <p>Browse and apply for freelance opportunities</p>
      </div>

      <div className="card">
        <div className="gigs-list">
          {gigs.map((gig) => (
            <div key={gig.id} className="gig-item">
              <div className="gig-header">
                <div className="gig-info">
                  <div className="gig-title">
                    <Briefcase size={16} />
                    <strong>{gig.title}</strong>
                  </div>
                  <div className="client-name">
                    <Building2 size={16} />
                    <span>{gig.client_name}</span>
                  </div>
                </div>
                <div className="gig-status">
                  <CheckCircle size={16} color={getStatusColor(gig.status)} />
                  <span 
                    className="status-text"
                    style={{ color: getStatusColor(gig.status) }}
                  >
                    {gig.status}
                  </span>
                </div>
              </div>

              <div className="gig-details">
                <div className="detail-item">
                  <DollarSign size={16} />
                  <span>Budget: ₹{gig.budget.toLocaleString()}</span>
                </div>
                <div className="detail-item">
                  <Calendar size={16} />
                  <span>Posted: {new Date(gig.posted_date).toLocaleDateString()}</span>
                </div>
              </div>

              <div className="gig-actions">
                <button 
                  className="btn"
                  onClick={() => alert(`📝 Applying for gig: ${gig.title}\n\nBudget: ₹${gig.budget.toLocaleString()}\nClient: ${gig.client_name}\nStatus: ${gig.status}\nPosted: ${new Date(gig.posted_date).toLocaleDateString()}\n\nThis would open an application form where you can submit your proposal and bid amount.`)}
                >
                  Apply Now
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`🔍 Gig Details: ${gig.title}\n\nDescription: ${gig.description}\nBudget: ₹${gig.budget.toLocaleString()}\nClient: ${gig.client_name}\nStatus: ${gig.status}\nPosted: ${new Date(gig.posted_date).toLocaleDateString()}\n\nThis would show full gig details, requirements, and application history.`)}
                >
                  View Details
                </button>
                {gig.status === 'Open' && (
                  <button 
                    className="btn btn-success"
                    onClick={() => alert(`💬 Contact Client: ${gig.client_name}\n\nGig: ${gig.title}\nBudget: ₹${gig.budget.toLocaleString()}\n\nThis would open a messaging system to contact the client directly about this gig.`)}
                  >
                    Contact Client
                  </button>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Gigs;