import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, Link, useLocation } from 'react-router-dom';
import { Users, Building2, Briefcase, FileText, FileCheck, CreditCard, BarChart3, Database, Home, Tag, MessageSquare, Star } from 'lucide-react';
import Dashboard from './components/Dashboard';
import Freelancers from './components/Freelancers';
import Clients from './components/Clients';
import Gigs from './components/Gigs';
import Applications from './components/Applications';
import Contracts from './components/Contracts';
import Payments from './components/Payments';
import Analytics from './components/Analytics';
import CustomQuery from './components/CustomQuery';
import DatabaseSchema from './components/DatabaseSchema';
import EnhancedERDiagram from './components/DrawnERDiagram';
import Skills from './components/Skills';
import Messages from './components/Messages';
import Reviews from './components/Reviews';
import './App.css';

function Navigation() {
  const location = useLocation();
  
  const navItems = [
    { path: '/', label: 'Dashboard', icon: Home },
    { path: '/freelancers', label: 'Freelancers', icon: Users },
    { path: '/clients', label: 'Clients', icon: Building2 },
    { path: '/gigs', label: 'Gigs', icon: Briefcase },
    { path: '/applications', label: 'Applications', icon: FileText },
    { path: '/contracts', label: 'Contracts', icon: FileCheck },
    { path: '/payments', label: 'Payments', icon: CreditCard },
    { path: '/skills', label: 'Skills', icon: Tag },
    { path: '/messages', label: 'Messages', icon: MessageSquare },
    { path: '/reviews', label: 'Reviews', icon: Star },
    { path: '/analytics', label: 'Analytics', icon: BarChart3 },
    { path: '/query', label: 'Custom Query', icon: Database },
    { path: '/schema', label: 'Database Schema', icon: Database },
    { path: '/enhanced-erd', label: 'Enhanced ER Diagram', icon: Database },
  ];

  return (
    <nav className="sidebar">
      <div className="sidebar-header">
        <h2>🚀 FGX</h2>
        <p>Freelance Gig Exchange</p>
      </div>
      <ul className="nav-list">
        {navItems.map((item) => {
          const Icon = item.icon;
          const isActive = location.pathname === item.path;
          return (
            <li key={item.path}>
              <Link 
                to={item.path} 
                className={`nav-link ${isActive ? 'active' : ''}`}
              >
                <Icon size={20} />
                <span>{item.label}</span>
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}

function App() {
  const [connectionStatus, setConnectionStatus] = useState('checking');

  useEffect(() => {
    // Check API connection
    fetch('/api/health')
      .then(response => {
        if (response.ok) {
          setConnectionStatus('connected');
        } else {
          setConnectionStatus('disconnected');
        }
      })
      .catch(() => {
        setConnectionStatus('disconnected');
      });
  }, []);

  return (
    <Router>
      <div className="app">
        <Navigation />
        <main className="main-content">
          <header className="header">
            <h1>Freelance Gig Exchange Network</h1>
            <div className="connection-status">
              {connectionStatus === 'connected' && (
                <span className="status connected">🟢 Connected</span>
              )}
              {connectionStatus === 'disconnected' && (
                <span className="status disconnected">🔴 Demo Mode</span>
              )}
              {connectionStatus === 'checking' && (
                <span className="status checking">🟡 Connecting...</span>
              )}
            </div>
          </header>
          
          <div className="content">
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/freelancers" element={<Freelancers />} />
              <Route path="/clients" element={<Clients />} />
              <Route path="/gigs" element={<Gigs />} />
              <Route path="/applications" element={<Applications />} />
              <Route path="/contracts" element={<Contracts />} />
              <Route path="/payments" element={<Payments />} />
              <Route path="/skills" element={<Skills />} />
              <Route path="/messages" element={<Messages />} />
              <Route path="/reviews" element={<Reviews />} />
              <Route path="/analytics" element={<Analytics />} />
              <Route path="/query" element={<CustomQuery />} />
              <Route path="/schema" element={<DatabaseSchema />} />
              <Route path="/enhanced-erd" element={<EnhancedERDiagram />} />
            </Routes>
          </div>
        </main>
      </div>
    </Router>
  );
}

export default App;
