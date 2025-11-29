import React from 'react';
import { Download } from 'lucide-react';

const DrawnERDiagram = () => {
  const downloadDiagram = () => {
    const svg = document.getElementById('er-diagram-svg');
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
      downloadLink.download = 'freelance-gig-exchange-er-diagram.png';
      downloadLink.href = pngFile;
      downloadLink.click();
    };
    
    img.src = 'data:image/svg+xml;base64,' + btoa(svgData);
  };

  return (
    <div className="container">
      <div className="page-header">
        <h1>🗺️ Enhanced ER Diagram</h1>
        <p>Visual Entity-Relationship Diagram of Freelance Gig Exchange Database</p>
        <button onClick={downloadDiagram} className="btn">
          <Download size={16} />
          Download Diagram
        </button>
      </div>
      
      <div className="card">
        <div className="diagram-container">
          <svg id="er-diagram-svg" width="1400" height="1000" viewBox="0 0 1400 1000">
            {/* Background */}
            <rect width="1400" height="1000" fill="#f8f9fa" />
            
            {/* Title */}
            <text x="700" y="30" textAnchor="middle" fontSize="24" fontWeight="bold" fill="#2c3e50">
              Freelance Gig Exchange Network - Entity Relationship Diagram
            </text>
            
            {/* FREELANCERS Table */}
            <g id="freelancers">
              <rect x="50" y="80" width="200" height="120" fill="#e3f2fd" stroke="#2196f3" strokeWidth="2" rx="5" />
              <text x="150" y="100" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#1976d2">FREELANCERS</text>
              <text x="60" y="120" fontSize="11" fill="#333">freelancer_id (PK)</text>
              <text x="60" y="135" fontSize="11" fill="#333">name</text>
              <text x="60" y="150" fontSize="11" fill="#333">email</text>
              <text x="60" y="165" fontSize="11" fill="#333">phone</text>
              <text x="60" y="180" fontSize="11" fill="#333">experience_level</text>
              <text x="60" y="195" fontSize="11" fill="#333">rating</text>
            </g>
            
            {/* CLIENTS Table */}
            <g id="clients">
              <rect x="350" y="80" width="200" height="120" fill="#e8f5e8" stroke="#4caf50" strokeWidth="2" rx="5" />
              <text x="450" y="100" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#388e3c">CLIENTS</text>
              <text x="360" y="120" fontSize="11" fill="#333">client_id (PK)</text>
              <text x="360" y="135" fontSize="11" fill="#333">name</text>
              <text x="360" y="150" fontSize="11" fill="#333">email</text>
              <text x="360" y="165" fontSize="11" fill="#333">organization</text>
              <text x="360" y="180" fontSize="11" fill="#333">location</text>
              <text x="360" y="195" fontSize="11" fill="#333">member_since</text>
            </g>
            
            {/* CATEGORIES Table */}
            <g id="categories">
              <rect x="650" y="80" width="200" height="100" fill="#fff3e0" stroke="#ff9800" strokeWidth="2" rx="5" />
              <text x="750" y="100" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#f57c00">CATEGORIES</text>
              <text x="660" y="120" fontSize="11" fill="#333">category_id (PK)</text>
              <text x="660" y="135" fontSize="11" fill="#333">category_name</text>
              <text x="660" y="150" fontSize="11" fill="#333">description</text>
              <text x="660" y="165" fontSize="11" fill="#333">created_at</text>
            </g>
            
            {/* SKILLS Table */}
            <g id="skills">
              <rect x="950" y="80" width="200" height="100" fill="#f3e5f5" stroke="#9c27b0" strokeWidth="2" rx="5" />
              <text x="1050" y="100" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#7b1fa2">SKILLS</text>
              <text x="960" y="120" fontSize="11" fill="#333">skill_id (PK)</text>
              <text x="960" y="135" fontSize="11" fill="#333">skill_name</text>
              <text x="960" y="150" fontSize="11" fill="#333">category</text>
              <text x="960" y="165" fontSize="11" fill="#333">created_at</text>
            </g>
            
            {/* FREELANCER_SKILLS Table */}
            <g id="freelancer_skills">
              <rect x="200" y="300" width="200" height="100" fill="#ffebee" stroke="#f44336" strokeWidth="2" rx="5" />
              <text x="300" y="320" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#d32f2f">FREELANCER_SKILLS</text>
              <text x="210" y="340" fontSize="11" fill="#333">freelancer_id (FK)</text>
              <text x="210" y="355" fontSize="11" fill="#333">skill_id (FK)</text>
              <text x="210" y="370" fontSize="11" fill="#333">proficiency_level</text>
              <text x="210" y="385" fontSize="11" fill="#333">years_experience</text>
            </g>
            
            {/* GIGS Table */}
            <g id="gigs">
              <rect x="500" y="300" width="200" height="140" fill="#e0f2f1" stroke="#00bcd4" strokeWidth="2" rx="5" />
              <text x="600" y="320" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#00695c">GIGS</text>
              <text x="510" y="340" fontSize="11" fill="#333">gig_id (PK)</text>
              <text x="510" y="355" fontSize="11" fill="#333">client_id (FK)</text>
              <text x="510" y="370" fontSize="11" fill="#333">category_id (FK)</text>
              <text x="510" y="385" fontSize="11" fill="#333">title</text>
              <text x="510" y="400" fontSize="11" fill="#333">description</text>
              <text x="510" y="415" fontSize="11" fill="#333">budget</text>
              <text x="510" y="430" fontSize="11" fill="#333">status</text>
            </g>
            
            {/* APPLICATIONS Table */}
            <g id="applications">
              <rect x="800" y="300" width="200" height="140" fill="#fce4ec" stroke="#e91e63" strokeWidth="2" rx="5" />
              <text x="900" y="320" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#c2185b">APPLICATIONS</text>
              <text x="810" y="340" fontSize="11" fill="#333">application_id (PK)</text>
              <text x="810" y="355" fontSize="11" fill="#333">gig_id (FK)</text>
              <text x="810" y="370" fontSize="11" fill="#333">freelancer_id (FK)</text>
              <text x="810" y="385" fontSize="11" fill="#333">proposal_text</text>
              <text x="810" y="400" fontSize="11" fill="#333">bid_amount</text>
              <text x="810" y="415" fontSize="11" fill="#333">status</text>
              <text x="810" y="430" fontSize="11" fill="#333">applied_date</text>
            </g>
            
            {/* CONTRACTS Table */}
            <g id="contracts">
              <rect x="200" y="500" width="200" height="120" fill="#e8eaf6" stroke="#3f51b5" strokeWidth="2" rx="5" />
              <text x="300" y="520" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#303f9f">CONTRACTS</text>
              <text x="210" y="540" fontSize="11" fill="#333">contract_id (PK)</text>
              <text x="210" y="555" fontSize="11" fill="#333">application_id (FK)</text>
              <text x="210" y="570" fontSize="11" fill="#333">start_date</text>
              <text x="210" y="585" fontSize="11" fill="#333">end_date</text>
              <text x="210" y="600" fontSize="11" fill="#333">total_payment</text>
              <text x="210" y="615" fontSize="11" fill="#333">work_status</text>
            </g>
            
            {/* PAYMENTS Table */}
            <g id="payments">
              <rect x="500" y="500" width="200" height="120" fill="#fff8e1" stroke="#ffc107" strokeWidth="2" rx="5" />
              <text x="600" y="520" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#f57f17">PAYMENTS</text>
              <text x="510" y="540" fontSize="11" fill="#333">payment_id (PK)</text>
              <text x="510" y="555" fontSize="11" fill="#333">contract_id (FK)</text>
              <text x="510" y="570" fontSize="11" fill="#333">amount</text>
              <text x="510" y="585" fontSize="11" fill="#333">payment_date</text>
              <text x="510" y="600" fontSize="11" fill="#333">method</text>
              <text x="510" y="615" fontSize="11" fill="#333">status</text>
            </g>
            
            {/* REVIEWS Table */}
            <g id="reviews">
              <rect x="800" y="500" width="200" height="120" fill="#f1f8e9" stroke="#8bc34a" strokeWidth="2" rx="5" />
              <text x="900" y="520" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#689f38">REVIEWS</text>
              <text x="810" y="540" fontSize="11" fill="#333">review_id (PK)</text>
              <text x="810" y="555" fontSize="11" fill="#333">contract_id (FK)</text>
              <text x="810" y="570" fontSize="11" fill="#333">rating</text>
              <text x="810" y="585" fontSize="11" fill="#333">comments</text>
              <text x="810" y="600" fontSize="11" fill="#333">review_date</text>
              <text x="810" y="615" fontSize="11" fill="#333">reviewer_type</text>
            </g>
            
            {/* MESSAGES Table */}
            <g id="messages">
              <rect x="1100" y="300" width="200" height="140" fill="#e3f2fd" stroke="#2196f3" strokeWidth="2" rx="5" />
              <text x="1200" y="320" textAnchor="middle" fontSize="14" fontWeight="bold" fill="#1976d2">MESSAGES</text>
              <text x="1110" y="340" fontSize="11" fill="#333">message_id (PK)</text>
              <text x="1110" y="355" fontSize="11" fill="#333">sender_type</text>
              <text x="1110" y="370" fontSize="11" fill="#333">sender_id</text>
              <text x="1110" y="385" fontSize="11" fill="#333">receiver_id</text>
              <text x="1110" y="400" fontSize="11" fill="#333">message_text</text>
              <text x="1110" y="415" fontSize="11" fill="#333">sent_at</text>
              <text x="1110" y="430" fontSize="11" fill="#333">is_read</text>
            </g>
            
            {/* Relationships */}
            
            {/* FREELANCERS to FREELANCER_SKILLS */}
            <line x1="250" y1="200" x2="300" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="275" y="250" fontSize="10" fill="#333">1</text>
            <text x="275" y="260" fontSize="10" fill="#333">M</text>
            
            {/* SKILLS to FREELANCER_SKILLS */}
            <line x1="1050" y1="180" x2="300" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="675" y="240" fontSize="10" fill="#333">1</text>
            <text x="675" y="250" fontSize="10" fill="#333">M</text>
            
            {/* CLIENTS to GIGS */}
            <line x1="450" y1="200" x2="600" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="525" y="250" fontSize="10" fill="#333">1</text>
            <text x="525" y="260" fontSize="10" fill="#333">M</text>
            
            {/* CATEGORIES to GIGS */}
            <line x1="750" y1="180" x2="600" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="675" y="240" fontSize="10" fill="#333">1</text>
            <text x="675" y="250" fontSize="10" fill="#333">M</text>
            
            {/* GIGS to APPLICATIONS */}
            <line x1="700" y1="300" x2="800" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="750" y="295" fontSize="10" fill="#333">1</text>
            <text x="750" y="305" fontSize="10" fill="#333">M</text>
            
            {/* FREELANCERS to APPLICATIONS */}
            <line x1="150" y1="200" x2="900" y2="300" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="525" y="250" fontSize="10" fill="#333">1</text>
            <text x="525" y="260" fontSize="10" fill="#333">M</text>
            
            {/* APPLICATIONS to CONTRACTS */}
            <line x1="900" y1="440" x2="300" y2="500" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="600" y="470" fontSize="10" fill="#333">1</text>
            <text x="600" y="480" fontSize="10" fill="#333">1</text>
            
            {/* CONTRACTS to PAYMENTS */}
            <line x1="400" y1="500" x2="500" y2="500" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="450" y="495" fontSize="10" fill="#333">1</text>
            <text x="450" y="505" fontSize="10" fill="#333">M</text>
            
            {/* CONTRACTS to REVIEWS */}
            <line x1="400" y1="560" x2="800" y2="500" stroke="#333" strokeWidth="2" markerEnd="url(#arrowhead)" />
            <text x="600" y="530" fontSize="10" fill="#333">1</text>
            <text x="600" y="540" fontSize="10" fill="#333">1</text>
            
            {/* Arrow marker definition */}
            <defs>
              <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
                <polygon points="0 0, 10 3.5, 0 7" fill="#333" />
              </marker>
            </defs>
            
            {/* Legend */}
            <g id="legend">
              <rect x="50" y="700" width="300" height="200" fill="white" stroke="#333" strokeWidth="1" rx="5" />
              <text x="200" y="720" textAnchor="middle" fontSize="16" fontWeight="bold" fill="#333">Legend</text>
              
              <text x="70" y="745" fontSize="12" fill="#333">Primary Key (PK)</text>
              <text x="70" y="760" fontSize="12" fill="#333">Foreign Key (FK)</text>
              <text x="70" y="775" fontSize="12" fill="#333">One-to-Many (1:M)</text>
              <text x="70" y="790" fontSize="12" fill="#333">One-to-One (1:1)</text>
              
              <text x="70" y="815" fontSize="12" fill="#333">Table Colors:</text>
              <rect x="70" y="825" width="15" height="10" fill="#e3f2fd" stroke="#2196f3" />
              <text x="90" y="835" fontSize="10" fill="#333">Core Entities</text>
              <rect x="70" y="840" width="15" height="10" fill="#e8f5e8" stroke="#4caf50" />
              <text x="90" y="850" fontSize="10" fill="#333">Business Entities</text>
              <rect x="70" y="855" width="15" height="10" fill="#fff3e0" stroke="#ff9800" />
              <text x="90" y="865" fontSize="10" fill="#333">Reference Data</text>
              <rect x="70" y="870" width="15" height="10" fill="#f3e5f5" stroke="#9c27b0" />
              <text x="90" y="880" fontSize="10" fill="#333">Skills & Categories</text>
            </g>
            
            {/* Database Stats */}
            <g id="stats">
              <rect x="400" y="700" width="300" height="200" fill="white" stroke="#333" strokeWidth="1" rx="5" />
              <text x="550" y="720" textAnchor="middle" fontSize="16" fontWeight="bold" fill="#333">Database Statistics</text>
              
              <text x="420" y="745" fontSize="12" fill="#333">Total Tables: 11</text>
              <text x="420" y="760" fontSize="12" fill="#333">Core Entities: 2 (Freelancers, Clients)</text>
              <text x="420" y="775" fontSize="12" fill="#333">Business Objects: 3 (Gigs, Applications, Contracts)</text>
              <text x="420" y="790" fontSize="12" fill="#333">Transaction Records: 2 (Payments, Reviews)</text>
              <text x="420" y="805" fontSize="12" fill="#333">Reference Data: 2 (Categories, Skills)</text>
              <text x="420" y="820" fontSize="12" fill="#333">Communication: 1 (Messages)</text>
              <text x="420" y="835" fontSize="12" fill="#333">Junction Table: 1 (Freelancer_Skills)</text>
              
              <text x="420" y="860" fontSize="12" fontWeight="bold" fill="#333">Key Relationships:</text>
              <text x="420" y="875" fontSize="11" fill="#333">• Many-to-Many: Freelancers ↔ Skills</text>
              <text x="420" y="890" fontSize="11" fill="#333">• One-to-Many: Clients → Gigs → Applications → Contracts</text>
            </g>
            
            {/* Technical Details */}
            <g id="technical">
              <rect x="750" y="700" width="300" height="200" fill="white" stroke="#333" strokeWidth="1" rx="5" />
              <text x="900" y="720" textAnchor="middle" fontSize="16" fontWeight="bold" fill="#333">Technical Details</text>
              
              <text x="770" y="745" fontSize="12" fill="#333">Database: MySQL</text>
              <text x="770" y="760" fontSize="12" fill="#333">Engine: InnoDB</text>
              <text x="770" y="775" fontSize="12" fill="#333">Charset: UTF-8</text>
              <text x="770" y="790" fontSize="12" fill="#333">Normalization: 3NF</text>
              
              <text x="770" y="815" fontSize="12" fontWeight="bold" fill="#333">Constraints:</text>
              <text x="770" y="830" fontSize="11" fill="#333">• Primary Keys: Auto-increment</text>
              <text x="770" y="845" fontSize="11" fill="#333">• Foreign Keys: Cascade Delete</text>
              <text x="770" y="860" fontSize="11" fill="#333">• Unique Constraints: Email fields</text>
              <text x="770" y="875" fontSize="11" fill="#333">• Check Constraints: Rating (1-5)</text>
              <text x="770" y="890" fontSize="11" fill="#333">• Indexes: Performance optimization</text>
            </g>
          </svg>
        </div>
      </div>
    </div>
  );
};

export default DrawnERDiagram;







