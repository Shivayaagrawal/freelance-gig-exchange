#!/bin/bash

echo "🔧 Setting up MySQL for FGX Project..."

# Stop any existing MySQL processes
echo "🛑 Stopping existing MySQL processes..."
brew services stop mysql 2>/dev/null || true
pkill -f mysqld 2>/dev/null || true

# Remove old data directory
echo "🗑️  Cleaning old MySQL data..."
rm -rf /opt/homebrew/var/mysql/* 2>/dev/null || true

# Initialize MySQL with no password
echo "🚀 Initializing MySQL..."
/opt/homebrew/opt/mysql/bin/mysqld --initialize-insecure --user=$(whoami) --datadir=/opt/homebrew/var/mysql

# Start MySQL
echo "▶️  Starting MySQL..."
/opt/homebrew/opt/mysql/bin/mysqld_safe --datadir=/opt/homebrew/var/mysql &

# Wait for MySQL to start
echo "⏳ Waiting for MySQL to start..."
sleep 5

# Create database and user
echo "📊 Creating database and user..."
mysql -u root -e "CREATE DATABASE freelance_gig_exchange;"
mysql -u root -e "CREATE USER 'fgx_user'@'localhost' IDENTIFIED BY 'fgx_password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON freelance_gig_exchange.* TO 'fgx_user'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Import schema
echo "📋 Importing database schema..."
mysql -u root freelance_gig_exchange < database/schema.sql

# Import sample data
echo "📊 Importing sample data..."
mysql -u root freelance_gig_exchange < database/sample_data.sql

echo "✅ MySQL setup complete!"
echo "🔗 Database: freelance_gig_exchange"
echo "👤 User: fgx_user"
echo "🔑 Password: fgx_password"
echo "🌐 Host: localhost"
echo "🔌 Port: 3306"

echo ""
echo "🚀 Now you can start the API with:"
echo "cd api && go run main.go"







