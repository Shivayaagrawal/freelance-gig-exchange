import React, { useState, useEffect } from 'react';
import { Building2, Mail, MapPin, Calendar, Users } from 'lucide-react';
import axios from 'axios';

const Clients = () => {
  const [clients, setClients] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchClients();
  }, []);

  const fetchClients = async () => {
    try {
      const response = await axios.get('/api/clients');
      setClients(response.data);
    } catch (error) {
      // Demo data if API is not available
      setClients([
        {
          id: 1,
          name: 'TCS Innovations',
          email: 'contact@tcs.com',
          organization: 'Tata Consultancy Services',
          location: 'Mumbai',
          member_since: '2021-08-01'
        },
        {
          id: 2,
          name: 'Infosys Labs',
          email: 'hr@infosys.com',
          organization: 'Infosys Limited',
          location: 'Bangalore',
          member_since: '2022-05-15'
        },
        {
          id: 3,
          name: 'Aditya Tech Solutions',
          email: 'support@adityatech.in',
          organization: 'Aditya Technologies',
          location: 'Noida',
          member_since: '2024-02-09'
        },
        {
          id: 4,
          name: 'Wipro Digital',
          email: 'projects@wipro.com',
          organization: 'Wipro Limited',
          location: 'Pune',
          member_since: '2021-12-20'
        },
        {
          id: 5,
          name: 'HCL Technologies',
          email: 'business@hcl.com',
          organization: 'HCL Tech',
          location: 'Chennai',
          member_since: '2022-03-10'
        }
      ]);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="loading">
        <div>Loading clients...</div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>🏢 Clients Directory</h1>
        <p>Manage and view all client organizations</p>
      </div>

      <div className="card">
        <div className="clients-grid">
          {clients.map((client) => (
            <div key={client.id} className="client-card">
              <div className="client-header">
                <div className="client-avatar">
                  <Building2 size={24} />
                </div>
                <div className="client-info">
                  <h3>{client.name}</h3>
                  <div className="client-organization">{client.organization}</div>
                </div>
              </div>

              <div className="client-details">
                <div className="detail-item">
                  <Mail size={16} />
                  <span>{client.email}</span>
                </div>
                <div className="detail-item">
                  <MapPin size={16} />
                  <span>{client.location}</span>
                </div>
                <div className="detail-item">
                  <Calendar size={16} />
                  <span>Member since {new Date(client.member_since).toLocaleDateString()}</span>
                </div>
              </div>

              <div className="client-stats">
                <div className="stat">
                  <div className="stat-value">12</div>
                  <div className="stat-label">Active Gigs</div>
                </div>
                <div className="stat">
                  <div className="stat-value stat-value-spent">₹2.5L</div>
                  <div className="stat-label">Total Spent</div>
                </div>
                <div className="stat">
                  <div className="stat-value">4.8</div>
                  <div className="stat-label">Avg Rating</div>
                </div>
              </div>

              <div className="client-actions">
                <button 
                  className="btn btn-primary"
                  onClick={() => alert(`Contacting ${client.name} at ${client.email}`)}
                >
                  Contact
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`Viewing gigs posted by ${client.name}...`)}
                >
                  View Gigs
                </button>
                <button 
                  className="btn btn-outline"
                  onClick={() => alert(`Viewing messages with ${client.name}...`)}
                >
                  Messages
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Clients;
