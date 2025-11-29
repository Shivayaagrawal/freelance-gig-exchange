import React, { useState, useEffect } from 'react';
import { Tag, Users, TrendingUp, Star } from 'lucide-react';

const Skills = () => {
  const [skills, setSkills] = useState([]);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState({});

  useEffect(() => {
    fetchSkills();
  }, []);

  const fetchSkills = async () => {
    try {
      const response = await fetch('/api/skills');
      if (response.ok) {
        const data = await response.json();
        setSkills(data);
        calculateStats(data);
      } else {
        // Demo data if API fails
        const demoSkills = [
          { skill_id: 1, skill_name: 'Python', freelancer_count: 15, avg_rating: 4.5 },
          { skill_id: 2, skill_name: 'JavaScript', freelancer_count: 12, avg_rating: 4.3 },
          { skill_id: 3, skill_name: 'React', freelancer_count: 10, avg_rating: 4.4 },
          { skill_id: 4, skill_name: 'MySQL', freelancer_count: 8, avg_rating: 4.2 },
          { skill_id: 5, skill_name: 'Flask', freelancer_count: 6, avg_rating: 4.1 },
          { skill_id: 6, skill_name: 'Java', freelancer_count: 9, avg_rating: 4.3 },
          { skill_id: 7, skill_name: 'Spring Boot', freelancer_count: 7, avg_rating: 4.4 },
          { skill_id: 8, skill_name: 'AWS', freelancer_count: 5, avg_rating: 4.6 },
          { skill_id: 9, skill_name: 'HTML/CSS', freelancer_count: 14, avg_rating: 4.0 },
          { skill_id: 10, skill_name: 'Figma', freelancer_count: 4, avg_rating: 4.2 }
        ];
        setSkills(demoSkills);
        calculateStats(demoSkills);
      }
    } catch (error) {
      console.error('Error fetching skills:', error);
      // Demo data fallback
      setSkills([
        { skill_id: 1, skill_name: 'Python', freelancer_count: 15, avg_rating: 4.5 },
        { skill_id: 2, skill_name: 'JavaScript', freelancer_count: 12, avg_rating: 4.3 },
        { skill_id: 3, skill_name: 'React', freelancer_count: 10, avg_rating: 4.4 },
        { skill_id: 4, skill_name: 'MySQL', freelancer_count: 8, avg_rating: 4.2 },
        { skill_id: 5, skill_name: 'Flask', freelancer_count: 6, avg_rating: 4.1 },
        { skill_id: 6, skill_name: 'Java', freelancer_count: 9, avg_rating: 4.3 },
        { skill_id: 7, skill_name: 'Spring Boot', freelancer_count: 7, avg_rating: 4.4 },
        { skill_id: 8, skill_name: 'AWS', freelancer_count: 5, avg_rating: 4.6 },
        { skill_id: 9, skill_name: 'HTML/CSS', freelancer_count: 14, avg_rating: 4.0 },
        { skill_id: 10, skill_name: 'Figma', freelancer_count: 4, avg_rating: 4.2 }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const calculateStats = (skillsData) => {
    const totalSkills = skillsData.length;
    const totalFreelancers = skillsData.reduce((sum, skill) => sum + skill.freelancer_count, 0);
    const avgRating = skillsData.reduce((sum, skill) => sum + skill.avg_rating, 0) / totalSkills;
    const topSkill = skillsData.reduce((max, skill) => 
      skill.freelancer_count > max.freelancer_count ? skill : max
    );
    
    setStats({
      totalSkills,
      totalFreelancers,
      avgRating: avgRating.toFixed(1),
      topSkill: topSkill.skill_name
    });
  };

  const getSkillColor = (skillName) => {
    const colors = {
      'Python': '#3776ab',
      'JavaScript': '#f7df1e',
      'React': '#61dafb',
      'MySQL': '#4479a1',
      'Flask': '#000000',
      'Java': '#007396',
      'Spring Boot': '#6db33f',
      'AWS': '#ff9900',
      'HTML/CSS': '#e34f26',
      'Figma': '#f24e1e'
    };
    return colors[skillName] || '#6b7280';
  };

  const getSkillIcon = (skillName) => {
    if (skillName.includes('Python') || skillName.includes('Java')) return '🐍';
    if (skillName.includes('JavaScript') || skillName.includes('React')) return '⚛️';
    if (skillName.includes('MySQL') || skillName.includes('Database')) return '🗄️';
    if (skillName.includes('AWS') || skillName.includes('Cloud')) return '☁️';
    if (skillName.includes('HTML') || skillName.includes('CSS')) return '🎨';
    if (skillName.includes('Figma') || skillName.includes('Design')) return '🎨';
    return '💻';
  };

  if (loading) {
    return (
      <div className="page-header">
        <h1>Skills</h1>
        <div className="loading">Loading skills...</div>
      </div>
    );
  }

  return (
    <div>
      <div className="page-header">
        <h1>Skills Directory</h1>
        <p>Browse and manage skills in the platform</p>
      </div>

      <div className="card">
        <div className="skills-grid">
          {skills.map((skill) => (
            <div key={skill.skill_id} className="skill-card">
              <div className="skill-header">
                <div className="skill-icon" style={{ backgroundColor: getSkillColor(skill.skill_name) }}>
                  {getSkillIcon(skill.skill_name)}
                </div>
                <div className="skill-info">
                  <h3>{skill.skill_name}</h3>
                  <div className="skill-stats">
                    <div className="skill-stat">
                      <Users size={16} />
                      <span>{skill.freelancer_count || 0} freelancers</span>
                    </div>
                    <div className="skill-stat">
                      <Star size={16} />
                      <span>{skill.avg_rating || 0} avg rating</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="skill-actions">
                <button 
                  className="btn btn-primary"
                  onClick={() => alert(`👥 Freelancers with ${skill.skill_name} skill:\n\nTotal Freelancers: ${skill.freelancer_count}\nAverage Rating: ${skill.avg_rating}/5\n\nThis would show a list of all freelancers who have this skill, their profiles, ratings, and availability.`)}
                >
                  View Freelancers
                </button>
                <button 
                  className="btn btn-secondary"
                  onClick={() => alert(`💼 Gigs requiring ${skill.skill_name}:\n\nSkill: ${skill.skill_name}\nFreelancers Available: ${skill.freelancer_count}\nAvg Rating: ${skill.avg_rating}/5\n\nThis would show all open gigs that require this skill, with budget ranges and client information.`)}
                >
                  View Gigs
                </button>
                <button 
                  className="btn btn-outline"
                  onClick={() => alert(`➕ Adding ${skill.skill_name} to your skills:\n\nSkill: ${skill.skill_name}\nCurrent Freelancers: ${skill.freelancer_count}\nMarket Demand: ${skill.avg_rating >= 4.3 ? 'High' : skill.avg_rating >= 4.0 ? 'Medium' : 'Low'}\n\nThis would add this skill to your profile and notify relevant clients.`)}
                >
                  Add Skill
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Skills;
