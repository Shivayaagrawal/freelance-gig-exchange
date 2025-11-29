import React, { useState, useEffect } from 'react';
import { FileCheck, User, Briefcase, DollarSign, Calendar, CheckCircle } from 'lucide-react';
import axios from 'axios';

const Contracts = () => {
  const [contracts, setContracts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchContracts();
  }, []);

  const fetchContracts = async () => {
    try {
      const response = await axios.get('/api/contracts');
      setContracts(response.data);
    } catch (error) {
      setContracts([
        { id: 1, freelancer_name: 'Rohan Mehta', gig_title: 'E-commerce Website Development', total_payment: 140000, work_status: 'Active', start_date: '2024-01-20' },
        { id: 2, freelancer_name: 'Priya Sharma', gig_title: 'Data Analytics Dashboard', total_payment: 110000, work_status: 'Active', start_date: '2024-01-25' },
        { id: 3, freelancer_name: 'Neha Verma', gig_title: 'UI/UX Design for Fintech App', total_payment: 75000, work_status: 'Active', start_date: '2024-02-05' },
        { id: 4, freelancer_name: 'Rajesh Kumar', gig_title: 'DevOps Pipeline Setup', total_payment: 95000, work_status: 'Active', start_date: '2024-02-10' },
        { id: 5, freelancer_name: 'Amit Patel', gig_title: 'Mobile App for Food Delivery', total_payment: 190000, work_status: 'Active', start_date: '2024-02-15' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const getStatusColor = (status) => {
    switch (status.toLowerCase()) {
      case 'active': return '#28a745';
      case 'completed': return '#17a2b8';
      case 'cancelled': return '#dc3545';
      default: return '#6c757d';
    }
  };

  if (loading) {
    return <div className="loading">Loading contracts...</div>;
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>📋 Active Contracts</h1>
        <p>Manage ongoing work contracts and agreements</p>
      </div>

      <div className="card">
        <div className="contracts-list">
          {contracts.map((contract) => (
            <div key={contract.id} className="contract-item">
              <div className="contract-header">
                <div className="contract-info">
                  <div className="freelancer-name">
                    <User size={16} />
                    <strong>{contract.freelancer_name}</strong>
                  </div>
                  <div className="gig-title">
                    <Briefcase size={16} />
                    <span>{contract.gig_title}</span>
                  </div>
                </div>
                <div className="contract-status">
                  <CheckCircle size={16} color={getStatusColor(contract.work_status)} />
                  <span 
                    className="status-text"
                    style={{ color: getStatusColor(contract.work_status) }}
                  >
                    {contract.work_status}
                  </span>
                </div>
              </div>

              <div className="contract-details">
                <div className="detail-item">
                  <DollarSign size={16} />
                  <span>Total: ₹{contract.total_payment.toLocaleString()}</span>
                </div>
                <div className="detail-item">
                  <Calendar size={16} />
                  <span>Started: {new Date(contract.start_date).toLocaleDateString()}</span>
                </div>
              </div>

              <div className="contract-actions">
                <button 
                  className="btn"
                  onClick={() => alert(`Viewing contract details for ${contract.freelancer_name}`)}
                >
                  View Contract
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`Tracking progress for contract with ${contract.freelancer_name}`)}
                >
                  Track Progress
                </button>
                {contract.work_status === 'Active' && (
                  <button 
                    className="btn btn-success"
                    onClick={() => alert(`Marking contract with ${contract.freelancer_name} as complete`)}
                  >
                    Mark Complete
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

export default Contracts;
