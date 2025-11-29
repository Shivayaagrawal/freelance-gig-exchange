# MySQL Database Setup for FGX Project

## Current Issue
MySQL is installed but requires authentication. Here are the steps to fix this:

## Option 1: Reset MySQL Password (Recommended)

1. **Stop MySQL:**
   ```bash
   brew services stop mysql
   ```

2. **Start MySQL in safe mode:**
   ```bash
   /opt/homebrew/opt/mysql/bin/mysqld_safe --skip-grant-tables --skip-networking &
   ```

3. **Connect without password:**
   ```bash
   mysql -u root
   ```

4. **Reset password:**
   ```sql
   USE mysql;
   UPDATE user SET authentication_string=PASSWORD('fgx_password') WHERE User='root';
   FLUSH PRIVILEGES;
   EXIT;
   ```

5. **Restart MySQL normally:**
   ```bash
   pkill -f mysqld
   brew services start mysql
   ```

6. **Test connection:**
   ```bash
   mysql -u root -p
   # Enter password: fgx_password
   ```

## Option 2: Use Existing MySQL Installation

If you have MySQL installed elsewhere, you can use that instead:

1. **Find MySQL installation:**
   ```bash
   which mysql
   ```

2. **Connect with your existing credentials**

## Option 3: Fresh MySQL Installation

1. **Remove all MySQL:**
   ```bash
   brew uninstall mysql
   rm -rf /opt/homebrew/var/mysql
   ```

2. **Install fresh:**
   ```bash
   brew install mysql
   ```

3. **Start and secure:**
   ```bash
   brew services start mysql
   mysql_secure_installation
   ```

## After MySQL is Working

1. **Create database:**
   ```sql
   CREATE DATABASE freelance_gig_exchange;
   USE freelance_gig_exchange;
   ```

2. **Import schema:**
   ```bash
   mysql -u root -p freelance_gig_exchange < database/schema.sql
   ```

3. **Import sample data:**
   ```bash
   mysql -u root -p freelance_gig_exchange < database/sample_data.sql
   ```

4. **Start the API:**
   ```bash
   cd api && go run main.go
   ```

5. **Start React frontend:**
   ```bash
   cd web && npm start
   ```

## Connection Details for Go API

The Go API is configured to connect with:
- Host: localhost
- Port: 3306
- User: root
- Password: fgx_password (or your chosen password)
- Database: freelance_gig_exchange

Update the connection string in `api/main.go` if you use different credentials.