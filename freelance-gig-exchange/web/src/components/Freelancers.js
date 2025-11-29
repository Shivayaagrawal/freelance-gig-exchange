import React, { useState, useEffect } from 'react';
import { Star, MapPin, Award, Mail, Phone } from 'lucide-react';
import axios from 'axios';

const Freelancers = () => {
  const [freelancers, setFreelancers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState('all');

  useEffect(() => {
    fetchFreelancers();
  }, []);

  const fetchFreelancers = async () => {
    try {
      const response = await axios.get('/api/freelancers');
      setFreelancers(response.data);
    } catch (error) {
      // Demo data if API is not available
      setFreelancers([
        {
          id: 1,
          name: 'Rohan Mehta',
          email: 'rohan.mehta@gmail.com',
          phone: '9876543210',
          location: 'Delhi',
          experience_level: 'Expert',
          rating: 4.8,
          total_completed: 45,
          join_date: '2021-03-15'
        },
        {
          id: 2,
          name: 'Priya Sharma',
          email: 'priya.sharma@gmail.com',
          phone: '9988776655',
          location: 'Bangalore',
          experience_level: 'Expert',
          rating: 4.9,
          total_completed: 52,
          join_date: '2020-11-20'
        },
        {
          id: 3,
          name: 'Amit Patel',
          email: 'amit.patel@gmail.com',
          phone: '9123456789',
          location: 'Ahmedabad',
          experience_level: 'Intermediate',
          rating: 4.2,
          total_completed: 18,
          join_date: '2022-06-10'
        },
        {
          id: 4,
          name: 'Neha Verma',
          email: 'neha.verma@gmail.com',
          phone: '9812345678',
          location: 'Pune',
          experience_level: 'Beginner',
          rating: 4.0,
          total_completed: 8,
          join_date: '2023-01-15'
        },
        {
          id: 5,
          name: 'Rajesh Kumar',
          email: 'rajesh.kumar@gmail.com',
          phone: '9871234567',
          location: 'Mumbai',
          experience_level: 'Expert',
          rating: 4.7,
          total_completed: 38,
          join_date: '2021-08-22'
        }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const filteredFreelancers = freelancers.filter(freelancer => {
    if (filter === 'all') return true;
    return freelancer.experience_level.toLowerCase() === filter.toLowerCase();
  });

  const getExperienceColor = (level) => {
    switch (level.toLowerCase()) {
      case 'expert': return '#28a745';
      case 'intermediate': return '#ffc107';
      case 'beginner': return '#17a2b8';
      default: return '#6c757d';
    }
  };

  if (loading) {
    return (
      <div className="loading">
        <div>Loading freelancers...</div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>👥 Freelancers Directory</h1>
        <p>Browse and manage our talented freelancers</p>
      </div>

      <div className="card">
        <div className="filters">
          <div className="filter-group">
            <label>Filter by Experience:</label>
            <select 
              value={filter} 
              onChange={(e) => setFilter(e.target.value)}
              className="filter-select"
            >
              <option value="all">All Levels</option>
              <option value="expert">Expert</option>
              <option value="intermediate">Intermediate</option>
              <option value="beginner">Beginner</option>
            </select>
          </div>
          <div className="filter-stats">
            Showing {filteredFreelancers.length} of {freelancers.length} freelancers
          </div>
        </div>

        <div className="freelancers-grid">
          {filteredFreelancers.map((freelancer) => (
            <div key={freelancer.freelancer_id || freelancer.id} className="freelancer-card">
              <div className="freelancer-header">
                <div className="freelancer-avatar">
                  {freelancer.name.split(' ').map(n => n[0]).join('')}
                </div>
                <div className="freelancer-info">
                  <h3>{freelancer.name}</h3>
                  <div className="freelancer-rating">
                    <Star size={16} fill="#ffc107" color="#ffc107" />
                    <span>{freelancer.rating}</span>
                    <span className="rating-count">({freelancer.total_completed} projects)</span>
                  </div>
                </div>
              </div>

              <div className="freelancer-details">
                <div className="detail-item">
                  <MapPin size={16} />
                  <span>{freelancer.location}</span>
                </div>
                <div className="detail-item">
                  <Award size={16} />
                  <span 
                    className="experience-badge"
                    style={{ backgroundColor: getExperienceColor(freelancer.experience_level) }}
                  >
                    {freelancer.experience_level}
                  </span>
                </div>
                <div className="detail-item">
                  <Mail size={16} />
                  <span>{freelancer.email}</span>
                </div>
                <div className="detail-item">
                  <Phone size={16} />
                  <span>{freelancer.phone}</span>
                </div>
              </div>

              <div className="freelancer-stats">
                <div className="stat">
                  <div className="stat-value">{freelancer.total_completed}</div>
                  <div className="stat-label">Projects</div>
                </div>
                <div className="stat">
                  <div className="stat-value">{freelancer.rating}</div>
                  <div className="stat-label">Rating</div>
                </div>
                <div className="stat">
                  <div className="stat-value stat-value-date">
                    {new Date(freelancer.join_date).toLocaleDateString()}
                  </div>
                  <div className="stat-label">Joined</div>
                </div>
              </div>

              <div className="freelancer-actions">
                <button 
                  className="btn btn-primary"
                  onClick={() => alert(`📧 Contacting ${freelancer.name}...\n\nEmail: ${freelancer.email}\nPhone: ${freelancer.phone}\nLocation: ${freelancer.location}\n\nThis would open a contact form or messaging system.`)}
                >
                  Contact
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`🛠️ Skills for ${freelancer.name}:\n\nExperience Level: ${freelancer.experience_level}\nRating: ${freelancer.rating}/5\nCompleted Projects: ${freelancer.total_completed}\n\nThis would show detailed skills and certifications.`)}
                >
                  View Skills
                </button>
                <button 
                  className="btn btn-outline"
                  onClick={() => alert(`⭐ Reviews for ${freelancer.name}:\n\nOverall Rating: ${freelancer.rating}/5\nProjects Completed: ${freelancer.total_completed}\nMember Since: ${new Date(freelancer.join_date).toLocaleDateString()}\n\nThis would show detailed reviews and feedback from clients.`)}
                >
                  Reviews
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Freelancers;
