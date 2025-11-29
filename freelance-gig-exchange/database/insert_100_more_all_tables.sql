-- =====================================================
-- INSERT 100 MORE TUPLES IN ALL TABLES
-- =====================================================
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (312-411)
-- =====================================================
INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
VALUES
('Rohan Kumar', 'rohan.kumar312@example.com', '9812345312', 'Delhi', 'Expert', 4.6, 48, '2021-03-15'),
('Sneha Mehta', 'sneha.mehta313@example.com', '9823456313', 'Mumbai', 'Intermediate', 4.3, 26, '2022-05-18'),
('Amit Singh', 'amit.singh314@example.com', '9834567314', 'Kolkata', 'Beginner', 4.0, 10, '2023-02-20'),
('Kavita Gupta', 'kavita.gupta315@example.com', '9845678315', 'Bangalore', 'Expert', 4.7, 56, '2020-12-15'),
('Rajesh Patel', 'rajesh.patel316@example.com', '9856789316', 'Ahmedabad', 'Intermediate', 4.2, 29, '2022-07-22'),
('Priya Reddy', 'priya.reddy317@example.com', '9867890317', 'Hyderabad', 'Expert', 4.5, 44, '2021-06-25'),
('Vikram Sharma', 'vikram.sharma318@example.com', '9878901318', 'Pune', 'Beginner', 3.9, 11, '2023-04-28'),
('Neha Verma', 'neha.verma319@example.com', '9889012319', 'Chennai', 'Intermediate', 4.4, 34, '2022-03-18'),
('Deepak Joshi', 'deepak.joshi320@example.com', '9890123320', 'Noida', 'Expert', 4.6, 51, '2021-09-22'),
('Anjali Nair', 'anjali.nair321@example.com', '9801234321', 'Kochi', 'Intermediate', 4.3, 37, '2022-02-08'),
('Suresh Desai', 'suresh.desai322@example.com', '9812345322', 'Surat', 'Expert', 4.7, 49, '2021-04-18'),
('Divya Iyer', 'divya.iyer323@example.com', '9823456323', 'Bangalore', 'Intermediate', 4.2, 28, '2022-06-12'),
('Kunal Agarwal', 'kunal.agarwal324@example.com', '9834567324', 'Delhi', 'Beginner', 3.8, 12, '2023-03-15'),
('Richa Malhotra', 'richa.malhotra325@example.com', '9845678325', 'Mumbai', 'Expert', 4.8, 58, '2020-11-28'),
('Yash Khanna', 'yash.khanna326@example.com', '9856789326', 'Pune', 'Intermediate', 4.1, 31, '2022-08-18'),
('Isha Rao', 'isha.rao327@example.com', '9867890327', 'Hyderabad', 'Expert', 4.6, 43, '2021-07-28'),
('Rohit Kapoor', 'rohit.kapoor328@example.com', '9878901328', 'Chennai', 'Beginner', 3.9, 13, '2023-05-22'),
('Shreya Menon', 'shreya.menon329@example.com', '9889012329', 'Kolkata', 'Intermediate', 4.3, 35, '2022-04-22'),
('Nikhil Nair', 'nikhil.nair330@example.com', '9890123330', 'Ahmedabad', 'Expert', 4.5, 50, '2021-10-12'),
('Meera Krishnan', 'meera.krishnan331@example.com', '9801234331', 'Bangalore', 'Intermediate', 4.4, 38, '2022-03-22'),
('Aditya Shah', 'aditya.shah332@example.com', '9812345332', 'Mumbai', 'Expert', 4.7, 47, '2021-05-20'),
('Pooja Iyer', 'pooja.iyer333@example.com', '9823456333', 'Chennai', 'Intermediate', 4.2, 30, '2022-07-28'),
('Varun Menon', 'varun.menon334@example.com', '9834567334', 'Delhi', 'Beginner', 3.8, 14, '2023-04-18'),
('Ananya Iyer', 'ananya.iyer335@example.com', '9845678335', 'Bangalore', 'Expert', 4.8, 57, '2020-12-22'),
('Siddharth Rao', 'siddharth.rao336@example.com', '9856789336', 'Pune', 'Intermediate', 4.1, 32, '2022-09-12'),
('Isha Patel', 'isha.patel337@example.com', '9867890337', 'Ahmedabad', 'Expert', 4.6, 42, '2021-08-18'),
('Kunal Nair', 'kunal.nair338@example.com', '9878901338', 'Kochi', 'Beginner', 3.9, 15, '2023-06-12'),
('Riya Krishnan', 'riya.krishnan339@example.com', '9889012339', 'Bangalore', 'Intermediate', 4.3, 36, '2022-05-28'),
('Arjun Shah', 'arjun.shah340@example.com', '9890123340', 'Surat', 'Expert', 4.5, 49, '2021-11-22'),
('Sanjana Iyer', 'sanjana.iyer341@example.com', '9801234341', 'Chennai', 'Intermediate', 4.4, 39, '2022-04-12'),
('Rohan Desai', 'rohan.desai342@example.com', '9812345342', 'Surat', 'Expert', 4.7, 46, '2021-06-28'),
('Tanvi Iyer', 'tanvi.iyer343@example.com', '9823456343', 'Chennai', 'Intermediate', 4.2, 30, '2022-08-25'),
('Harsh Khanna', 'harsh.khanna344@example.com', '9834567344', 'Delhi', 'Beginner', 3.9, 12, '2023-02-25'),
('Aishwarya Rao', 'aishwarya.rao345@example.com', '9845678345', 'Hyderabad', 'Expert', 4.8, 59, '2020-12-18'),
('Vivek Kapoor', 'vivek.kapoor346@example.com', '9856789346', 'Pune', 'Intermediate', 4.1, 33, '2022-10-15'),
('Nisha Menon', 'nisha.menon347@example.com', '9867890347', 'Kolkata', 'Expert', 4.6, 43, '2021-08-22'),
('Abhishek Nair', 'abhishek.nair348@example.com', '9878901348', 'Bangalore', 'Beginner', 3.8, 16, '2023-07-15'),
('Sakshi Krishnan', 'sakshi.krishnan349@example.com', '9889012349', 'Mumbai', 'Intermediate', 4.3, 37, '2022-06-30'),
('Karan Shah', 'karan.shah350@example.com', '9890123350', 'Ahmedabad', 'Expert', 4.5, 48, '2021-12-15'),
('Preeti Reddy', 'preeti.reddy351@example.com', '9801234351', 'Hyderabad', 'Intermediate', 4.4, 40, '2022-05-18'),
('Manish Menon', 'manish.menon352@example.com', '9812345352', 'Chennai', 'Expert', 4.7, 45, '2021-07-25'),
('Swati Iyer', 'swati.iyer353@example.com', '9823456353', 'Bangalore', 'Intermediate', 4.2, 31, '2022-09-20'),
('Gaurav Rao', 'gaurav.rao354@example.com', '9834567354', 'Pune', 'Beginner', 3.9, 17, '2023-06-25'),
('Richa Malhotra', 'richa.malhotra355@example.com', '9845678355', 'Mumbai', 'Expert', 4.8, 56, '2021-01-12'),
('Yash Agarwal', 'yash.agarwal356@example.com', '9856789356', 'Delhi', 'Intermediate', 4.1, 34, '2022-11-22'),
('Anushka Patel', 'anushka.patel357@example.com', '9867890357', 'Ahmedabad', 'Expert', 4.6, 41, '2021-10-05'),
('Rishabh Nair', 'rishabh.nair358@example.com', '9878901358', 'Kochi', 'Beginner', 3.8, 18, '2023-08-18'),
('Shruti Krishnan', 'shruti.krishnan359@example.com', '9889012359', 'Bangalore', 'Intermediate', 4.3, 38, '2022-07-28'),
('Dhruv Shah', 'dhruv.shah360@example.com', '9890123360', 'Surat', 'Expert', 4.5, 47, '2022-01-28'),
('Ishita Iyer', 'ishita.iyer361@example.com', '9801234361', 'Chennai', 'Intermediate', 4.4, 41, '2022-06-15'),
('Akash Menon', 'akash.menon362@example.com', '9812345362', 'Kolkata', 'Expert', 4.7, 44, '2021-09-15'),
('Disha Rao', 'disha.rao363@example.com', '9823456363', 'Hyderabad', 'Intermediate', 4.2, 32, '2022-10-25'),
('Rajat Kapoor', 'rajat.kapoor364@example.com', '9834567364', 'Pune', 'Beginner', 3.9, 19, '2023-07-22'),
('Maya Malhotra', 'maya.malhotra365@example.com', '9845678365', 'Mumbai', 'Expert', 4.8, 55, '2021-02-18'),
('Sahil Agarwal', 'sahil.agarwal366@example.com', '9856789366', 'Delhi', 'Intermediate', 4.1, 35, '2022-12-12'),
('Zara Patel', 'zara.patel367@example.com', '9867890367', 'Ahmedabad', 'Expert', 4.6, 40, '2021-11-22'),
('Ravi Nair', 'ravi.nair368@example.com', '9878901368', 'Kochi', 'Beginner', 3.8, 20, '2023-09-15'),
('Kritika Krishnan', 'kritika.krishnan369@example.com', '9889012369', 'Bangalore', 'Intermediate', 4.3, 39, '2022-08-30'),
('Surya Shah', 'surya.shah370@example.com', '9890123370', 'Surat', 'Expert', 4.5, 46, '2022-02-28'),
('Aarav Iyer', 'aarav.iyer371@example.com', '9801234371', 'Chennai', 'Intermediate', 4.4, 42, '2022-07-12'),
('Ishaan Menon', 'ishaan.menon372@example.com', '9812345372', 'Kolkata', 'Expert', 4.7, 43, '2021-10-28'),
('Avni Rao', 'avni.rao373@example.com', '9823456373', 'Hyderabad', 'Intermediate', 4.2, 33, '2022-11-18'),
('Vihaan Kapoor', 'vihaan.kapoor374@example.com', '9834567374', 'Pune', 'Beginner', 3.9, 21, '2023-08-22'),
('Anika Malhotra', 'anika.malhotra375@example.com', '9845678375', 'Mumbai', 'Expert', 4.8, 54, '2021-03-22'),
('Advik Agarwal', 'advik.agarwal376@example.com', '9856789376', 'Delhi', 'Intermediate', 4.1, 36, '2023-01-18'),
('Myra Patel', 'myra.patel377@example.com', '9867890377', 'Ahmedabad', 'Expert', 4.6, 39, '2021-12-25'),
('Aryan Nair', 'aryan.nair378@example.com', '9878901378', 'Kochi', 'Beginner', 3.8, 22, '2023-10-18'),
('Kiara Krishnan', 'kiara.krishnan379@example.com', '9889012379', 'Bangalore', 'Intermediate', 4.3, 40, '2022-09-25'),
('Reyansh Shah', 'reyansh.shah380@example.com', '9890123380', 'Surat', 'Expert', 4.5, 45, '2022-03-30'),
('Aadhya Iyer', 'aadhya.iyer381@example.com', '9801234381', 'Chennai', 'Intermediate', 4.4, 43, '2022-08-18'),
('Arnav Menon', 'arnav.menon382@example.com', '9812345382', 'Kolkata', 'Expert', 4.7, 42, '2021-11-15'),
('Saanvi Rao', 'saanvi.rao383@example.com', '9823456383', 'Hyderabad', 'Intermediate', 4.2, 34, '2022-12-18'),
('Atharv Kapoor', 'atharv.kapoor384@example.com', '9834567384', 'Pune', 'Beginner', 3.9, 23, '2023-09-22'),
('Anvi Malhotra', 'anvi.malhotra385@example.com', '9845678385', 'Mumbai', 'Expert', 4.8, 53, '2021-04-25'),
('Pranav Agarwal', 'pranav.agarwal386@example.com', '9856789386', 'Delhi', 'Intermediate', 4.1, 37, '2023-02-15'),
('Diya Patel', 'diya.patel387@example.com', '9867890387', 'Ahmedabad', 'Expert', 4.6, 38, '2022-01-30'),
('Vivaan Nair', 'vivaan.nair388@example.com', '9878901388', 'Kochi', 'Beginner', 3.8, 24, '2023-11-15'),
('Aarohi Krishnan', 'aarohi.krishnan389@example.com', '9889012389', 'Bangalore', 'Intermediate', 4.3, 41, '2022-10-30'),
('Kiaan Shah', 'kiaan.shah390@example.com', '9890123390', 'Surat', 'Expert', 4.5, 44, '2022-04-22'),
('Anay Iyer', 'anay.iyer391@example.com', '9801234391', 'Chennai', 'Intermediate', 4.4, 44, '2022-09-22'),
('Ahaan Menon', 'ahaan.menon392@example.com', '9812345392', 'Kolkata', 'Expert', 4.7, 41, '2021-12-12'),
('Aaradhya Rao', 'aaradhya.rao393@example.com', '9823456393', 'Hyderabad', 'Intermediate', 4.2, 35, '2023-01-22'),
('Arhaan Kapoor', 'arhaan.kapoor394@example.com', '9834567394', 'Pune', 'Beginner', 3.9, 25, '2023-10-22'),
('Avyaan Malhotra', 'avyaan.malhotra395@example.com', '9845678395', 'Mumbai', 'Expert', 4.8, 52, '2021-05-28'),
('Ayaan Agarwal', 'ayaan.agarwal396@example.com', '9856789396', 'Delhi', 'Intermediate', 4.1, 38, '2023-03-22'),
('Aarush Patel', 'aarush.patel397@example.com', '9867890397', 'Ahmedabad', 'Expert', 4.6, 37, '2022-02-22'),
('Aadvik Nair', 'aadvik.nair398@example.com', '9878901398', 'Kochi', 'Beginner', 3.8, 26, '2023-12-15'),
('Aarav Krishnan', 'aarav.krishnan399@example.com', '9889012399', 'Bangalore', 'Intermediate', 4.3, 42, '2022-11-30'),
('Aariz Shah', 'aariz.shah400@example.com', '9890123400', 'Surat', 'Expert', 4.5, 43, '2022-05-12'),
('Aaryan Iyer', 'aaryan.iyer401@example.com', '9801234401', 'Chennai', 'Intermediate', 4.4, 45, '2022-10-15'),
('Aaradhya Menon', 'aaradhya.menon402@example.com', '9812345402', 'Kolkata', 'Expert', 4.7, 40, '2022-01-15'),
('Aarav Rao', 'aarav.rao403@example.com', '9823456403', 'Hyderabad', 'Intermediate', 4.2, 36, '2023-02-22'),
('Aarush Kapoor', 'aarush.kapoor404@example.com', '9834567404', 'Pune', 'Beginner', 3.9, 27, '2023-11-22'),
('Aariz Malhotra', 'aariz.malhotra405@example.com', '9845678405', 'Mumbai', 'Expert', 4.8, 51, '2021-06-30'),
('Aaryan Agarwal', 'aaryan.agarwal406@example.com', '9856789406', 'Delhi', 'Intermediate', 4.1, 39, '2023-04-15'),
('Aaradhya Patel', 'aaradhya.patel407@example.com', '9867890407', 'Ahmedabad', 'Expert', 4.6, 36, '2022-03-15'),
('Aarav Nair', 'aarav.nair408@example.com', '9878901408', 'Kochi', 'Beginner', 3.8, 28, '2023-12-22'),
('Aarush Krishnan', 'aarush.krishnan409@example.com', '9889012409', 'Bangalore', 'Intermediate', 4.3, 43, '2022-12-12'),
('Aariz Shah', 'aariz.shah410@example.com', '9890123410', 'Surat', 'Expert', 4.5, 42, '2022-06-22'),
('Aaryan Iyer', 'aaryan.iyer411@example.com', '9801234411', 'Chennai', 'Intermediate', 4.4, 46, '2022-11-15');

-- =====================================================
-- 100 MORE CLIENTS (287-386)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
VALUES
('TechVenture Solutions', 'contact@techventure287.com', 'TechVenture Solutions Pvt Ltd', 'Mumbai', '2021-02-10'),
('DataFlow Systems', 'info@dataflow288.com', 'DataFlow Systems', 'Bangalore', '2022-06-15'),
('CloudBridge Tech', 'hello@cloudbridge289.com', 'CloudBridge Tech', 'Delhi', '2021-08-20'),
('InnovateCore Labs', 'contact@innovatecore290.com', 'InnovateCore Labs', 'Pune', '2022-09-25'),
('WebGenius Studio', 'info@webgenius291.com', 'WebGenius Studio', 'Chennai', '2021-11-30'),
('AppFlow Solutions', 'contact@appflow292.com', 'AppFlow Solutions', 'Hyderabad', '2022-12-05'),
('CloudForge Technologies', 'info@cloudforge293.com', 'CloudForge Technologies', 'Kolkata', '2021-04-10'),
('TechSync Systems', 'contact@techsync294.com', 'TechSync Systems', 'Ahmedabad', '2022-05-15'),
('Digital Pulse', 'info@digitalpulse295.com', 'Digital Pulse', 'Noida', '2021-07-20'),
('InnovateSync Labs', 'contact@innovatesync296.com', 'InnovateSync Labs', 'Kochi', '2022-08-25'),
('CodeSync Technologies', 'info@codesync297.com', 'CodeSync Technologies', 'Surat', '2021-09-30'),
('DataSync Pro Analytics', 'contact@datasyncpro298.com', 'DataSync Pro Analytics', 'Mumbai', '2022-10-05'),
('WebSync Pro Studio', 'info@websyncpro299.com', 'WebSync Pro Studio', 'Bangalore', '2021-12-10'),
('AppSync Pro Solutions', 'contact@appsyncpro300.com', 'AppSync Pro Solutions', 'Delhi', '2022-01-15'),
('CloudSync Pro Technologies', 'info@cloudsyncpro301.com', 'CloudSync Pro Technologies', 'Pune', '2021-03-20'),
('TechSync Pro Systems', 'contact@techsyncpro302.com', 'TechSync Pro Systems', 'Chennai', '2022-04-25'),
('Digital Sync Pro', 'info@digitalsyncpro303.com', 'Digital Sync Pro', 'Hyderabad', '2021-05-30'),
('InnovateSync Pro Labs', 'contact@innovatesyncpro304.com', 'InnovateSync Pro Labs', 'Kolkata', '2022-06-05'),
('CodeSync Pro Technologies', 'info@codesyncpro305.com', 'CodeSync Pro Technologies', 'Ahmedabad', '2021-08-10'),
('DataFlow Pro Analytics', 'contact@dataflowpro306.com', 'DataFlow Pro Analytics', 'Noida', '2022-09-15'),
('WebFlow Pro Studio', 'info@webflowpro307.com', 'WebFlow Pro Studio', 'Kochi', '2021-10-20'),
('AppFlow Pro Solutions', 'contact@appflowpro308.com', 'AppFlow Pro Solutions', 'Surat', '2022-11-25'),
('CloudFlow Pro Technologies', 'info@cloudflowpro309.com', 'CloudFlow Pro Technologies', 'Mumbai', '2021-12-30'),
('TechFlow Pro Systems', 'contact@techflowpro310.com', 'TechFlow Pro Systems', 'Bangalore', '2022-02-05'),
('Digital Flow Pro', 'info@digitalflowpro311.com', 'Digital Flow Pro', 'Delhi', '2021-04-10'),
('InnovateFlow Pro Labs', 'contact@innovateflowpro312.com', 'InnovateFlow Pro Labs', 'Pune', '2022-05-15'),
('CodeFlow Pro Technologies', 'info@codeflowpro313.com', 'CodeFlow Pro Technologies', 'Chennai', '2021-06-20'),
('DataCore Pro Analytics', 'contact@datacorepro314.com', 'DataCore Pro Analytics', 'Hyderabad', '2022-07-25'),
('WebCore Pro Studio', 'info@webcorepro315.com', 'WebCore Pro Studio', 'Kolkata', '2021-09-30'),
('AppCore Pro Solutions', 'contact@appcorepro316.com', 'AppCore Pro Solutions', 'Ahmedabad', '2022-10-05'),
('CloudCore Pro Technologies', 'info@cloudcorepro317.com', 'CloudCore Pro Technologies', 'Noida', '2021-11-10'),
('TechCore Pro Systems', 'contact@techcorepro318.com', 'TechCore Pro Systems', 'Kochi', '2022-12-15'),
('Digital Core Pro', 'info@digitalcorepro319.com', 'Digital Core Pro', 'Surat', '2021-01-20'),
('InnovateCore Pro Labs', 'contact@innovatecorepro320.com', 'InnovateCore Pro Labs', 'Mumbai', '2022-02-25'),
('CodeCore Pro Technologies', 'info@codecorepro321.com', 'CodeCore Pro Technologies', 'Bangalore', '2021-03-30'),
('DataVenture Pro Analytics', 'contact@dataventurepro322.com', 'DataVenture Pro Analytics', 'Delhi', '2022-04-05'),
('WebVenture Pro Studio', 'info@webventurepro323.com', 'WebVenture Pro Studio', 'Pune', '2021-05-10'),
('AppVenture Pro Solutions', 'contact@appventurepro324.com', 'AppVenture Pro Solutions', 'Chennai', '2022-06-15'),
('CloudVenture Pro Technologies', 'info@cloudventurepro325.com', 'CloudVenture Pro Technologies', 'Hyderabad', '2021-07-20'),
('TechVenture Pro Systems', 'contact@techventurepro326.com', 'TechVenture Pro Systems', 'Kolkata', '2022-08-25'),
('Digital Venture Pro', 'info@digitalventurepro327.com', 'Digital Venture Pro', 'Ahmedabad', '2021-09-30'),
('InnovateVenture Pro Labs', 'contact@innovateventurepro328.com', 'InnovateVenture Pro Labs', 'Noida', '2022-10-05'),
('CodeVenture Pro Technologies', 'info@codeventurepro329.com', 'CodeVenture Pro Technologies', 'Kochi', '2021-11-10'),
('DataSphere Pro Analytics', 'contact@dataspherepro330.com', 'DataSphere Pro Analytics', 'Surat', '2022-12-15'),
('WebSphere Pro Studio', 'info@webspherepro331.com', 'WebSphere Pro Studio', 'Mumbai', '2021-01-20'),
('AppSphere Pro Solutions', 'contact@appspherepro332.com', 'AppSphere Pro Solutions', 'Bangalore', '2022-02-25'),
('CloudSphere Pro Technologies', 'info@cloudspherepro333.com', 'CloudSphere Pro Technologies', 'Delhi', '2021-03-30'),
('TechSphere Pro Systems', 'contact@techspherepro334.com', 'TechSphere Pro Systems', 'Pune', '2022-04-05'),
('Digital Sphere Pro', 'info@digitalspherepro335.com', 'Digital Sphere Pro', 'Chennai', '2021-05-10'),
('InnovateSphere Pro Labs', 'contact@innovatespherepro336.com', 'InnovateSphere Pro Labs', 'Hyderabad', '2022-06-15'),
('CodeSphere Pro Technologies', 'info@codespherepro337.com', 'CodeSphere Pro Technologies', 'Kolkata', '2021-07-20'),
('DataNexus Pro Analytics', 'contact@datanexuspro338.com', 'DataNexus Pro Analytics', 'Ahmedabad', '2022-08-25'),
('WebNexus Pro Studio', 'info@webnexuspro339.com', 'WebNexus Pro Studio', 'Noida', '2021-09-30'),
('AppNexus Pro Solutions', 'contact@appnexuspro340.com', 'AppNexus Pro Solutions', 'Kochi', '2022-10-05'),
('CloudNexus Pro Technologies', 'info@cloudnexuspro341.com', 'CloudNexus Pro Technologies', 'Surat', '2021-11-10'),
('TechNexus Pro Systems', 'contact@technexuspro342.com', 'TechNexus Pro Systems', 'Mumbai', '2022-12-15'),
('Digital Nexus Pro', 'info@digitalnexuspro343.com', 'Digital Nexus Pro', 'Bangalore', '2021-01-20'),
('InnovateNexus Pro Labs', 'contact@innovatenexuspro344.com', 'InnovateNexus Pro Labs', 'Delhi', '2022-02-25'),
('CodeNexus Pro Technologies', 'info@codenexuspro345.com', 'CodeNexus Pro Technologies', 'Pune', '2021-03-30'),
('DataForge Pro Analytics', 'contact@dataforgepro346.com', 'DataForge Pro Analytics', 'Chennai', '2022-04-05'),
('WebForge Pro Studio', 'info@webforgepro347.com', 'WebForge Pro Studio', 'Hyderabad', '2021-05-10'),
('AppForge Pro Solutions', 'contact@appforgepro348.com', 'AppForge Pro Solutions', 'Kolkata', '2022-06-15'),
('CloudForge Pro Technologies', 'info@cloudforgepro349.com', 'CloudForge Pro Technologies', 'Ahmedabad', '2021-07-20'),
('TechForge Pro Systems', 'contact@techforgepro350.com', 'TechForge Pro Systems', 'Noida', '2022-08-25'),
('Digital Forge Pro', 'info@digitalforgepro351.com', 'Digital Forge Pro', 'Kochi', '2021-09-30'),
('InnovateForge Pro Labs', 'contact@innovateforgepro352.com', 'InnovateForge Pro Labs', 'Surat', '2022-10-05'),
('CodeForge Pro Technologies', 'info@codeforgepro353.com', 'CodeForge Pro Technologies', 'Mumbai', '2021-11-10'),
('DataStream Pro Analytics', 'contact@datastreampro354.com', 'DataStream Pro Analytics', 'Bangalore', '2022-12-15'),
('WebStream Pro Studio', 'info@webstreampro355.com', 'WebStream Pro Studio', 'Delhi', '2021-01-20'),
('AppStream Pro Solutions', 'contact@appstreampro356.com', 'AppStream Pro Solutions', 'Pune', '2022-02-25'),
('CloudStream Pro Technologies', 'info@cloudstreampro357.com', 'CloudStream Pro Technologies', 'Chennai', '2021-03-30'),
('TechStream Pro Systems', 'contact@techstreampro358.com', 'TechStream Pro Systems', 'Hyderabad', '2022-04-05'),
('Digital Stream Pro', 'info@digitalstreampro359.com', 'Digital Stream Pro', 'Kolkata', '2021-05-10'),
('InnovateStream Pro Labs', 'contact@innovatestreampro360.com', 'InnovateStream Pro Labs', 'Ahmedabad', '2022-06-15'),
('CodeStream Pro Technologies', 'info@codestreampro361.com', 'CodeStream Pro Technologies', 'Noida', '2021-07-20'),
('DataWave Pro Analytics', 'contact@datawavepro362.com', 'DataWave Pro Analytics', 'Kochi', '2022-08-25'),
('WebWave Pro Studio', 'info@webwavepro363.com', 'WebWave Pro Studio', 'Surat', '2021-09-30'),
('AppWave Pro Solutions', 'contact@appwavepro364.com', 'AppWave Pro Solutions', 'Mumbai', '2022-10-05'),
('CloudWave Pro Technologies', 'info@cloudwavepro365.com', 'CloudWave Pro Technologies', 'Bangalore', '2021-11-10'),
('TechWave Pro Systems', 'contact@techwavepro366.com', 'TechWave Pro Systems', 'Delhi', '2022-12-15'),
('Digital Wave Pro', 'info@digitalwavepro367.com', 'Digital Wave Pro', 'Pune', '2021-01-20'),
('InnovateWave Pro Labs', 'contact@innovatewavepro368.com', 'InnovateWave Pro Labs', 'Chennai', '2022-02-25'),
('CodeWave Pro Technologies', 'info@codewavepro369.com', 'CodeWave Pro Technologies', 'Hyderabad', '2021-03-30'),
('DataPulse Pro Analytics', 'contact@datapulsepro370.com', 'DataPulse Pro Analytics', 'Kolkata', '2022-04-05'),
('WebPulse Pro Studio', 'info@webpulsepro371.com', 'WebPulse Pro Studio', 'Ahmedabad', '2021-05-10'),
('AppPulse Pro Solutions', 'contact@apppulsepro372.com', 'AppPulse Pro Solutions', 'Noida', '2022-06-15'),
('CloudPulse Pro Technologies', 'info@cloudpulsepro373.com', 'CloudPulse Pro Technologies', 'Kochi', '2021-07-20'),
('TechPulse Pro Systems', 'contact@techpulsepro374.com', 'TechPulse Pro Systems', 'Surat', '2022-08-25'),
('Digital Pulse Pro', 'info@digitalpulsepro375.com', 'Digital Pulse Pro', 'Mumbai', '2021-09-30'),
('InnovatePulse Pro Labs', 'contact@innovatepulsepro376.com', 'InnovatePulse Pro Labs', 'Bangalore', '2022-10-05'),
('CodePulse Pro Technologies', 'info@codepulsepro377.com', 'CodePulse Pro Technologies', 'Delhi', '2021-11-10'),
('DataEdge Pro Analytics', 'contact@dataedgepro378.com', 'DataEdge Pro Analytics', 'Pune', '2022-12-15'),
('WebEdge Pro Studio', 'info@webedgepro379.com', 'WebEdge Pro Studio', 'Chennai', '2021-01-20'),
('AppEdge Pro Solutions', 'contact@appedgepro380.com', 'AppEdge Pro Solutions', 'Hyderabad', '2022-02-25'),
('CloudEdge Pro Technologies', 'info@cloudedgepro381.com', 'CloudEdge Pro Technologies', 'Kolkata', '2021-03-30'),
('TechEdge Pro Systems', 'contact@techedgepro382.com', 'TechEdge Pro Systems', 'Ahmedabad', '2022-04-05'),
('Digital Edge Pro', 'info@digitaledgepro383.com', 'Digital Edge Pro', 'Noida', '2021-05-10'),
('InnovateEdge Pro Labs', 'contact@innovateedgepro384.com', 'InnovateEdge Pro Labs', 'Kochi', '2022-06-15'),
('CodeEdge Pro Technologies', 'info@codeedgepro385.com', 'CodeEdge Pro Technologies', 'Surat', '2021-07-20'),
('DataHub Pro Analytics', 'contact@datahubpro386.com', 'DataHub Pro Analytics', 'Mumbai', '2022-08-25');

-- =====================================================
-- 100 MORE GIGS (116-215)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(87 + RAND() * 200) as client_id,  -- Random client_id between 87-286
    FLOOR(1 + RAND() * 8) as category_id,    -- Random category_id 1-8
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
    SELECT 116 as n UNION SELECT 117 UNION SELECT 118 UNION SELECT 119 UNION SELECT 120
    UNION SELECT 121 UNION SELECT 122 UNION SELECT 123 UNION SELECT 124 UNION SELECT 125
    UNION SELECT 126 UNION SELECT 127 UNION SELECT 128 UNION SELECT 129 UNION SELECT 130
    UNION SELECT 131 UNION SELECT 132 UNION SELECT 133 UNION SELECT 134 UNION SELECT 135
    UNION SELECT 136 UNION SELECT 137 UNION SELECT 138 UNION SELECT 139 UNION SELECT 140
    UNION SELECT 141 UNION SELECT 142 UNION SELECT 143 UNION SELECT 144 UNION SELECT 145
    UNION SELECT 146 UNION SELECT 147 UNION SELECT 148 UNION SELECT 149 UNION SELECT 150
    UNION SELECT 151 UNION SELECT 152 UNION SELECT 153 UNION SELECT 154 UNION SELECT 155
    UNION SELECT 156 UNION SELECT 157 UNION SELECT 158 UNION SELECT 159 UNION SELECT 160
    UNION SELECT 161 UNION SELECT 162 UNION SELECT 163 UNION SELECT 164 UNION SELECT 165
    UNION SELECT 166 UNION SELECT 167 UNION SELECT 168 UNION SELECT 169 UNION SELECT 170
    UNION SELECT 171 UNION SELECT 172 UNION SELECT 173 UNION SELECT 174 UNION SELECT 175
    UNION SELECT 176 UNION SELECT 177 UNION SELECT 178 UNION SELECT 179 UNION SELECT 180
    UNION SELECT 181 UNION SELECT 182 UNION SELECT 183 UNION SELECT 184 UNION SELECT 185
    UNION SELECT 186 UNION SELECT 187 UNION SELECT 188 UNION SELECT 189 UNION SELECT 190
    UNION SELECT 191 UNION SELECT 192 UNION SELECT 193 UNION SELECT 194 UNION SELECT 195
    UNION SELECT 196 UNION SELECT 197 UNION SELECT 198 UNION SELECT 199 UNION SELECT 200
    UNION SELECT 201 UNION SELECT 202 UNION SELECT 203 UNION SELECT 204 UNION SELECT 205
    UNION SELECT 206 UNION SELECT 207 UNION SELECT 208 UNION SELECT 209 UNION SELECT 210
    UNION SELECT 211 UNION SELECT 212 UNION SELECT 213 UNION SELECT 214 UNION SELECT 215
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (16-115)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 215) as gig_id,      -- Random gig_id
    FLOOR(1 + RAND() * 411) as freelancer_id, -- Random freelancer_id
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 16 as n UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
    UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
    UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30
    UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35
    UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40
    UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45
    UNION SELECT 46 UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50
    UNION SELECT 51 UNION SELECT 52 UNION SELECT 53 UNION SELECT 54 UNION SELECT 55
    UNION SELECT 56 UNION SELECT 57 UNION SELECT 58 UNION SELECT 59 UNION SELECT 60
    UNION SELECT 61 UNION SELECT 62 UNION SELECT 63 UNION SELECT 64 UNION SELECT 65
    UNION SELECT 66 UNION SELECT 67 UNION SELECT 68 UNION SELECT 69 UNION SELECT 70
    UNION SELECT 71 UNION SELECT 72 UNION SELECT 73 UNION SELECT 74 UNION SELECT 75
    UNION SELECT 76 UNION SELECT 77 UNION SELECT 78 UNION SELECT 79 UNION SELECT 80
    UNION SELECT 81 UNION SELECT 82 UNION SELECT 83 UNION SELECT 84 UNION SELECT 85
    UNION SELECT 86 UNION SELECT 87 UNION SELECT 88 UNION SELECT 89 UNION SELECT 90
    UNION SELECT 91 UNION SELECT 92 UNION SELECT 93 UNION SELECT 94 UNION SELECT 95
    UNION SELECT 96 UNION SELECT 97 UNION SELECT 98 UNION SELECT 99 UNION SELECT 100
    UNION SELECT 101 UNION SELECT 102 UNION SELECT 103 UNION SELECT 104 UNION SELECT 105
    UNION SELECT 106 UNION SELECT 107 UNION SELECT 108 UNION SELECT 109 UNION SELECT 110
    UNION SELECT 111 UNION SELECT 112 UNION SELECT 113 UNION SELECT 114 UNION SELECT 115
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (6-105)
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
-- 100 MORE PAYMENTS (20-119)
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
-- 100 MORE REVIEWS (6-105)
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
-- 100 MORE MESSAGES (138-237)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 386)  -- client_id
        ELSE FLOOR(1 + RAND() * 411)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 411)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 386)  -- client_id
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
    SELECT 138 as n UNION SELECT 139 UNION SELECT 140 UNION SELECT 141 UNION SELECT 142
    UNION SELECT 143 UNION SELECT 144 UNION SELECT 145 UNION SELECT 146 UNION SELECT 147
    UNION SELECT 148 UNION SELECT 149 UNION SELECT 150 UNION SELECT 151 UNION SELECT 152
    UNION SELECT 153 UNION SELECT 154 UNION SELECT 155 UNION SELECT 156 UNION SELECT 157
    UNION SELECT 158 UNION SELECT 159 UNION SELECT 160 UNION SELECT 161 UNION SELECT 162
    UNION SELECT 163 UNION SELECT 164 UNION SELECT 165 UNION SELECT 166 UNION SELECT 167
    UNION SELECT 168 UNION SELECT 169 UNION SELECT 170 UNION SELECT 171 UNION SELECT 172
    UNION SELECT 173 UNION SELECT 174 UNION SELECT 175 UNION SELECT 176 UNION SELECT 177
    UNION SELECT 178 UNION SELECT 179 UNION SELECT 180 UNION SELECT 181 UNION SELECT 182
    UNION SELECT 183 UNION SELECT 184 UNION SELECT 185 UNION SELECT 186 UNION SELECT 187
    UNION SELECT 188 UNION SELECT 189 UNION SELECT 190 UNION SELECT 191 UNION SELECT 192
    UNION SELECT 193 UNION SELECT 194 UNION SELECT 195 UNION SELECT 196 UNION SELECT 197
    UNION SELECT 198 UNION SELECT 199 UNION SELECT 200 UNION SELECT 201 UNION SELECT 202
    UNION SELECT 203 UNION SELECT 204 UNION SELECT 205 UNION SELECT 206 UNION SELECT 207
    UNION SELECT 208 UNION SELECT 209 UNION SELECT 210 UNION SELECT 211 UNION SELECT 212
    UNION SELECT 213 UNION SELECT 214 UNION SELECT 215 UNION SELECT 216 UNION SELECT 217
    UNION SELECT 218 UNION SELECT 219 UNION SELECT 220 UNION SELECT 221 UNION SELECT 222
    UNION SELECT 223 UNION SELECT 224 UNION SELECT 225 UNION SELECT 226 UNION SELECT 227
    UNION SELECT 228 UNION SELECT 229 UNION SELECT 230 UNION SELECT 231 UNION SELECT 232
    UNION SELECT 233 UNION SELECT 234 UNION SELECT 235 UNION SELECT 236 UNION SELECT 237
) as numbers;

COMMIT;

