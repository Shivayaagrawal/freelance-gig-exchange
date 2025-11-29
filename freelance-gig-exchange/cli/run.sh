#!/bin/bash

# Freelance Gig Exchange Network (FGX) - CLI Runner
# Author: Shivi Agrawal

echo "🚀 Starting Freelance Gig Exchange Network CLI..."
echo "================================================"

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "❌ Go is not installed. Please install Go 1.21 or higher."
    exit 1
fi

# Check if MySQL is running
if ! pgrep -x "mysqld" > /dev/null; then
    echo "⚠️  MySQL is not running. Please start MySQL service."
    echo "   On macOS: brew services start mysql"
    echo "   On Linux: sudo systemctl start mysql"
    echo "   On Windows: Start MySQL service from Services"
fi

# Navigate to CLI directory
cd "$(dirname "$0")"

# Install dependencies
echo "📦 Installing dependencies..."
go mod tidy

# Check if database connection is configured
if grep -q "root:password" main.go; then
    echo "⚠️  Please update the database connection string in main.go"
    echo "   Change: root:password@tcp(localhost:3306)"
    echo "   To: root:YOUR_PASSWORD@tcp(localhost:3306)"
    echo ""
    read -p "Press Enter to continue anyway (database connection will fail)..."
fi

# Run the CLI application
echo "🎯 Launching FGX CLI..."
echo "======================="
go run main.go







