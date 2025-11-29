import React, { useState, useEffect } from 'react';
import { Database, X, Eye, EyeOff, ZoomIn, ZoomOut, Download, Search, Filter } from 'lucide-react';
import axios from 'axios';

const EnhancedERDiagram = () => {
  const [schema, setSchema] = useState(null);
  const [selectedEntity, setSelectedEntity] = useState(null);
  const [showDetails, setShowDetails] = useState(false);
  const [zoom, setZoom] = useState(1);
  const [pan, setPan] = useState({ x: 0, y: 0 });
  const [isDragging, setIsDragging] = useState(false);
  const [dragStart, setDragStart] = useState({ x: 0, y: 0 });
  const [showRelationships, setShowRelationships] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [filteredTables, setFilteredTables] = useState([]);

  useEffect(() => {
    fetchSchema();
  }, []);

  useEffect(() => {
    if (schema && schema.tables) {
      const filtered = schema.tables.filter(table =>
        table.table_name.toLowerCase().includes(searchTerm.toLowerCase())
      );
      setFilteredTables(filtered);
    }
  }, [schema, searchTerm]);

  const fetchSchema = async () => {
    try {
      const response = await axios.get('/api/schema');
      setSchema(response.data);
      setFilteredTables(response.data.tables);
    } catch (error) {
      console.error('Error fetching schema:', error);
      // Demo schema data
      const demoSchema = {
        tables: [
          {
            table_name: 'freelancers',
            attributes: [
              { name: 'freelancer_id', type: 'INT', is_primary: true },
              { name: 'name', type: 'VARCHAR(100)', is_primary: false },
              { name: 'email', type: 'VARCHAR(100)', is_primary: false },
              { name: 'phone', type: 'VARCHAR(15)', is_primary: false },
              { name: 'location', type: 'VARCHAR(50)', is_primary: false },
              { name: 'experience_level', type: 'ENUM', is_primary: false },
              { name: 'rating', type: 'DECIMAL(2,1)', is_primary: false },
              { name: 'total_completed', type: 'INT', is_primary: false },
              { name: 'join_date', type: 'DATE', is_primary: false }
            ],
            relationships: [
              { target_table: 'applications', relationship_type: 'one-to-many' },
              { target_table: 'freelancer_skills', relationship_type: 'one-to-many' },
              { target_table: 'messages', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'clients',
            attributes: [
              { name: 'client_id', type: 'INT', is_primary: true },
              { name: 'name', type: 'VARCHAR(100)', is_primary: false },
              { name: 'email', type: 'VARCHAR(100)', is_primary: false },
              { name: 'organization', type: 'VARCHAR(100)', is_primary: false },
              { name: 'location', type: 'VARCHAR(50)', is_primary: false },
              { name: 'member_since', type: 'DATE', is_primary: false }
            ],
            relationships: [
              { target_table: 'gigs', relationship_type: 'one-to-many' },
              { target_table: 'messages', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'gigs',
            attributes: [
              { name: 'gig_id', type: 'INT', is_primary: true },
              { name: 'client_id', type: 'INT', is_primary: false },
              { name: 'category_id', type: 'INT', is_primary: false },
              { name: 'title', type: 'VARCHAR(150)', is_primary: false },
              { name: 'description', type: 'TEXT', is_primary: false },
              { name: 'budget', type: 'DECIMAL(10,2)', is_primary: false },
              { name: 'posted_date', type: 'DATE', is_primary: false },
              { name: 'status', type: 'ENUM', is_primary: false }
            ],
            relationships: [
              { target_table: 'clients', relationship_type: 'many-to-one' },
              { target_table: 'categories', relationship_type: 'many-to-one' },
              { target_table: 'applications', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'applications',
            attributes: [
              { name: 'application_id', type: 'INT', is_primary: true },
              { name: 'gig_id', type: 'INT', is_primary: false },
              { name: 'freelancer_id', type: 'INT', is_primary: false },
              { name: 'proposal_text', type: 'TEXT', is_primary: false },
              { name: 'bid_amount', type: 'DECIMAL(10,2)', is_primary: false },
              { name: 'applied_date', type: 'DATE', is_primary: false },
              { name: 'status', type: 'ENUM', is_primary: false }
            ],
            relationships: [
              { target_table: 'gigs', relationship_type: 'many-to-one' },
              { target_table: 'freelancers', relationship_type: 'many-to-one' },
              { target_table: 'contracts', relationship_type: 'one-to-one' }
            ]
          },
          {
            table_name: 'contracts',
            attributes: [
              { name: 'contract_id', type: 'INT', is_primary: true },
              { name: 'application_id', type: 'INT', is_primary: false },
              { name: 'start_date', type: 'DATE', is_primary: false },
              { name: 'end_date', type: 'DATE', is_primary: false },
              { name: 'work_status', type: 'ENUM', is_primary: false },
              { name: 'total_payment', type: 'DECIMAL(10,2)', is_primary: false }
            ],
            relationships: [
              { target_table: 'applications', relationship_type: 'one-to-one' },
              { target_table: 'payments', relationship_type: 'one-to-many' },
              { target_table: 'reviews', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'payments',
            attributes: [
              { name: 'payment_id', type: 'INT', is_primary: true },
              { name: 'contract_id', type: 'INT', is_primary: false },
              { name: 'amount', type: 'DECIMAL(10,2)', is_primary: false },
              { name: 'payment_date', type: 'DATE', is_primary: false },
              { name: 'method', type: 'ENUM', is_primary: false },
              { name: 'status', type: 'ENUM', is_primary: false }
            ],
            relationships: [
              { target_table: 'contracts', relationship_type: 'many-to-one' }
            ]
          },
          {
            table_name: 'reviews',
            attributes: [
              { name: 'review_id', type: 'INT', is_primary: true },
              { name: 'contract_id', type: 'INT', is_primary: false },
              { name: 'rating', type: 'INT', is_primary: false },
              { name: 'comments', type: 'TEXT', is_primary: false },
              { name: 'review_date', type: 'DATE', is_primary: false }
            ],
            relationships: [
              { target_table: 'contracts', relationship_type: 'many-to-one' }
            ]
          },
          {
            table_name: 'skills',
            attributes: [
              { name: 'skill_id', type: 'INT', is_primary: true },
              { name: 'skill_name', type: 'VARCHAR(50)', is_primary: false }
            ],
            relationships: [
              { target_table: 'freelancer_skills', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'freelancer_skills',
            attributes: [
              { name: 'freelancer_id', type: 'INT', is_primary: true },
              { name: 'skill_id', type: 'INT', is_primary: true }
            ],
            relationships: [
              { target_table: 'freelancers', relationship_type: 'many-to-one' },
              { target_table: 'skills', relationship_type: 'many-to-one' }
            ]
          },
          {
            table_name: 'categories',
            attributes: [
              { name: 'category_id', type: 'INT', is_primary: true },
              { name: 'category_name', type: 'VARCHAR(50)', is_primary: false }
            ],
            relationships: [
              { target_table: 'gigs', relationship_type: 'one-to-many' }
            ]
          },
          {
            table_name: 'messages',
            attributes: [
              { name: 'message_id', type: 'INT', is_primary: true },
              { name: 'sender_type', type: 'ENUM', is_primary: false },
              { name: 'sender_id', type: 'INT', is_primary: false },
              { name: 'receiver_id', type: 'INT', is_primary: false },
              { name: 'message_text', type: 'TEXT', is_primary: false },
              { name: 'sent_at', type: 'DATETIME', is_primary: false }
            ],
            relationships: [
              { target_table: 'clients', relationship_type: 'many-to-one' },
              { target_table: 'freelancers', relationship_type: 'many-to-one' }
            ]
          }
        ]
      };
      setSchema(demoSchema);
      setFilteredTables(demoSchema.tables);
    }
  };

  const handleEntityClick = (entity) => {
    setSelectedEntity(entity);
    setShowDetails(true);
  };

  const handleZoomIn = () => {
    setZoom(prev => Math.min(prev + 0.2, 2));
  };

  const handleZoomOut = () => {
    setZoom(prev => Math.max(prev - 0.2, 0.5));
  };

  const handleMouseDown = (e) => {
    setIsDragging(true);
    setDragStart({ x: e.clientX - pan.x, y: e.clientY - pan.y });
  };

  const handleMouseMove = (e) => {
    if (isDragging) {
      setPan({
        x: e.clientX - dragStart.x,
        y: e.clientY - dragStart.y
      });
    }
  };

  const handleMouseUp = () => {
    setIsDragging(false);
  };

  const downloadDiagram = () => {
    const svg = document.querySelector('.er-diagram-svg');
    const svgData = new XMLSerializer().serializeToString(svg);
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    const img = new Image();
    
    img.onload = () => {
      canvas.width = img.width;
      canvas.height = img.height;
      ctx.drawImage(img, 0, 0);
      const pngFile = canvas.toDataURL('image/png');
      const downloadLink = document.createElement('a');
      downloadLink.download = 'enhanced-er-diagram.png';
      downloadLink.href = pngFile;
      downloadLink.click();
    };
    
    img.src = 'data:image/svg+xml;base64,' + btoa(svgData);
  };

  const getEntityColor = (tableName) => {
    const colors = {
      'freelancers': '#3b82f6',
      'clients': '#10b981',
      'gigs': '#f59e0b',
      'applications': '#8b5cf6',
      'contracts': '#ef4444',
      'payments': '#06b6d4',
      'reviews': '#84cc16',
      'skills': '#f97316',
      'freelancer_skills': '#ec4899',
      'categories': '#6366f1',
      'messages': '#14b8a6'
    };
    return colors[tableName] || '#6b7280';
  };

  const getEntityIcon = (tableName) => {
    const icons = {
      'freelancers': '👨‍💻',
      'clients': '🏢',
      'gigs': '💼',
      'applications': '📝',
      'contracts': '📋',
      'payments': '💰',
      'reviews': '⭐',
      'skills': '🏷️',
      'freelancer_skills': '🔗',
      'categories': '📂',
      'messages': '💬'
    };
    return icons[tableName] || '📊';
  };

  if (!schema) {
    return (
      <div className="container">
        <div className="page-header">
          <h1>🗺️ Enhanced ER Diagram</h1>
          <p>Loading interactive Entity-Relationship diagram...</p>
        </div>
        <div className="card">
          <div className="loading">Loading schema...</div>
        </div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>🗺️ Enhanced ER Diagram</h1>
        <p>Interactive Entity-Relationship diagram with detailed entity information</p>
      </div>

      {/* Controls */}
      <div className="card">
        <div className="diagram-controls">
          <div className="control-group">
            <div className="search-box">
              <Search size={16} />
              <input
                type="text"
                placeholder="Search entities..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="search-input"
              />
            </div>
            <button
              className={`btn ${showRelationships ? 'btn-primary' : 'btn-secondary'}`}
              onClick={() => setShowRelationships(!showRelationships)}
            >
              {showRelationships ? <Eye size={16} /> : <EyeOff size={16} />}
              {showRelationships ? 'Hide' : 'Show'} Relationships
            </button>
          </div>
          
          <div className="control-group">
            <button className="btn btn-secondary" onClick={handleZoomOut}>
              <ZoomOut size={16} />
            </button>
            <span className="zoom-level">{Math.round(zoom * 100)}%</span>
            <button className="btn btn-secondary" onClick={handleZoomIn}>
              <ZoomIn size={16} />
            </button>
            <button className="btn btn-primary" onClick={downloadDiagram}>
              <Download size={16} />
              Download
            </button>
          </div>
        </div>
      </div>

      {/* Diagram Container */}
      <div className="card">
        <div 
          className="diagram-container"
          onMouseDown={handleMouseDown}
          onMouseMove={handleMouseMove}
          onMouseUp={handleMouseUp}
          onMouseLeave={handleMouseUp}
        >
          <svg
            className="er-diagram-svg"
            width="100%"
            height="600"
            style={{
              transform: `scale(${zoom}) translate(${pan.x / zoom}px, ${pan.y / zoom}px)`,
              transformOrigin: '0 0'
            }}
          >
            {/* Render Entities */}
            {filteredTables && filteredTables.map((table, index) => {
              const x = 50 + (index % 4) * 300;
              const y = 50 + Math.floor(index / 4) * 200;
              const color = getEntityColor(table.table_name);
              
              return (
                <g key={table.table_name}>
                  {/* Entity Rectangle */}
                  <rect
                    x={x}
                    y={y}
                    width={250}
                    height={150}
                    fill={color}
                    fillOpacity={0.1}
                    stroke={color}
                    strokeWidth={2}
                    rx={8}
                    className="entity-rect"
                    onClick={() => handleEntityClick(table)}
                    style={{ cursor: 'pointer' }}
                  />
                  
                  {/* Entity Name */}
                  <text
                    x={x + 125}
                    y={y + 25}
                    textAnchor="middle"
                    className="entity-name"
                    fill={color}
                    fontSize="16"
                    fontWeight="bold"
                    onClick={() => handleEntityClick(table)}
                    style={{ cursor: 'pointer' }}
                  >
                    {getEntityIcon(table.table_name)} {table.table_name}
                  </text>
                  
                  {/* Primary Key */}
                  <text
                    x={x + 10}
                    y={y + 45}
                    className="attribute-text primary-key"
                    fontSize="12"
                    fontWeight="bold"
                    fill="#dc2626"
                  >
                    🔑 Primary Key
                  </text>
                  
                  {/* Attributes */}
                  {table.attributes.slice(0, 4).map((attr, attrIndex) => (
                    <text
                      key={attr.name}
                      x={x + 10}
                      y={y + 65 + attrIndex * 15}
                      className="attribute-text"
                      fontSize="11"
                      fill={attr.is_primary ? '#dc2626' : '#374151'}
                    >
                      {attr.is_primary ? '🔑' : '•'} {attr.name} ({attr.type})
                    </text>
                  ))}
                  
                  {table.attributes.length > 4 && (
                    <text
                      x={x + 10}
                      y={y + 125}
                      className="attribute-text"
                      fontSize="10"
                      fill="#6b7280"
                    >
                      ... and {table.attributes.length - 4} more
                    </text>
                  )}
                  
                  {/* Relationships */}
                  {showRelationships && table.relationships.map((rel, relIndex) => (
                    <g key={relIndex}>
                      <line
                        x1={x + 250}
                        y1={y + 75}
                        x2={x + 300}
                        y2={y + 75 + relIndex * 20}
                        stroke="#6b7280"
                        strokeWidth={2}
                        strokeDasharray="5,5"
                      />
                      <text
                        x={x + 255}
                        y={y + 70 + relIndex * 20}
                        className="relationship-label"
                        fontSize="10"
                        fill="#6b7280"
                      >
                        {rel.relationship_type}
                      </text>
                    </g>
                  ))}
                </g>
              );
            })}
          </svg>
        </div>
      </div>

      {/* Entity Details Modal */}
      {showDetails && selectedEntity && (
        <div className="entity-modal-overlay" onClick={() => setShowDetails(false)}>
          <div className="entity-modal" onClick={(e) => e.stopPropagation()}>
            <div className="entity-modal-header">
              <h2>
                {getEntityIcon(selectedEntity.table_name)} {selectedEntity.table_name}
              </h2>
              <button 
                className="close-btn"
                onClick={() => setShowDetails(false)}
              >
                <X size={20} />
              </button>
            </div>
            
            <div className="entity-modal-content">
              {/* Attributes Section */}
              <div className="entity-section">
                <h3>📋 Attributes ({selectedEntity.attributes.length})</h3>
                <div className="attributes-table">
                  <div className="attributes-header">
                    <span>Attribute</span>
                    <span>Type</span>
                    <span>Key</span>
                  </div>
                  {selectedEntity.attributes.map((attr, index) => (
                    <div key={index} className="attribute-row">
                      <span className="attribute-name">{attr.name}</span>
                      <span className="attribute-type">{attr.type}</span>
                      <span className={`key-badge ${attr.is_primary ? 'primary' : 'normal'}`}>
                        {attr.is_primary ? '🔑 PK' : '•'}
                      </span>
                    </div>
                  ))}
                </div>
              </div>
              
              {/* Relationships Section */}
              <div className="entity-section">
                <h3>🔗 Relationships ({selectedEntity.relationships.length})</h3>
                <div className="relationships-list">
                  {selectedEntity.relationships.map((rel, index) => (
                    <div key={index} className="relationship-item">
                      <div className="relationship-type">
                        {rel.relationship_type.replace('-', ' → ')}
                      </div>
                      <div className="relationship-target">
                        → {rel.target_table}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
              
              {/* Sample Data Section */}
              <div className="entity-section">
                <h3>📊 Sample Data</h3>
                <div className="sample-data">
                  <p>This entity contains real data from the MySQL database.</p>
                  <p>Click on other entities to explore the database schema.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default EnhancedERDiagram;