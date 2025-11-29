import React, { useState, useEffect } from 'react';
import { FileText, User, Briefcase, DollarSign, Calendar, CheckCircle, Clock, XCircle } from 'lucide-react';
import axios from 'axios';

const Applications = () => {
  const [applications, setApplications] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchApplications();
  }, []);

  const fetchApplications = async () => {
    try {
      const response = await axios.get('/api/applications');
      setApplications(response.data);
    } catch (error) {
      setApplications([
        { id: 1, freelancer_name: 'Rohan Mehta', gig_title: 'E-commerce Website Development', bid_amount: 140000, status: 'Approved', applied_date: '2024-01-16' },
        { id: 2, freelancer_name: 'Priya Sharma', gig_title: 'Data Analytics Dashboard', bid_amount: 110000, status: 'Approved', applied_date: '2024-01-21' },
        { id: 3, freelancer_name: 'Amit Patel', gig_title: 'Mobile App for Food Delivery', bid_amount: 190000, status: 'Pending', applied_date: '2024-01-26' },
        { id: 4, freelancer_name: 'Neha Verma', gig_title: 'UI/UX Design for Fintech App', bid_amount: 75000, status: 'Approved', applied_date: '2024-02-02' },
        { id: 5, freelancer_name: 'Rajesh Kumar', gig_title: 'DevOps Pipeline Setup', bid_amount: 95000, status: 'Pending', applied_date: '2024-02-06' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const getStatusIcon = (status) => {
    switch (status.toLowerCase()) {
      case 'approved': return <CheckCircle size={16} color="#28a745" />;
      case 'pending': return <Clock size={16} color="#ffc107" />;
      case 'rejected': return <XCircle size={16} color="#dc3545" />;
      default: return <Clock size={16} color="#6c757d" />;
    }
  };

  const getStatusColor = (status) => {
    switch (status.toLowerCase()) {
      case 'approved': return '#28a745';
      case 'pending': return '#ffc107';
      case 'rejected': return '#dc3545';
      default: return '#6c757d';
    }
  };

  if (loading) {
    return <div className="loading">Loading applications...</div>;
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>📝 Recent Applications</h1>
        <p>Track and manage freelancer applications</p>
      </div>

      <div className="card">
        <div className="applications-list">
          {applications.map((app) => (
            <div key={app.id} className="application-item">
              <div className="application-header">
                <div className="application-info">
                  <div className="freelancer-name">
                    <User size={16} />
                    <strong>{app.freelancer_name}</strong>
                  </div>
                  <div className="gig-title">
                    <Briefcase size={16} />
                    <span>{app.gig_title}</span>
                  </div>
                </div>
                <div className="application-status">
                  {getStatusIcon(app.status)}
                  <span 
                    className="status-text"
                    style={{ color: getStatusColor(app.status) }}
                  >
                    {app.status}
                  </span>
                </div>
              </div>

              <div className="application-details">
                <div className="detail-item">
                  <DollarSign size={16} />
                  <span>Bid: ₹{app.bid_amount.toLocaleString()}</span>
                </div>
                <div className="detail-item">
                  <Calendar size={16} />
                  <span>Applied: {new Date(app.applied_date).toLocaleDateString()}</span>
                </div>
              </div>

              <div className="application-actions">
                <button 
                  className="btn"
                  onClick={() => alert(`Viewing application details for ${app.freelancer_name}`)}
                >
                  View Details
                </button>
                {app.status === 'Pending' && (
                  <>
                    <button 
                      className="btn btn-success"
                      onClick={() => {
                        alert(`Approving application from ${app.freelancer_name} for ${app.gig_title}`);
                        // Update the application status in the state
                        setApplications(prev => 
                          prev.map(application => 
                            application.id === app.id 
                              ? { ...application, status: 'Approved' }
                              : application
                          )
                        );
                      }}
                    >
                      Approve
                    </button>
                    <button 
                      className="btn btn-danger"
                      onClick={() => {
                        alert(`Rejecting application from ${app.freelancer_name} for ${app.gig_title}`);
                        // Update the application status in the state
                        setApplications(prev => 
                          prev.map(application => 
                            application.id === app.id 
                              ? { ...application, status: 'Rejected' }
                              : application
                          )
                        );
                      }}
                    >
                      Reject
                    </button>
                  </>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Applications;
