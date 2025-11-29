import React, { useState, useEffect } from 'react';
import { DollarSign, CreditCard, CheckCircle, Clock, AlertCircle } from 'lucide-react';
import axios from 'axios';

const Payments = () => {
  const [payments, setPayments] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchPayments();
  }, []);

  const fetchPayments = async () => {
    try {
      const response = await axios.get('/api/payments');
      setPayments(response.data);
    } catch (error) {
      setPayments([
        { id: 1, amount: 50000, payment_date: '2024-01-15', method: 'UPI', status: 'Paid', contract_id: 1, client_name: 'TCS Innovations', freelancer_name: 'Rohan Mehta' },
        { id: 2, amount: 75000, payment_date: '2024-01-20', method: 'Bank Transfer', status: 'Paid', contract_id: 2, client_name: 'Infosys Labs', freelancer_name: 'Priya Sharma' },
        { id: 3, amount: 45000, payment_date: '2024-01-25', method: 'Paytm', status: 'Pending', contract_id: 3, client_name: 'Aditya Tech Solutions', freelancer_name: 'Amit Patel' },
        { id: 4, amount: 60000, payment_date: '2024-02-01', method: 'Credit Card', status: 'Paid', contract_id: 4, client_name: 'Wipro Digital', freelancer_name: 'Neha Verma' },
        { id: 5, amount: 35000, payment_date: '2024-02-05', method: 'UPI', status: 'Pending', contract_id: 5, client_name: 'HCL Technologies', freelancer_name: 'Rajesh Kumar' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const getStatusIcon = (status) => {
    switch (status.toLowerCase()) {
      case 'paid': return <CheckCircle size={16} color="#28a745" />;
      case 'pending': return <Clock size={16} color="#ffc107" />;
      default: return <AlertCircle size={16} color="#dc3545" />;
    }
  };

  const getStatusColor = (status) => {
    switch (status.toLowerCase()) {
      case 'paid': return '#28a745';
      case 'pending': return '#ffc107';
      default: return '#dc3545';
    }
  };

  const handleMarkAsPaid = (paymentId) => {
    setPayments(prevPayments => 
      prevPayments.map(payment => 
        payment.id === paymentId 
          ? { ...payment, status: 'Paid' }
          : payment
      )
    );
    
    // Find the payment to show confirmation
    const payment = payments.find(p => p.id === paymentId);
    if (payment) {
      alert(`✅ Payment marked as paid!\n\nAmount: ₹${payment.amount.toLocaleString()}\nFrom: ${payment.client_name}\nTo: ${payment.freelancer_name}\nMethod: ${payment.method}\n\nThis would update the database and send notifications to both parties.`);
    }
  };

  if (loading) {
    return <div className="loading">Loading payments...</div>;
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>💳 Payment Management</h1>
        <p>Track and manage payment transactions</p>
      </div>

      <div className="card">
        <div className="payments-list">
          {payments.map((payment) => (
            <div key={payment.id} className="payment-item">
              <div className="payment-header">
                <div className="payment-info">
                  <div className="payment-amount">
                    <DollarSign size={16} />
                    <strong>₹{payment.amount.toLocaleString()}</strong>
                  </div>
                  <div className="payment-method">
                    <CreditCard size={16} />
                    <span>{payment.method}</span>
                  </div>
                </div>
                <div className="payment-status">
                  {getStatusIcon(payment.status)}
                  <span 
                    className="status-text"
                    style={{ color: getStatusColor(payment.status) }}
                  >
                    {payment.status}
                  </span>
                </div>
              </div>

              <div className="payment-details">
                <div className="detail-item">
                  <span>Date: {new Date(payment.payment_date).toLocaleDateString()}</span>
                </div>
                <div className="detail-item">
                  <span>From: {payment.client_name}</span>
                </div>
                <div className="detail-item">
                  <span>To: {payment.freelancer_name}</span>
                </div>
                <div className="detail-item">
                  <span>Contract ID: #{payment.contract_id}</span>
                </div>
              </div>

              <div className="payment-actions">
                <button 
                  className="btn"
                  onClick={() => alert(`Viewing payment details for ₹${payment.amount.toLocaleString()}`)}
                >
                  View Details
                </button>
                {payment.status === 'Pending' && (
                  <button 
                    className="btn btn-success"
                    onClick={() => handleMarkAsPaid(payment.id)}
                  >
                    Mark as Paid
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

export default Payments;
