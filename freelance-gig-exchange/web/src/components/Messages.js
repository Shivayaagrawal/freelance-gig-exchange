import React, { useState, useEffect } from 'react';
import { MessageSquare, Send, User, Clock, Mail } from 'lucide-react';

const Messages = () => {
  const [messages, setMessages] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selectedConversation, setSelectedConversation] = useState(null);
  const [conversations, setConversations] = useState([]);

  useEffect(() => {
    fetchMessages();
  }, []);

  const fetchMessages = async () => {
    try {
      const response = await fetch('/api/messages');
      if (response.ok) {
        const data = await response.json();
        setMessages(data);
        groupMessagesIntoConversations(data);
      } else {
        // Demo data if API fails
        const demoMessages = [
          {
            message_id: 1,
            sender_type: 'Client',
            sender_id: 1,
            receiver_id: 1,
            message_text: 'Hi Rohan, I am interested in your proposal for the e-commerce project. Can we discuss the timeline?',
            sent_at: '2024-01-16 10:30:00',
            sender_name: 'TCS Innovations',
            receiver_name: 'Rohan Mehta'
          },
          {
            message_id: 2,
            sender_type: 'Freelancer',
            sender_id: 1,
            receiver_id: 1,
            message_text: 'Hello! Yes, I can start immediately and deliver within 8 weeks. Let me know your preferred tech stack.',
            sent_at: '2024-01-16 11:15:00',
            sender_name: 'Rohan Mehta',
            receiver_name: 'TCS Innovations'
          },
          {
            message_id: 3,
            sender_type: 'Client',
            sender_id: 2,
            receiver_id: 6,
            message_text: 'Your data analytics proposal looks promising. Do you have experience with React dashboards?',
            sent_at: '2024-01-21 14:20:00',
            sender_name: 'Infosys Labs',
            receiver_name: 'Amit Patel'
          },
          {
            message_id: 4,
            sender_type: 'Freelancer',
            sender_id: 6,
            receiver_id: 2,
            message_text: 'Yes, I have extensive experience with React dashboards. I can show you my portfolio.',
            sent_at: '2024-01-21 14:45:00',
            sender_name: 'Amit Patel',
            receiver_name: 'Infosys Labs'
          },
          {
            message_id: 5,
            sender_type: 'Client',
            sender_id: 3,
            receiver_id: 5,
            message_text: 'The mobile app development project looks great. When can you start?',
            sent_at: '2024-01-26 09:30:00',
            sender_name: 'Aditya Tech Solutions',
            receiver_name: 'Rajesh Kumar'
          }
        ];
        setMessages(demoMessages);
        groupMessagesIntoConversations(demoMessages);
      }
    } catch (error) {
      console.error('Error fetching messages:', error);
      // Demo data fallback
      setMessages([
        {
          message_id: 1,
          sender_type: 'Client',
          sender_id: 1,
          receiver_id: 1,
          message_text: 'Hi Rohan, I am interested in your proposal for the e-commerce project. Can we discuss the timeline?',
          sent_at: '2024-01-16 10:30:00',
          sender_name: 'TCS Innovations',
          receiver_name: 'Rohan Mehta'
        },
        {
          message_id: 2,
          sender_type: 'Freelancer',
          sender_id: 1,
          receiver_id: 1,
          message_text: 'Hello! Yes, I can start immediately and deliver within 8 weeks. Let me know your preferred tech stack.',
          sent_at: '2024-01-16 11:15:00',
          sender_name: 'Rohan Mehta',
          receiver_name: 'TCS Innovations'
        }
      ]);
    } finally {
      setLoading(false);
    }
  };

  const groupMessagesIntoConversations = (messagesData) => {
    const conversationMap = new Map();
    
    messagesData.forEach(message => {
      const key = `${Math.min(message.sender_id, message.receiver_id)}-${Math.max(message.sender_id, message.receiver_id)}`;
      
      if (!conversationMap.has(key)) {
        conversationMap.set(key, {
          id: key,
          participants: [message.sender_name, message.receiver_name],
          lastMessage: message,
          messageCount: 0,
          messages: []
        });
      }
      
      const conversation = conversationMap.get(key);
      conversation.messages.push(message);
      conversation.messageCount++;
      
      if (new Date(message.sent_at) > new Date(conversation.lastMessage.sent_at)) {
        conversation.lastMessage = message;
      }
    });
    
    setConversations(Array.from(conversationMap.values()).sort((a, b) => 
      new Date(b.lastMessage.sent_at) - new Date(a.lastMessage.sent_at)
    ));
  };

  const formatTime = (timestamp) => {
    const date = new Date(timestamp);
    return date.toLocaleString();
  };

  const getSenderIcon = (senderType) => {
    return senderType === 'Client' ? '🏢' : '👨‍💻';
  };

  if (loading) {
    return (
      <div className="page-header">
        <h1>Messages</h1>
        <div className="loading">Loading messages...</div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-header">
        <h1>💬 Messages</h1>
        <p>Communication between clients and freelancers</p>
      </div>

      <div className="messages-layout">
        {/* Conversations List */}
        <div className="conversations-sidebar">
          <h3>Conversations ({conversations.length})</h3>
          <div className="conversations-list">
            {conversations.map((conversation) => (
              <div 
                key={conversation.id}
                className={`conversation-item ${selectedConversation?.id === conversation.id ? 'active' : ''}`}
                onClick={() => setSelectedConversation(conversation)}
              >
                <div className="conversation-participants">
                  {conversation.participants.join(' ↔ ')}
                </div>
                <div className="conversation-preview">
                  {conversation.lastMessage.message_text.substring(0, 50)}...
                </div>
                <div className="conversation-meta">
                  <span className="message-count">{conversation.messageCount} messages</span>
                  <span className="last-time">{formatTime(conversation.lastMessage.sent_at)}</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Messages View */}
        <div className="messages-main">
          {selectedConversation ? (
            <div className="conversation-view">
              <div className="conversation-header">
                <h3>{selectedConversation.participants.join(' ↔ ')}</h3>
                <span className="message-count">{selectedConversation.messageCount} messages</span>
              </div>
              <div className="messages-list">
                {selectedConversation.messages.map((message) => (
                  <div key={message.message_id} className={`message-item ${message.sender_type.toLowerCase()}`}>
                    <div className="message-content">
                      <div className="message-text">{message.message_text}</div>
                      <div className="message-meta">
                        <span className="sender">{message.sender_name}</span>
                        <span className="time">{formatTime(message.sent_at)}</span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ) : (
            <div className="no-conversation">
              <MessageSquare size={48} />
              <h3>Select a conversation</h3>
              <p>Choose a conversation from the sidebar to view messages</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Messages;
