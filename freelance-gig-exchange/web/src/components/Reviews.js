import React, { useState, useEffect } from 'react';
import { Star, ThumbsUp, MessageSquare, User, Calendar } from 'lucide-react';

const Reviews = () => {
  const [reviews, setReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState('all');
  const [stats, setStats] = useState({});

  useEffect(() => {
    fetchReviews();
  }, []);

  const fetchReviews = async () => {
    try {
      const response = await fetch('/api/reviews');
      if (response.ok) {
        const data = await response.json();
        setReviews(data);
        calculateStats(data);
      } else {
        // Demo data if API fails
        const demoReviews = [
          {
            review_id: 1,
            contract_id: 1,
            rating: 5,
            comments: 'Excellent work! Rohan delivered the e-commerce project on time with great attention to detail. Highly recommended!',
            review_date: '2024-03-20',
            freelancer_name: 'Rohan Mehta',
            client_name: 'TCS Innovations',
            project_title: 'E-commerce Website Development'
          },
          {
            review_id: 2,
            contract_id: 2,
            rating: 4,
            comments: 'Good data analytics dashboard. Minor issues with data visualization but overall satisfied with the work.',
            review_date: '2024-02-28',
            freelancer_name: 'Amit Patel',
            client_name: 'Infosys Labs',
            project_title: 'Data Analytics Dashboard'
          },
          {
            review_id: 3,
            contract_id: 3,
            rating: 5,
            comments: 'Outstanding mobile app development. Great communication and technical expertise. Will definitely work together again.',
            review_date: '2024-04-26',
            freelancer_name: 'Rajesh Kumar',
            client_name: 'Aditya Tech Solutions',
            project_title: 'Mobile App for Food Delivery'
          },
          {
            review_id: 4,
            contract_id: 4,
            rating: 4,
            comments: 'Solid UI/UX design work. The fintech app interface is modern and user-friendly. Good collaboration throughout the project.',
            review_date: '2024-03-01',
            freelancer_name: 'Neha Verma',
            client_name: 'Wipro Digital',
            project_title: 'UI/UX Design for Fintech App'
          },
          {
            review_id: 5,
            contract_id: 5,
            rating: 5,
            comments: 'Exceptional DevOps work! The CI/CD pipeline setup was flawless and the cloud migration was seamless. Professional and reliable.',
            review_date: '2024-03-20',
            freelancer_name: 'Priya Sharma',
            client_name: 'HCL Technologies',
            project_title: 'DevOps Pipeline Setup'
          }
        ];
        setReviews(demoReviews);
        calculateStats(demoReviews);
      }
    } catch (error) {
      console.error('Error fetching reviews:', error);
      // Demo data fallback
      setReviews([
        {
          review_id: 1,
          contract_id: 1,
          rating: 5,
          comments: 'Excellent work! Rohan delivered the e-commerce project on time with great attention to detail. Highly recommended!',
          review_date: '2024-03-20',
          freelancer_name: 'Rohan Mehta',
          client_name: 'TCS Innovations',
          project_title: 'E-commerce Website Development'
        }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const calculateStats = (reviewsData) => {
    const totalReviews = reviewsData.length;
    const avgRating = reviewsData.reduce((sum, review) => sum + review.rating, 0) / totalReviews;
    const ratingDistribution = {
      5: reviewsData.filter(r => r.rating === 5).length,
      4: reviewsData.filter(r => r.rating === 4).length,
      3: reviewsData.filter(r => r.rating === 3).length,
      2: reviewsData.filter(r => r.rating === 2).length,
      1: reviewsData.filter(r => r.rating === 1).length
    };
    
    setStats({
      totalReviews,
      avgRating: avgRating.toFixed(1),
      ratingDistribution
    });
  };

  const getRatingStars = (rating) => {
    return Array.from({ length: 5 }, (_, i) => (
      <Star
        key={i}
        size={16}
        className={i < rating ? 'star-filled' : 'star-empty'}
      />
    ));
  };

  const getRatingColor = (rating) => {
    if (rating >= 4.5) return '#10b981';
    if (rating >= 4) return '#3b82f6';
    if (rating >= 3) return '#f59e0b';
    return '#ef4444';
  };

  const filteredReviews = filter === 'all' 
    ? reviews 
    : reviews.filter(review => review.rating >= parseInt(filter));

  if (loading) {
    return (
      <div className="page-header">
        <h1>Reviews</h1>
        <div className="loading">Loading reviews...</div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>⭐ Reviews & Ratings</h1>
        <p>Client feedback and project reviews</p>
      </div>

      {/* Stats Overview */}
      {stats.totalReviews > 0 && (
        <div className="card">
          <h3>Review Statistics</h3>
          <div className="stats-grid">
            <div className="stat-card">
              <div className="stat-value">{stats.totalReviews}</div>
              <div className="stat-label">Total Reviews</div>
            </div>
            <div className="stat-card">
              <div className="stat-value">{stats.avgRating}</div>
              <div className="stat-label">Average Rating</div>
            </div>
            <div className="stat-card">
              <div className="stat-value">{stats.ratingDistribution[5]}</div>
              <div className="stat-label">5-Star Reviews</div>
            </div>
          </div>
        </div>
      )}

      <div className="card">
        <div className="reviews-filters">
          <div className="filter-group">
            <label>Filter by Rating:</label>
            <select 
              value={filter} 
              onChange={(e) => setFilter(e.target.value)}
              className="filter-select"
            >
              <option value="all">All Reviews</option>
              <option value="5">5 Stars</option>
              <option value="4">4+ Stars</option>
              <option value="3">3+ Stars</option>
            </select>
          </div>
          <div className="filter-stats">
            <span>{filteredReviews.length} reviews</span>
          </div>
        </div>

        <div className="reviews-list">
          {filteredReviews.map((review) => (
            <div key={review.review_id} className="review-item">
              <div className="review-header">
                <div className="review-rating">
                  <div className="stars">
                    {getRatingStars(review.rating)}
                  </div>
                  <span 
                    className="rating-number"
                    style={{ color: getRatingColor(review.rating) }}
                  >
                    {review.rating}/5
                  </span>
                </div>
                <div className="review-date">
                  <Calendar size={14} />
                  {new Date(review.review_date).toLocaleDateString()}
                </div>
              </div>

              <div className="review-content">
                <div className="review-project">
                  <h4>{review.project_title}</h4>
                  <div className="review-participants">
                    <div className="participant">
                      <User size={14} />
                      <span><strong>Freelancer:</strong> {review.freelancer_name}</span>
                    </div>
                    <div className="participant">
                      <User size={14} />
                      <span><strong>Client:</strong> {review.client_name}</span>
                    </div>
                  </div>
                </div>

                <div className="review-comments">
                  <p>"{review.comments}"</p>
                </div>
              </div>

              <div className="review-actions">
                <button 
                  className="btn btn-primary"
                  onClick={() => alert(`Viewing profile of ${review.freelancer_name}...`)}
                >
                  View Freelancer
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`Viewing profile of ${review.client_name}...`)}
                >
                  View Client
                </button>
                <button 
                  className="btn btn-outline"
                  onClick={() => alert(`Viewing project details...`)}
                >
                  View Project
                </button>
                <button 
                  className="btn btn-outline"
                  onClick={() => alert(`Liking this review...`)}
                >
                  <ThumbsUp size={16} />
                  Like
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Reviews;
