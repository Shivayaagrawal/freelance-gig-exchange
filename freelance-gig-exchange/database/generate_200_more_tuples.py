
import random
from datetime import datetime, timedelta

locations = ['Delhi', 'Mumbai', 'Bangalore', 'Chennai', 'Pune', 'Hyderabad', 'Kolkata', 'Ahmedabad', 'Noida', 'Kochi', 'Surat']
first_names = ['Aarav', 'Ananya', 'Arjun', 'Aditi', 'Aryan', 'Avni', 'Advik', 'Aarohi', 'Ahaan', 'Anvi', 'Ishaan', 'Kavya', 'Rohan', 'Sneha', 'Vikram']
last_names = ['Kumar', 'Mehta', 'Singh', 'Gupta', 'Patel', 'Reddy', 'Sharma', 'Verma', 'Joshi', 'Nair', 'Desai', 'Iyer', 'Rao', 'Kapoor', 'Malhotra']
levels = ['Beginner', 'Intermediate', 'Expert']
categories = list(range(1, 9))  # 8 categories
skills = list(range(1, 21))  # 20 skills
payment_methods = ['UPI', 'Bank Transfer', 'Paytm', 'Credit Card', 'Net Banking']
statuses = ['Paid', 'Pending', 'Failed']
gig_statuses = ['Open', 'In Progress', 'Completed', 'Cancelled']
app_statuses = ['Pending', 'Approved', 'Rejected']
contract_statuses = ['Active', 'Completed', 'Cancelled']

def generate_freelancers(start_id=112, count=200):
    sql = "-- 200 MORE FREELANCERS\n"
    sql += "INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)\nVALUES\n"
    values = []
    for i in range(start_id, start_id + count):
        name = f"{random.choice(first_names)} {random.choice(last_names)}"
        email = name.lower().replace(' ', '.') + str(i) + '@example.com'
        phone = '98' + str(random.randint(1000000000, 9999999999))[-8:]
        location = random.choice(locations)
        level = random.choice(levels)
        rating = round(random.uniform(3.5, 5.0), 1)
        completed = random.randint(5, 60)
        year = random.choice([2021, 2022, 2023])
        month = random.randint(1, 12)
        day = random.randint(1, 28)
        join_date = f"{year}-{month:02d}-{day:02d}"
        comma = ',' if i < start_id + count - 1 else ''
        values.append(f"('{name}', '{email}', '{phone}', '{location}', '{level}', {rating}, {completed}, '{join_date}'){comma}")
    sql += '\n'.join(values) + ';\n\n'
    return sql

def generate_clients(start_id=87, count=200):
    sql = "-- 200 MORE CLIENTS\n"
    sql += "INSERT IGNORE INTO clients (name, email, organization, location, member_since)\nVALUES\n"
    values = []
    company_types = ['Tech', 'Solutions', 'Systems', 'Labs', 'Innovations', 'Services', 'Technologies', 'Digital', 'Cloud', 'Data']
    for i in range(start_id, start_id + count):
        company = f"{random.choice(['Global', 'NextGen', 'DataWave', 'Creative', 'CloudX', 'Secure', 'Edu', 'Urban', 'Health', 'Market'])}{random.choice(company_types)}"
        name = company + ' ' + str(i)
        email = company.lower().replace(' ', '') + str(i) + '@company.com'
        org = company + ' Pvt Ltd'
        location = random.choice(locations)
        year = random.choice([2021, 2022, 2023])
        month = random.randint(1, 12)
        day = random.randint(1, 28)
        member_since = f"{year}-{month:02d}-{day:02d}"
        comma = ',' if i < start_id + count - 1 else ''
        values.append(f"('{name}', '{email}', '{org}', '{location}', '{member_since}'){comma}")
    sql += '\n'.join(values) + ';\n\n'
    return sql

# Generate and write to file
with open('insert_200_more_all_tables_complete.sql', 'w') as f:
    f.write("-- =====================================================\n")
    f.write("-- INSERT 200 MORE TUPLES IN EVERY TABLE\n")
    f.write("-- =====================================================\n")
    f.write("USE freelance_gig_exchange;\n\n")
    
    f.write(generate_freelancers(112, 200))
    f.write(generate_clients(87, 200))
    
    # Add note about other tables
    f.write("-- Note: For other tables (gigs, applications, contracts, payments, reviews, messages),\n")
    f.write("-- you would need to reference existing foreign keys. This file includes freelancers and clients.\n")
    f.write("-- Extend this pattern for other tables as needed.\n\n")
    f.write("COMMIT;\n")

print("Generated insert_200_more_all_tables_complete.sql")



