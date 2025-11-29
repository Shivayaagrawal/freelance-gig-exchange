-- =====================================================
-- INSERT 100 MORE TUPLES IN ALL TABLES - ROUND 2
-- =====================================================
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (412-511)
-- =====================================================
INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
VALUES
('Rohan Kumar', 'rohan.kumar412@example.com', '9812345412', 'Delhi', 'Expert', 4.6, 48, '2021-03-20'),
('Sneha Mehta', 'sneha.mehta413@example.com', '9823456413', 'Mumbai', 'Intermediate', 4.3, 26, '2022-05-25'),
('Amit Singh', 'amit.singh414@example.com', '9834567414', 'Kolkata', 'Beginner', 4.0, 10, '2023-02-25'),
('Kavita Gupta', 'kavita.gupta415@example.com', '9845678415', 'Bangalore', 'Expert', 4.7, 56, '2020-12-20'),
('Rajesh Patel', 'rajesh.patel416@example.com', '9856789416', 'Ahmedabad', 'Intermediate', 4.2, 29, '2022-07-28'),
('Priya Reddy', 'priya.reddy417@example.com', '9867890417', 'Hyderabad', 'Expert', 4.5, 44, '2021-06-30'),
('Vikram Sharma', 'vikram.sharma418@example.com', '9878901418', 'Pune', 'Beginner', 3.9, 11, '2023-05-05'),
('Neha Verma', 'neha.verma419@example.com', '9889012419', 'Chennai', 'Intermediate', 4.4, 34, '2022-03-25'),
('Deepak Joshi', 'deepak.joshi420@example.com', '9890123420', 'Noida', 'Expert', 4.6, 51, '2021-09-28'),
('Anjali Nair', 'anjali.nair421@example.com', '9801234421', 'Kochi', 'Intermediate', 4.3, 37, '2022-02-15'),
('Suresh Desai', 'suresh.desai422@example.com', '9812345422', 'Surat', 'Expert', 4.7, 49, '2021-04-25'),
('Divya Iyer', 'divya.iyer423@example.com', '9823456423', 'Bangalore', 'Intermediate', 4.2, 28, '2022-06-18'),
('Kunal Agarwal', 'kunal.agarwal424@example.com', '9834567424', 'Delhi', 'Beginner', 3.8, 12, '2023-03-22'),
('Richa Malhotra', 'richa.malhotra425@example.com', '9845678425', 'Mumbai', 'Expert', 4.8, 58, '2020-12-05'),
('Yash Khanna', 'yash.khanna426@example.com', '9856789426', 'Pune', 'Intermediate', 4.1, 31, '2022-08-25'),
('Isha Rao', 'isha.rao427@example.com', '9867890427', 'Hyderabad', 'Expert', 4.6, 43, '2021-08-05'),
('Rohit Kapoor', 'rohit.kapoor428@example.com', '9878901428', 'Chennai', 'Beginner', 3.9, 13, '2023-05-28'),
('Shreya Menon', 'shreya.menon429@example.com', '9889012429', 'Kolkata', 'Intermediate', 4.3, 35, '2022-04-28'),
('Nikhil Nair', 'nikhil.nair430@example.com', '9890123430', 'Ahmedabad', 'Expert', 4.5, 50, '2021-10-18'),
('Meera Krishnan', 'meera.krishnan431@example.com', '9801234431', 'Bangalore', 'Intermediate', 4.4, 38, '2022-03-28'),
('Aditya Shah', 'aditya.shah432@example.com', '9812345432', 'Mumbai', 'Expert', 4.7, 47, '2021-05-25'),
('Pooja Iyer', 'pooja.iyer433@example.com', '9823456433', 'Chennai', 'Intermediate', 4.2, 30, '2022-08-05'),
('Varun Menon', 'varun.menon434@example.com', '9834567434', 'Delhi', 'Beginner', 3.8, 14, '2023-04-25'),
('Ananya Iyer', 'ananya.iyer435@example.com', '9845678435', 'Bangalore', 'Expert', 4.8, 57, '2020-12-28'),
('Siddharth Rao', 'siddharth.rao436@example.com', '9856789436', 'Pune', 'Intermediate', 4.1, 32, '2022-09-18'),
('Isha Patel', 'isha.patel437@example.com', '9867890437', 'Ahmedabad', 'Expert', 4.6, 42, '2021-08-25'),
('Kunal Nair', 'kunal.nair438@example.com', '9878901438', 'Kochi', 'Beginner', 3.9, 15, '2023-06-18'),
('Riya Krishnan', 'riya.krishnan439@example.com', '9889012439', 'Bangalore', 'Intermediate', 4.3, 36, '2022-06-05'),
('Arjun Shah', 'arjun.shah440@example.com', '9890123440', 'Surat', 'Expert', 4.5, 49, '2021-11-28'),
('Sanjana Iyer', 'sanjana.iyer441@example.com', '9801234441', 'Chennai', 'Intermediate', 4.4, 39, '2022-04-18'),
('Rohan Desai', 'rohan.desai442@example.com', '9812345442', 'Surat', 'Expert', 4.7, 46, '2021-07-05'),
('Tanvi Iyer', 'tanvi.iyer443@example.com', '9823456443', 'Chennai', 'Intermediate', 4.2, 30, '2022-09-05'),
('Harsh Khanna', 'harsh.khanna444@example.com', '9834567444', 'Delhi', 'Beginner', 3.9, 12, '2023-03-05'),
('Aishwarya Rao', 'aishwarya.rao445@example.com', '9845678445', 'Hyderabad', 'Expert', 4.8, 59, '2020-12-25'),
('Vivek Kapoor', 'vivek.kapoor446@example.com', '9856789446', 'Pune', 'Intermediate', 4.1, 33, '2022-10-22'),
('Nisha Menon', 'nisha.menon447@example.com', '9867890447', 'Kolkata', 'Expert', 4.6, 43, '2021-09-05'),
('Abhishek Nair', 'abhishek.nair448@example.com', '9878901448', 'Bangalore', 'Beginner', 3.8, 16, '2023-07-22'),
('Sakshi Krishnan', 'sakshi.krishnan449@example.com', '9889012449', 'Mumbai', 'Intermediate', 4.3, 37, '2022-07-05'),
('Karan Shah', 'karan.shah450@example.com', '9890123450', 'Ahmedabad', 'Expert', 4.5, 48, '2021-12-22'),
('Preeti Reddy', 'preeti.reddy451@example.com', '9801234451', 'Hyderabad', 'Intermediate', 4.4, 40, '2022-05-25'),
('Manish Menon', 'manish.menon452@example.com', '9812345452', 'Chennai', 'Expert', 4.7, 45, '2021-08-05'),
('Swati Iyer', 'swati.iyer453@example.com', '9823456453', 'Bangalore', 'Intermediate', 4.2, 31, '2022-10-05'),
('Gaurav Rao', 'gaurav.rao454@example.com', '9834567454', 'Pune', 'Beginner', 3.9, 17, '2023-07-05'),
('Richa Malhotra', 'richa.malhotra455@example.com', '9845678455', 'Mumbai', 'Expert', 4.8, 56, '2021-01-18'),
('Yash Agarwal', 'yash.agarwal456@example.com', '9856789456', 'Delhi', 'Intermediate', 4.1, 34, '2022-11-28'),
('Anushka Patel', 'anushka.patel457@example.com', '9867890457', 'Ahmedabad', 'Expert', 4.6, 41, '2021-10-12'),
('Rishabh Nair', 'rishabh.nair458@example.com', '9878901458', 'Kochi', 'Beginner', 3.8, 18, '2023-08-25'),
('Shruti Krishnan', 'shruti.krishnan459@example.com', '9889012459', 'Bangalore', 'Intermediate', 4.3, 38, '2022-08-05'),
('Dhruv Shah', 'dhruv.shah460@example.com', '9890123460', 'Surat', 'Expert', 4.5, 47, '2022-02-05'),
('Ishita Iyer', 'ishita.iyer461@example.com', '9801234461', 'Chennai', 'Intermediate', 4.4, 41, '2022-06-22'),
('Akash Menon', 'akash.menon462@example.com', '9812345462', 'Kolkata', 'Expert', 4.7, 44, '2021-10-05'),
('Disha Rao', 'disha.rao463@example.com', '9823456463', 'Hyderabad', 'Intermediate', 4.2, 32, '2022-11-05'),
('Rajat Kapoor', 'rajat.kapoor464@example.com', '9834567464', 'Pune', 'Beginner', 3.9, 19, '2023-08-05'),
('Maya Malhotra', 'maya.malhotra465@example.com', '9845678465', 'Mumbai', 'Expert', 4.8, 55, '2021-02-25'),
('Sahil Agarwal', 'sahil.agarwal466@example.com', '9856789466', 'Delhi', 'Intermediate', 4.1, 35, '2022-12-18'),
('Zara Patel', 'zara.patel467@example.com', '9867890467', 'Ahmedabad', 'Expert', 4.6, 40, '2021-11-28'),
('Ravi Nair', 'ravi.nair468@example.com', '9878901468', 'Kochi', 'Beginner', 3.8, 20, '2023-09-22'),
('Kritika Krishnan', 'kritika.krishnan469@example.com', '9889012469', 'Bangalore', 'Intermediate', 4.3, 39, '2022-09-05'),
('Surya Shah', 'surya.shah470@example.com', '9890123470', 'Surat', 'Expert', 4.5, 46, '2022-03-05'),
('Aarav Iyer', 'aarav.iyer471@example.com', '9801234471', 'Chennai', 'Intermediate', 4.4, 42, '2022-08-25'),
('Ishaan Menon', 'ishaan.menon472@example.com', '9812345472', 'Kolkata', 'Expert', 4.7, 43, '2021-11-05'),
('Avni Rao', 'avni.rao473@example.com', '9823456473', 'Hyderabad', 'Intermediate', 4.2, 33, '2022-12-05'),
('Vihaan Kapoor', 'vihaan.kapoor474@example.com', '9834567474', 'Pune', 'Beginner', 3.9, 21, '2023-09-05'),
('Anika Malhotra', 'anika.malhotra475@example.com', '9845678475', 'Mumbai', 'Expert', 4.8, 54, '2021-03-05'),
('Advik Agarwal', 'advik.agarwal476@example.com', '9856789476', 'Delhi', 'Intermediate', 4.1, 36, '2023-01-25'),
('Myra Patel', 'myra.patel477@example.com', '9867890477', 'Ahmedabad', 'Expert', 4.6, 39, '2022-01-05'),
('Aryan Nair', 'aryan.nair478@example.com', '9878901478', 'Kochi', 'Beginner', 3.8, 22, '2023-10-22'),
('Kiara Krishnan', 'kiara.krishnan479@example.com', '9889012479', 'Bangalore', 'Intermediate', 4.3, 40, '2022-10-05'),
('Reyansh Shah', 'reyansh.shah480@example.com', '9890123480', 'Surat', 'Expert', 4.5, 45, '2022-04-05'),
('Aadhya Iyer', 'aadhya.iyer481@example.com', '9801234481', 'Chennai', 'Intermediate', 4.4, 43, '2022-09-05'),
('Arnav Menon', 'arnav.menon482@example.com', '9812345482', 'Kolkata', 'Expert', 4.7, 42, '2021-12-05'),
('Saanvi Rao', 'saanvi.rao483@example.com', '9823456483', 'Hyderabad', 'Intermediate', 4.2, 34, '2023-01-05'),
('Atharv Kapoor', 'atharv.kapoor484@example.com', '9834567484', 'Pune', 'Beginner', 3.9, 23, '2023-10-05'),
('Anvi Malhotra', 'anvi.malhotra485@example.com', '9845678485', 'Mumbai', 'Expert', 4.8, 53, '2021-04-05'),
('Pranav Agarwal', 'pranav.agarwal486@example.com', '9856789486', 'Delhi', 'Intermediate', 4.1, 37, '2023-02-22'),
('Diya Patel', 'diya.patel487@example.com', '9867890487', 'Ahmedabad', 'Expert', 4.6, 38, '2022-02-05'),
('Vivaan Nair', 'vivaan.nair488@example.com', '9878901488', 'Kochi', 'Beginner', 3.8, 24, '2023-11-22'),
('Aarohi Krishnan', 'aarohi.krishnan489@example.com', '9889012489', 'Bangalore', 'Intermediate', 4.3, 41, '2022-11-05'),
('Kiaan Shah', 'kiaan.shah490@example.com', '9890123490', 'Surat', 'Expert', 4.5, 44, '2022-05-05'),
('Anay Iyer', 'anay.iyer491@example.com', '9801234491', 'Chennai', 'Intermediate', 4.4, 44, '2022-10-05'),
('Ahaan Menon', 'ahaan.menon492@example.com', '9812345492', 'Kolkata', 'Expert', 4.7, 41, '2022-01-22'),
('Aaradhya Rao', 'aaradhya.rao493@example.com', '9823456493', 'Hyderabad', 'Intermediate', 4.2, 35, '2023-02-05'),
('Arhaan Kapoor', 'arhaan.kapoor494@example.com', '9834567494', 'Pune', 'Beginner', 3.9, 25, '2023-11-05'),
('Avyaan Malhotra', 'avyaan.malhotra495@example.com', '9845678495', 'Mumbai', 'Expert', 4.8, 52, '2021-05-05'),
('Ayaan Agarwal', 'ayaan.agarwal496@example.com', '9856789496', 'Delhi', 'Intermediate', 4.1, 38, '2023-03-22'),
('Aarush Patel', 'aarush.patel497@example.com', '9867890497', 'Ahmedabad', 'Expert', 4.6, 37, '2022-03-22'),
('Aadvik Nair', 'aadvik.nair498@example.com', '9878901498', 'Kochi', 'Beginner', 3.8, 26, '2023-12-22'),
('Aarav Krishnan', 'aarav.krishnan499@example.com', '9889012499', 'Bangalore', 'Intermediate', 4.3, 42, '2022-12-05'),
('Aarush Krishnan', 'aarush.krishnan500@example.com', '9890123500', 'Surat', 'Expert', 4.5, 43, '2022-06-05'),
('Aariz Shah', 'aariz.shah501@example.com', '9801234501', 'Chennai', 'Intermediate', 4.4, 45, '2022-11-22'),
('Aaryan Iyer', 'aaryan.iyer502@example.com', '9812345502', 'Kolkata', 'Expert', 4.7, 40, '2022-02-05'),
('Aaradhya Menon', 'aaradhya.menon503@example.com', '9823456503', 'Delhi', 'Intermediate', 4.2, 36, '2023-03-05'),
('Aarav Rao', 'aarav.rao504@example.com', '9834567504', 'Pune', 'Beginner', 3.9, 27, '2023-12-05'),
('Aarush Kapoor', 'aarush.kapoor505@example.com', '9845678505', 'Mumbai', 'Expert', 4.8, 51, '2021-06-05'),
('Aariz Malhotra', 'aariz.malhotra506@example.com', '9856789506', 'Delhi', 'Intermediate', 4.1, 39, '2023-04-22'),
('Aaryan Agarwal', 'aaryan.agarwal507@example.com', '9867890507', 'Ahmedabad', 'Expert', 4.6, 36, '2022-04-22'),
('Aaradhya Patel', 'aaradhya.patel508@example.com', '9878901508', 'Kochi', 'Beginner', 3.8, 28, '2024-01-05'),
('Aarav Nair', 'aarav.nair509@example.com', '9889012509', 'Bangalore', 'Intermediate', 4.3, 43, '2023-01-05'),
('Aarush Krishnan', 'aarush.krishnan510@example.com', '9890123510', 'Surat', 'Expert', 4.5, 42, '2022-07-05'),
('Aariz Shah', 'aariz.shah511@example.com', '9801234511', 'Chennai', 'Intermediate', 4.4, 46, '2022-12-22');

-- =====================================================
-- 100 MORE CLIENTS (387-486)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
VALUES
('DataHub Pro Analytics', 'contact@datahubpro387.com', 'DataHub Pro Analytics Pvt Ltd', 'Bangalore', '2022-09-30'),
('WebHub Pro Studio', 'info@webhubpro388.com', 'WebHub Pro Studio', 'Delhi', '2021-10-05'),
('AppHub Pro Solutions', 'contact@apphubpro389.com', 'AppHub Pro Solutions', 'Pune', '2022-11-10'),
('CloudHub Pro Technologies', 'info@cloudhubpro390.com', 'CloudHub Pro Technologies', 'Chennai', '2021-12-15'),
('TechHub Pro Systems', 'contact@techhubpro391.com', 'TechHub Pro Systems', 'Hyderabad', '2022-01-20'),
('Digital Hub Pro', 'info@digitalhubpro392.com', 'Digital Hub Pro', 'Kolkata', '2021-02-25'),
('InnovateHub Pro Labs', 'contact@innovatehubpro393.com', 'InnovateHub Pro Labs', 'Ahmedabad', '2022-03-30'),
('CodeHub Pro Technologies', 'info@codehubpro394.com', 'CodeHub Pro Technologies', 'Noida', '2021-04-05'),
('DataLink Pro Analytics', 'contact@datalinkpro395.com', 'DataLink Pro Analytics', 'Kochi', '2022-05-10'),
('WebLink Pro Studio', 'info@weblinkpro396.com', 'WebLink Pro Studio', 'Surat', '2021-06-15'),
('AppLink Pro Solutions', 'contact@applinkpro397.com', 'AppLink Pro Solutions', 'Mumbai', '2022-07-20'),
('CloudLink Pro Technologies', 'info@cloudlinkpro398.com', 'CloudLink Pro Technologies', 'Bangalore', '2021-08-25'),
('TechLink Pro Systems', 'contact@techlinkpro399.com', 'TechLink Pro Systems', 'Delhi', '2022-09-30'),
('Digital Link Pro', 'info@digitallinkpro400.com', 'Digital Link Pro', 'Pune', '2021-10-05'),
('InnovateLink Pro Labs', 'contact@innovatelinkpro401.com', 'InnovateLink Pro Labs', 'Chennai', '2022-11-10'),
('CodeLink Pro Technologies', 'info@codelinkpro402.com', 'CodeLink Pro Technologies', 'Hyderabad', '2021-12-15'),
('DataNet Pro Analytics', 'contact@datanetpro403.com', 'DataNet Pro Analytics', 'Kolkata', '2022-01-20'),
('WebNet Pro Studio', 'info@webnetpro404.com', 'WebNet Pro Studio', 'Ahmedabad', '2021-02-25'),
('AppNet Pro Solutions', 'contact@appnetpro405.com', 'AppNet Pro Solutions', 'Noida', '2022-03-30'),
('CloudNet Pro Technologies', 'info@cloudnetpro406.com', 'CloudNet Pro Technologies', 'Kochi', '2021-04-05'),
('TechNet Pro Systems', 'contact@technetpro407.com', 'TechNet Pro Systems', 'Surat', '2022-05-10'),
('Digital Net Pro', 'info@digitalnetpro408.com', 'Digital Net Pro', 'Mumbai', '2021-06-15'),
('InnovateNet Pro Labs', 'contact@innovatetnetpro409.com', 'InnovateNet Pro Labs', 'Bangalore', '2022-07-20'),
('CodeNet Pro Technologies', 'info@codenetpro410.com', 'CodeNet Pro Technologies', 'Delhi', '2021-08-25'),
('DataGrid Pro Analytics', 'contact@datagridpro411.com', 'DataGrid Pro Analytics', 'Pune', '2022-09-30'),
('WebGrid Pro Studio', 'info@webgridpro412.com', 'WebGrid Pro Studio', 'Chennai', '2021-10-05'),
('AppGrid Pro Solutions', 'contact@appgridpro413.com', 'AppGrid Pro Solutions', 'Hyderabad', '2022-11-10'),
('CloudGrid Pro Technologies', 'info@cloudgridpro414.com', 'CloudGrid Pro Technologies', 'Kolkata', '2021-12-15'),
('TechGrid Pro Systems', 'contact@techgridpro415.com', 'TechGrid Pro Systems', 'Ahmedabad', '2022-01-20'),
('Digital Grid Pro', 'info@digitalgridpro416.com', 'Digital Grid Pro', 'Noida', '2021-02-25'),
('InnovateGrid Pro Labs', 'contact@innovategridpro417.com', 'InnovateGrid Pro Labs', 'Kochi', '2022-03-30'),
('CodeGrid Pro Technologies', 'info@codegridpro418.com', 'CodeGrid Pro Technologies', 'Surat', '2021-04-05'),
('DataBase Pro Analytics', 'contact@databasepro419.com', 'DataBase Pro Analytics', 'Mumbai', '2022-05-10'),
('WebBase Pro Studio', 'info@webbasepro420.com', 'WebBase Pro Studio', 'Bangalore', '2021-06-15'),
('AppBase Pro Solutions', 'contact@appbasepro421.com', 'AppBase Pro Solutions', 'Delhi', '2022-07-20'),
('CloudBase Pro Technologies', 'info@cloudbasepro422.com', 'CloudBase Pro Technologies', 'Pune', '2021-08-25'),
('TechBase Pro Systems', 'contact@techbasepro423.com', 'TechBase Pro Systems', 'Chennai', '2022-09-30'),
('Digital Base Pro', 'info@digitalbasepro424.com', 'Digital Base Pro', 'Hyderabad', '2021-10-05'),
('InnovateBase Pro Labs', 'contact@innovatebasepro425.com', 'InnovateBase Pro Labs', 'Kolkata', '2022-11-10'),
('CodeBase Pro Technologies', 'info@codebasepro426.com', 'CodeBase Pro Technologies', 'Ahmedabad', '2021-12-15'),
('DataCloud Pro Analytics', 'contact@datacloudpro427.com', 'DataCloud Pro Analytics', 'Noida', '2022-01-20'),
('WebCloud Pro Studio', 'info@webcloudpro428.com', 'WebCloud Pro Studio', 'Kochi', '2021-02-25'),
('AppCloud Pro Solutions', 'contact@appcloudpro429.com', 'AppCloud Pro Solutions', 'Surat', '2022-03-30'),
('CloudCloud Pro Technologies', 'info@cloudcloudpro430.com', 'CloudCloud Pro Technologies', 'Mumbai', '2021-04-05'),
('TechCloud Pro Systems', 'contact@techcloudpro431.com', 'TechCloud Pro Systems', 'Bangalore', '2022-05-10'),
('Digital Cloud Pro', 'info@digitalcloudpro432.com', 'Digital Cloud Pro', 'Delhi', '2021-06-15'),
('InnovateCloud Pro Labs', 'contact@innovatecloudpro433.com', 'InnovateCloud Pro Labs', 'Pune', '2022-07-20'),
('CodeCloud Pro Technologies', 'info@codecloudpro434.com', 'CodeCloud Pro Technologies', 'Chennai', '2021-08-25'),
('DataSpace Pro Analytics', 'contact@dataspacepro435.com', 'DataSpace Pro Analytics', 'Hyderabad', '2022-09-30'),
('WebSpace Pro Studio', 'info@webspacepro436.com', 'WebSpace Pro Studio', 'Kolkata', '2021-10-05'),
('AppSpace Pro Solutions', 'contact@appspacepro437.com', 'AppSpace Pro Solutions', 'Ahmedabad', '2022-11-10'),
('CloudSpace Pro Technologies', 'info@cloudspacepro438.com', 'CloudSpace Pro Technologies', 'Noida', '2021-12-15'),
('TechSpace Pro Systems', 'contact@techspacepro439.com', 'TechSpace Pro Systems', 'Kochi', '2022-01-20'),
('Digital Space Pro', 'info@digitalspacepro440.com', 'Digital Space Pro', 'Surat', '2021-02-25'),
('InnovateSpace Pro Labs', 'contact@innovatespacepro441.com', 'InnovateSpace Pro Labs', 'Mumbai', '2022-03-30'),
('CodeSpace Pro Technologies', 'info@codespacepro442.com', 'CodeSpace Pro Technologies', 'Bangalore', '2021-04-05'),
('DataZone Pro Analytics', 'contact@datazonepro443.com', 'DataZone Pro Analytics', 'Delhi', '2022-05-10'),
('WebZone Pro Studio', 'info@webzonepro444.com', 'WebZone Pro Studio', 'Pune', '2021-06-15'),
('AppZone Pro Solutions', 'contact@appzonepro445.com', 'AppZone Pro Solutions', 'Chennai', '2022-07-20'),
('CloudZone Pro Technologies', 'info@cloudzonepro446.com', 'CloudZone Pro Technologies', 'Hyderabad', '2021-08-25'),
('TechZone Pro Systems', 'contact@techzonepro447.com', 'TechZone Pro Systems', 'Kolkata', '2022-09-30'),
('Digital Zone Pro', 'info@digitalzonepro448.com', 'Digital Zone Pro', 'Ahmedabad', '2021-10-05'),
('InnovateZone Pro Labs', 'contact@innovatezonepro449.com', 'InnovateZone Pro Labs', 'Noida', '2022-11-10'),
('CodeZone Pro Technologies', 'info@codezonepro450.com', 'CodeZone Pro Technologies', 'Kochi', '2021-12-15'),
('DataPoint Pro Analytics', 'contact@datapointpro451.com', 'DataPoint Pro Analytics', 'Surat', '2022-01-20'),
('WebPoint Pro Studio', 'info@webpointpro452.com', 'WebPoint Pro Studio', 'Mumbai', '2021-02-25'),
('AppPoint Pro Solutions', 'contact@apppointpro453.com', 'AppPoint Pro Solutions', 'Bangalore', '2022-03-30'),
('CloudPoint Pro Technologies', 'info@cloudpointpro454.com', 'CloudPoint Pro Technologies', 'Delhi', '2021-04-05'),
('TechPoint Pro Systems', 'contact@techpointpro455.com', 'TechPoint Pro Systems', 'Pune', '2022-05-10'),
('Digital Point Pro', 'info@digitalpointpro456.com', 'Digital Point Pro', 'Chennai', '2021-06-15'),
('InnovatePoint Pro Labs', 'contact@innovatepointpro457.com', 'InnovatePoint Pro Labs', 'Hyderabad', '2022-07-20'),
('CodePoint Pro Technologies', 'info@codepointpro458.com', 'CodePoint Pro Technologies', 'Kolkata', '2021-08-25'),
('DataMark Pro Analytics', 'contact@datamarkpro459.com', 'DataMark Pro Analytics', 'Ahmedabad', '2022-09-30'),
('WebMark Pro Studio', 'info@webmarkpro460.com', 'WebMark Pro Studio', 'Noida', '2021-10-05'),
('AppMark Pro Solutions', 'contact@appmarkpro461.com', 'AppMark Pro Solutions', 'Kochi', '2022-11-10'),
('CloudMark Pro Technologies', 'info@cloudmarkpro462.com', 'CloudMark Pro Technologies', 'Surat', '2021-12-15'),
('TechMark Pro Systems', 'contact@techmarkpro463.com', 'TechMark Pro Systems', 'Mumbai', '2022-01-20'),
('Digital Mark Pro', 'info@digitalmarkpro464.com', 'Digital Mark Pro', 'Bangalore', '2021-02-25'),
('InnovateMark Pro Labs', 'contact@innovatemarkpro465.com', 'InnovateMark Pro Labs', 'Delhi', '2022-03-30'),
('CodeMark Pro Technologies', 'info@codemarkpro466.com', 'CodeMark Pro Technologies', 'Pune', '2021-04-05'),
('DataLine Pro Analytics', 'contact@datalinepro467.com', 'DataLine Pro Analytics', 'Chennai', '2022-05-10'),
('WebLine Pro Studio', 'info@weblinepro468.com', 'WebLine Pro Studio', 'Hyderabad', '2021-06-15'),
('AppLine Pro Solutions', 'contact@applinepro469.com', 'AppLine Pro Solutions', 'Kolkata', '2022-07-20'),
('CloudLine Pro Technologies', 'info@cloudlinepro470.com', 'CloudLine Pro Technologies', 'Ahmedabad', '2021-08-25'),
('TechLine Pro Systems', 'contact@techlinepro471.com', 'TechLine Pro Systems', 'Noida', '2022-09-30'),
('Digital Line Pro', 'info@digitallinepro472.com', 'Digital Line Pro', 'Kochi', '2021-10-05'),
('InnovateLine Pro Labs', 'contact@innovatelinepro473.com', 'InnovateLine Pro Labs', 'Surat', '2022-11-10'),
('CodeLine Pro Technologies', 'info@codelinepro474.com', 'CodeLine Pro Technologies', 'Mumbai', '2021-12-15'),
('DataCore Pro Analytics', 'contact@datacorepro475.com', 'DataCore Pro Analytics', 'Bangalore', '2022-01-20'),
('WebCore Pro Studio', 'info@webcorepro476.com', 'WebCore Pro Studio', 'Delhi', '2021-02-25'),
('AppCore Pro Solutions', 'contact@appcorepro477.com', 'AppCore Pro Solutions', 'Pune', '2022-03-30'),
('CloudCore Pro Technologies', 'info@cloudcorepro478.com', 'CloudCore Pro Technologies', 'Chennai', '2021-04-05'),
('TechCore Pro Systems', 'contact@techcorepro479.com', 'TechCore Pro Systems', 'Hyderabad', '2022-05-10'),
('Digital Core Pro', 'info@digitalcorepro480.com', 'Digital Core Pro', 'Kolkata', '2021-06-15'),
('InnovateCore Pro Labs', 'contact@innovatecorepro481.com', 'InnovateCore Pro Labs', 'Ahmedabad', '2022-07-20'),
('CodeCore Pro Technologies', 'info@codecorepro482.com', 'CodeCore Pro Technologies', 'Noida', '2021-08-25'),
('DataForce Pro Analytics', 'contact@dataforcepro483.com', 'DataForce Pro Analytics', 'Kochi', '2022-09-30'),
('WebForce Pro Studio', 'info@webforcepro484.com', 'WebForce Pro Studio', 'Surat', '2021-10-05'),
('AppForce Pro Solutions', 'contact@appforcepro485.com', 'AppForce Pro Solutions', 'Mumbai', '2022-11-10'),
('CloudForce Pro Technologies', 'info@cloudforcepro486.com', 'CloudForce Pro Technologies', 'Bangalore', '2021-12-15');

-- =====================================================
-- 100 MORE GIGS (216-315)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(1 + RAND() * 486) as client_id,
    FLOOR(1 + RAND() * 8) as category_id,
    CONCAT('Project ', n, ' - ', 
           CASE FLOOR(1 + RAND() * 4)
               WHEN 1 THEN 'Web Development'
               WHEN 2 THEN 'Mobile App'
               WHEN 3 THEN 'Data Analytics'
               ELSE 'UI/UX Design'
           END) as title,
    CONCAT('Comprehensive project description for project ', n, ' with detailed requirements and specifications.') as description,
    FLOOR(40000 + RAND() * 260000) as budget,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 90) DAY) as posted_date,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(90 + RAND() * 120) DAY) as deadline_date,
    CASE FLOOR(1 + RAND() * 4)
        WHEN 1 THEN 'Open'
        WHEN 2 THEN 'In Progress'
        WHEN 3 THEN 'Completed'
        ELSE 'Cancelled'
    END as status
FROM (
    SELECT 216 as n UNION SELECT 217 UNION SELECT 218 UNION SELECT 219 UNION SELECT 220
    UNION SELECT 221 UNION SELECT 222 UNION SELECT 223 UNION SELECT 224 UNION SELECT 225
    UNION SELECT 226 UNION SELECT 227 UNION SELECT 228 UNION SELECT 229 UNION SELECT 230
    UNION SELECT 231 UNION SELECT 232 UNION SELECT 233 UNION SELECT 234 UNION SELECT 235
    UNION SELECT 236 UNION SELECT 237 UNION SELECT 238 UNION SELECT 239 UNION SELECT 240
    UNION SELECT 241 UNION SELECT 242 UNION SELECT 243 UNION SELECT 244 UNION SELECT 245
    UNION SELECT 246 UNION SELECT 247 UNION SELECT 248 UNION SELECT 249 UNION SELECT 250
    UNION SELECT 251 UNION SELECT 252 UNION SELECT 253 UNION SELECT 254 UNION SELECT 255
    UNION SELECT 256 UNION SELECT 257 UNION SELECT 258 UNION SELECT 259 UNION SELECT 260
    UNION SELECT 261 UNION SELECT 262 UNION SELECT 263 UNION SELECT 264 UNION SELECT 265
    UNION SELECT 266 UNION SELECT 267 UNION SELECT 268 UNION SELECT 269 UNION SELECT 270
    UNION SELECT 271 UNION SELECT 272 UNION SELECT 273 UNION SELECT 274 UNION SELECT 275
    UNION SELECT 276 UNION SELECT 277 UNION SELECT 278 UNION SELECT 279 UNION SELECT 280
    UNION SELECT 281 UNION SELECT 282 UNION SELECT 283 UNION SELECT 284 UNION SELECT 285
    UNION SELECT 286 UNION SELECT 287 UNION SELECT 288 UNION SELECT 289 UNION SELECT 290
    UNION SELECT 291 UNION SELECT 292 UNION SELECT 293 UNION SELECT 294 UNION SELECT 295
    UNION SELECT 296 UNION SELECT 297 UNION SELECT 298 UNION SELECT 299 UNION SELECT 300
    UNION SELECT 301 UNION SELECT 302 UNION SELECT 303 UNION SELECT 304 UNION SELECT 305
    UNION SELECT 306 UNION SELECT 307 UNION SELECT 308 UNION SELECT 309 UNION SELECT 310
    UNION SELECT 311 UNION SELECT 312 UNION SELECT 313 UNION SELECT 314 UNION SELECT 315
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (266-365)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 315) as gig_id,
    FLOOR(1 + RAND() * 511) as freelancer_id,
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 266 as n UNION SELECT 267 UNION SELECT 268 UNION SELECT 269 UNION SELECT 270
    UNION SELECT 271 UNION SELECT 272 UNION SELECT 273 UNION SELECT 274 UNION SELECT 275
    UNION SELECT 276 UNION SELECT 277 UNION SELECT 278 UNION SELECT 279 UNION SELECT 280
    UNION SELECT 281 UNION SELECT 282 UNION SELECT 283 UNION SELECT 284 UNION SELECT 285
    UNION SELECT 286 UNION SELECT 287 UNION SELECT 288 UNION SELECT 289 UNION SELECT 290
    UNION SELECT 291 UNION SELECT 292 UNION SELECT 293 UNION SELECT 294 UNION SELECT 295
    UNION SELECT 296 UNION SELECT 297 UNION SELECT 298 UNION SELECT 299 UNION SELECT 300
    UNION SELECT 301 UNION SELECT 302 UNION SELECT 303 UNION SELECT 304 UNION SELECT 305
    UNION SELECT 306 UNION SELECT 307 UNION SELECT 308 UNION SELECT 309 UNION SELECT 310
    UNION SELECT 311 UNION SELECT 312 UNION SELECT 313 UNION SELECT 314 UNION SELECT 315
    UNION SELECT 316 UNION SELECT 317 UNION SELECT 318 UNION SELECT 319 UNION SELECT 320
    UNION SELECT 321 UNION SELECT 322 UNION SELECT 323 UNION SELECT 324 UNION SELECT 325
    UNION SELECT 326 UNION SELECT 327 UNION SELECT 328 UNION SELECT 329 UNION SELECT 330
    UNION SELECT 331 UNION SELECT 332 UNION SELECT 333 UNION SELECT 334 UNION SELECT 335
    UNION SELECT 336 UNION SELECT 337 UNION SELECT 338 UNION SELECT 339 UNION SELECT 340
    UNION SELECT 341 UNION SELECT 342 UNION SELECT 343 UNION SELECT 344 UNION SELECT 345
    UNION SELECT 346 UNION SELECT 347 UNION SELECT 348 UNION SELECT 349 UNION SELECT 350
    UNION SELECT 351 UNION SELECT 352 UNION SELECT 353 UNION SELECT 354 UNION SELECT 355
    UNION SELECT 356 UNION SELECT 357 UNION SELECT 358 UNION SELECT 359 UNION SELECT 360
    UNION SELECT 361 UNION SELECT 362 UNION SELECT 363 UNION SELECT 364 UNION SELECT 365
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (165-264)
-- =====================================================
INSERT IGNORE INTO contracts (application_id, start_date, end_date, work_status, total_payment, milestone_count)
SELECT 
    application_id,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as start_date,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(120 + RAND() * 90) DAY) as end_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Active'
        WHEN 2 THEN 'Completed'
        ELSE 'Cancelled'
    END as work_status,
    FLOOR(30000 + RAND() * 270000) as total_payment,
    FLOOR(1 + RAND() * 5) as milestone_count
FROM applications
WHERE status = 'Approved' AND application_id NOT IN (SELECT application_id FROM contracts)
LIMIT 100;

-- =====================================================
-- 100 MORE PAYMENTS (255-354)
-- =====================================================
INSERT IGNORE INTO payments (contract_id, amount, payment_date, method, status, transaction_id)
SELECT 
    contract_id,
    FLOOR(10000 + RAND() * (total_payment * 0.5)) as amount,
    DATE_ADD(start_date, INTERVAL FLOOR(RAND() * 60) DAY) as payment_date,
    CASE FLOOR(1 + RAND() * 5)
        WHEN 1 THEN 'UPI'
        WHEN 2 THEN 'Bank Transfer'
        WHEN 3 THEN 'Paytm'
        WHEN 4 THEN 'Credit Card'
        ELSE 'Net Banking'
    END as method,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Paid'
        WHEN 2 THEN 'Pending'
        ELSE 'Failed'
    END as status,
    CONCAT('TXN', LPAD(FLOOR(100000 + RAND() * 900000), 6, '0')) as transaction_id
FROM contracts
WHERE contract_id NOT IN (SELECT contract_id FROM payments)
LIMIT 100;

-- =====================================================
-- 100 MORE REVIEWS (117-216)
-- =====================================================
INSERT IGNORE INTO reviews (contract_id, rating, comments, review_date)
SELECT 
    contract_id,
    FLOOR(1 + RAND() * 5) as rating,
    CONCAT('Review comment for contract ', contract_id, '. ', 
           CASE FLOOR(1 + RAND() * 3)
               WHEN 1 THEN 'Excellent work!'
               WHEN 2 THEN 'Good quality.'
               ELSE 'Satisfactory.'
           END) as comments,
    DATE_ADD(end_date, INTERVAL FLOOR(RAND() * 7) DAY) as review_date
FROM contracts
WHERE work_status = 'Completed' AND contract_id NOT IN (SELECT contract_id FROM reviews)
LIMIT 100;

-- =====================================================
-- 100 MORE MESSAGES (250-349)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 486)  -- client_id
        ELSE FLOOR(1 + RAND() * 511)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 511)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 486)  -- client_id
    END as receiver_id,
    CONCAT('Message ', n, ': ', 
           CASE FLOOR(1 + RAND() * 4)
               WHEN 1 THEN 'Hello, I would like to discuss the project.'
               WHEN 2 THEN 'Can we schedule a meeting?'
               WHEN 3 THEN 'I have a question about the requirements.'
               ELSE 'Thank you for your response.'
           END) as message_text,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 180) DAY) + INTERVAL FLOOR(RAND() * 24) HOUR + INTERVAL FLOOR(RAND() * 60) MINUTE as sent_at,
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN TRUE
        ELSE FALSE
    END as is_read
FROM (
    SELECT 250 as n UNION SELECT 251 UNION SELECT 252 UNION SELECT 253 UNION SELECT 254
    UNION SELECT 255 UNION SELECT 256 UNION SELECT 257 UNION SELECT 258 UNION SELECT 259
    UNION SELECT 260 UNION SELECT 261 UNION SELECT 262 UNION SELECT 263 UNION SELECT 264
    UNION SELECT 265 UNION SELECT 266 UNION SELECT 267 UNION SELECT 268 UNION SELECT 269
    UNION SELECT 270 UNION SELECT 271 UNION SELECT 272 UNION SELECT 273 UNION SELECT 274
    UNION SELECT 275 UNION SELECT 276 UNION SELECT 277 UNION SELECT 278 UNION SELECT 279
    UNION SELECT 280 UNION SELECT 281 UNION SELECT 282 UNION SELECT 283 UNION SELECT 284
    UNION SELECT 285 UNION SELECT 286 UNION SELECT 287 UNION SELECT 288 UNION SELECT 289
    UNION SELECT 290 UNION SELECT 291 UNION SELECT 292 UNION SELECT 293 UNION SELECT 294
    UNION SELECT 295 UNION SELECT 296 UNION SELECT 297 UNION SELECT 298 UNION SELECT 299
    UNION SELECT 300 UNION SELECT 301 UNION SELECT 302 UNION SELECT 303 UNION SELECT 304
    UNION SELECT 305 UNION SELECT 306 UNION SELECT 307 UNION SELECT 308 UNION SELECT 309
    UNION SELECT 310 UNION SELECT 311 UNION SELECT 312 UNION SELECT 313 UNION SELECT 314
    UNION SELECT 315 UNION SELECT 316 UNION SELECT 317 UNION SELECT 318 UNION SELECT 319
    UNION SELECT 320 UNION SELECT 321 UNION SELECT 322 UNION SELECT 323 UNION SELECT 324
    UNION SELECT 325 UNION SELECT 326 UNION SELECT 327 UNION SELECT 328 UNION SELECT 329
    UNION SELECT 330 UNION SELECT 331 UNION SELECT 332 UNION SELECT 333 UNION SELECT 334
    UNION SELECT 335 UNION SELECT 336 UNION SELECT 337 UNION SELECT 338 UNION SELECT 339
    UNION SELECT 340 UNION SELECT 341 UNION SELECT 342 UNION SELECT 343 UNION SELECT 344
    UNION SELECT 345 UNION SELECT 346 UNION SELECT 347 UNION SELECT 348 UNION SELECT 349
) as numbers;

COMMIT;

