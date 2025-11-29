import React, { useState, useEffect } from 'react';
import { Table, Key, Link, Eye, EyeOff } from 'lucide-react';

const DatabaseSchema = () => {
  const [selectedTable, setSelectedTable] = useState(null);
  const [showRelationships, setShowRelationships] = useState(true);
  const [schema, setSchema] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchSchema();
  }, []);

  const fetchSchema = async () => {
    try {
      const response = await fetch('/api/schema');
      if (response.ok) {
        const data = await response.json();
        setSchema(data);
      } else {
        // Fallback to demo data
        setSchema(databaseSchema);
      }
    } catch (error) {
      console.error('Error fetching schema:', error);
      setSchema(databaseSchema);
    } finally {
      setLoading(false);
    }
  };

  const databaseSchema = {
    tables: [
      {
        name: 'freelancers',
        displayName: 'Freelancers',
        color: '#667eea',
        attributes: [
          { name: 'freelancer_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'name', type: 'VARCHAR(100)', key: '', nullable: true },
          { name: 'email', type: 'VARCHAR(100)', key: '', nullable: true },
          { name: 'phone', type: 'VARCHAR(15)', key: '', nullable: true },
          { name: 'location', type: 'VARCHAR(50)', key: '', nullable: true },
          { name: 'experience_level', type: 'ENUM', key: '', nullable: true },
          { name: 'rating', type: 'DECIMAL(2,1)', key: '', nullable: true },
          { name: 'total_completed', type: 'INT', key: '', nullable: true },
          { name: 'join_date', type: 'DATE', key: '', nullable: true }
        ],
        relationships: [
          { target: 'applications', type: 'one-to-many', field: 'freelancer_id' },
          { target: 'freelancer_skills', type: 'one-to-many', field: 'freelancer_id' },
          { target: 'messages', type: 'one-to-many', field: 'sender_id' }
        ]
      },
      {
        name: 'clients',
        displayName: 'Clients',
        color: '#28a745',
        attributes: [
          { name: 'client_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'name', type: 'VARCHAR(100)', key: '', nullable: true },
          { name: 'email', type: 'VARCHAR(100)', key: '', nullable: true },
          { name: 'organization', type: 'VARCHAR(100)', key: '', nullable: true },
          { name: 'location', type: 'VARCHAR(50)', key: '', nullable: true },
          { name: 'member_since', type: 'DATE', key: '', nullable: true }
        ],
        relationships: [
          { target: 'gigs', type: 'one-to-many', field: 'client_id' },
          { target: 'messages', type: 'one-to-many', field: 'sender_id' }
        ]
      },
      {
        name: 'categories',
        displayName: 'Categories',
        color: '#ffc107',
        attributes: [
          { name: 'category_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'category_name', type: 'VARCHAR(50)', key: '', nullable: true }
        ],
        relationships: [
          { target: 'gigs', type: 'one-to-many', field: 'category_id' }
        ]
      },
      {
        name: 'skills',
        displayName: 'Skills',
        color: '#17a2b8',
        attributes: [
          { name: 'skill_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'skill_name', type: 'VARCHAR(50)', key: '', nullable: true }
        ],
        relationships: [
          { target: 'freelancer_skills', type: 'one-to-many', field: 'skill_id' }
        ]
      },
      {
        name: 'freelancer_skills',
        displayName: 'Freelancer Skills',
        color: '#6f42c1',
        attributes: [
          { name: 'freelancer_id', type: 'INT', key: 'FK', nullable: false },
          { name: 'skill_id', type: 'INT', key: 'FK', nullable: false }
        ],
        relationships: [
          { target: 'freelancers', type: 'many-to-one', field: 'freelancer_id' },
          { target: 'skills', type: 'many-to-one', field: 'skill_id' }
        ]
      },
      {
        name: 'gigs',
        displayName: 'Gigs',
        color: '#fd7e14',
        attributes: [
          { name: 'gig_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'client_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'category_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'title', type: 'VARCHAR(150)', key: '', nullable: true },
          { name: 'description', type: 'TEXT', key: '', nullable: true },
          { name: 'budget', type: 'DECIMAL(10,2)', key: '', nullable: true },
          { name: 'posted_date', type: 'DATE', key: '', nullable: true },
          { name: 'status', type: 'ENUM', key: '', nullable: true }
        ],
        relationships: [
          { target: 'clients', type: 'many-to-one', field: 'client_id' },
          { target: 'categories', type: 'many-to-one', field: 'category_id' },
          { target: 'applications', type: 'one-to-many', field: 'gig_id' }
        ]
      },
      {
        name: 'applications',
        displayName: 'Applications',
        color: '#e83e8c',
        attributes: [
          { name: 'application_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'gig_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'freelancer_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'proposal_text', type: 'TEXT', key: '', nullable: true },
          { name: 'bid_amount', type: 'DECIMAL(10,2)', key: '', nullable: true },
          { name: 'applied_date', type: 'DATE', key: '', nullable: true },
          { name: 'status', type: 'ENUM', key: '', nullable: true }
        ],
        relationships: [
          { target: 'gigs', type: 'many-to-one', field: 'gig_id' },
          { target: 'freelancers', type: 'many-to-one', field: 'freelancer_id' },
          { target: 'contracts', type: 'one-to-one', field: 'application_id' }
        ]
      },
      {
        name: 'contracts',
        displayName: 'Contracts',
        color: '#20c997',
        attributes: [
          { name: 'contract_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'application_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'start_date', type: 'DATE', key: '', nullable: true },
          { name: 'end_date', type: 'DATE', key: '', nullable: true },
          { name: 'work_status', type: 'ENUM', key: '', nullable: true },
          { name: 'total_payment', type: 'DECIMAL(10,2)', key: '', nullable: true }
        ],
        relationships: [
          { target: 'applications', type: 'one-to-one', field: 'application_id' },
          { target: 'payments', type: 'one-to-many', field: 'contract_id' },
          { target: 'reviews', type: 'one-to-many', field: 'contract_id' }
        ]
      },
      {
        name: 'payments',
        displayName: 'Payments',
        color: '#dc3545',
        attributes: [
          { name: 'payment_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'contract_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'amount', type: 'DECIMAL(10,2)', key: '', nullable: true },
          { name: 'payment_date', type: 'DATE', key: '', nullable: true },
          { name: 'method', type: 'ENUM', key: '', nullable: true },
          { name: 'status', type: 'ENUM', key: '', nullable: true }
        ],
        relationships: [
          { target: 'contracts', type: 'many-to-one', field: 'contract_id' }
        ]
      },
      {
        name: 'reviews',
        displayName: 'Reviews',
        color: '#6c757d',
        attributes: [
          { name: 'review_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'contract_id', type: 'INT', key: 'FK', nullable: true },
          { name: 'rating', type: 'INT', key: '', nullable: true },
          { name: 'comments', type: 'TEXT', key: '', nullable: true },
          { name: 'review_date', type: 'DATE', key: '', nullable: true }
        ],
        relationships: [
          { target: 'contracts', type: 'many-to-one', field: 'contract_id' }
        ]
      },
      {
        name: 'messages',
        displayName: 'Messages',
        color: '#343a40',
        attributes: [
          { name: 'message_id', type: 'INT', key: 'PK', nullable: false },
          { name: 'sender_type', type: 'ENUM', key: '', nullable: true },
          { name: 'sender_id', type: 'INT', key: '', nullable: true },
          { name: 'receiver_id', type: 'INT', key: '', nullable: true },
          { name: 'message_text', type: 'TEXT', key: '', nullable: true },
          { name: 'sent_at', type: 'DATETIME', key: '', nullable: true }
        ],
        relationships: []
      }
    ]
  };

  const getKeyIcon = (key) => {
    switch (key) {
      case 'PK': return <Key size={12} color="#dc3545" />;
      case 'FK': return <Link size={12} color="#007bff" />;
      default: return null;
    }
  };

  const getRelationshipIcon = (type) => {
    switch (type) {
      case 'one-to-many': return '1:N';
      case 'many-to-one': return 'N:1';
      case 'one-to-one': return '1:1';
      case 'many-to-many': return 'N:N';
      default: return '';
    }
  };

  if (loading) {
    return (
      <div className="page-header">
        <h1>Database Schema</h1>
        <div className="loading">Loading schema...</div>
      </div>
    );
  }

  const tables = Object.keys(schema).length > 0 ? Object.keys(schema) : databaseSchema.tables.map(t => t.name);

  return (
    <div className="container">
      <div className="page-header">
        <h1>🗄️ Database Schema</h1>
        <p>Visual representation of database tables, attributes, and relationships</p>
        <div className="schema-controls">
          <button 
            className={`btn ${showRelationships ? 'btn-primary' : 'btn-secondary'}`}
            onClick={() => setShowRelationships(!showRelationships)}
          >
            {showRelationships ? <EyeOff size={16} /> : <Eye size={16} />}
            {showRelationships ? 'Hide' : 'Show'} Relationships
          </button>
        </div>
      </div>

      <div className="schema-container">
        <div className="tables-grid">
          {tables.map((tableName) => {
            const table = databaseSchema.tables.find(t => t.name === tableName) || {
              name: tableName,
              displayName: tableName.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
              color: '#6c757d',
              attributes: schema[tableName] || [],
              relationships: []
            };
            return (
            <div 
              key={table.name}
              className={`table-card ${selectedTable === table.name ? 'selected' : ''}`}
              onClick={() => setSelectedTable(selectedTable === table.name ? null : table.name)}
              style={{ borderLeftColor: table.color }}
            >
              <div className="table-header">
                <div className="table-title">
                  <Table size={16} />
                  <span>{table.displayName}</span>
                </div>
                <div className="table-actions">
                  <span className="attribute-count">{table.attributes.length} fields</span>
                </div>
              </div>

              <div className="table-attributes">
                {table.attributes.slice(0, 3).map((attr, index) => (
                  <div key={index} className="attribute-row">
                    <div className="attribute-info">
                      {getKeyIcon(attr.key)}
                      <span className="attribute-name">{attr.name}</span>
                    </div>
                    <span className="attribute-type">{attr.type}</span>
                  </div>
                ))}
                {table.attributes.length > 3 && (
                  <div className="more-attributes">
                    +{table.attributes.length - 3} more fields
                  </div>
                )}
              </div>

              {showRelationships && table.relationships.length > 0 && (
                <div className="table-relationships">
                  <div className="relationships-header">Relationships:</div>
                  {table.relationships.map((rel, index) => (
                    <div key={index} className="relationship-item">
                      <span className="relationship-type">{getRelationshipIcon(rel.type)}</span>
                      <span className="relationship-target">{rel.target}</span>
                    </div>
                  ))}
                </div>
              )}
            </div>
            );
          })}
        </div>

        {selectedTable && (
          <div className="table-details">
            <div className="details-header">
              <h3>Table Details: {databaseSchema.tables.find(t => t.name === selectedTable)?.displayName}</h3>
              <button 
                className="btn btn-secondary btn-sm"
                onClick={() => setSelectedTable(null)}
              >
                Close
              </button>
            </div>
            
            <div className="details-content">
              <div className="attributes-section">
                <h4>Attributes</h4>
                <div className="attributes-table">
                  <div className="attributes-header">
                    <span>Field</span>
                    <span>Type</span>
                    <span>Key</span>
                    <span>Nullable</span>
                  </div>
                  {databaseSchema.tables.find(t => t.name === selectedTable)?.attributes.map((attr, index) => (
                    <div key={index} className="attribute-detail-row">
                      <span className="attribute-name">{attr.name}</span>
                      <span className="attribute-type">{attr.type}</span>
                      <span className="attribute-key">
                        {attr.key && (
                          <span className={`key-badge ${attr.key.toLowerCase()}`}>
                            {attr.key}
                          </span>
                        )}
                      </span>
                      <span className="attribute-nullable">
                        {attr.nullable ? 'Yes' : 'No'}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="relationships-section">
                <h4>Relationships</h4>
                {databaseSchema.tables.find(t => t.name === selectedTable)?.relationships.map((rel, index) => (
                  <div key={index} className="relationship-detail">
                    <div className="relationship-info">
                      <span className="relationship-type-badge">{getRelationshipIcon(rel.type)}</span>
                      <span className="relationship-description">
                        {rel.type.replace('-', ' ')} relationship with <strong>{rel.target}</strong>
                      </span>
                    </div>
                    <div className="relationship-field">
                      Foreign Key: <code>{rel.field}</code>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default DatabaseSchema;
