-- =====================================================
-- INSERT 100 MORE TUPLES IN ALL TABLES - ROUND 6
-- =====================================================
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (839-938)
-- =====================================================
INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
VALUES
('Rohan Kumar', 'rohan.kumar839@example.com', '9812345839', 'Delhi', 'Expert', 4.6, 48, '2021-04-05'),
('Sneha Mehta', 'sneha.mehta840@example.com', '9823456840', 'Mumbai', 'Intermediate', 4.3, 26, '2022-06-10'),
('Amit Singh', 'amit.singh841@example.com', '9834567841', 'Kolkata', 'Beginner', 4.0, 10, '2023-04-10'),
('Kavita Gupta', 'kavita.gupta842@example.com', '9845678842', 'Bangalore', 'Expert', 4.7, 56, '2021-01-10'),
('Rajesh Patel', 'rajesh.patel843@example.com', '9856789843', 'Ahmedabad', 'Intermediate', 4.2, 29, '2022-09-10'),
('Priya Reddy', 'priya.reddy844@example.com', '9867890844', 'Hyderabad', 'Expert', 4.5, 44, '2021-08-10'),
('Vikram Sharma', 'vikram.sharma845@example.com', '9878901845', 'Pune', 'Beginner', 3.9, 11, '2023-06-10'),
('Neha Verma', 'neha.verma846@example.com', '9889012846', 'Chennai', 'Intermediate', 4.4, 34, '2022-05-10'),
('Deepak Joshi', 'deepak.joshi847@example.com', '9890123847', 'Noida', 'Expert', 4.6, 51, '2021-11-10'),
('Anjali Nair', 'anjali.nair848@example.com', '9801234848', 'Kochi', 'Intermediate', 4.3, 37, '2022-03-10'),
('Suresh Desai', 'suresh.desai849@example.com', '9812345849', 'Surat', 'Expert', 4.7, 49, '2021-06-10'),
('Divya Iyer', 'divya.iyer850@example.com', '9823456850', 'Bangalore', 'Intermediate', 4.2, 28, '2022-07-10'),
('Kunal Agarwal', 'kunal.agarwal851@example.com', '9834567851', 'Delhi', 'Beginner', 3.8, 12, '2023-04-10'),
('Richa Malhotra', 'richa.malhotra852@example.com', '9845678852', 'Mumbai', 'Expert', 4.8, 58, '2021-02-10'),
('Yash Khanna', 'yash.khanna853@example.com', '9856789853', 'Pune', 'Intermediate', 4.1, 31, '2022-10-10'),
('Isha Rao', 'isha.rao854@example.com', '9867890854', 'Hyderabad', 'Expert', 4.6, 43, '2021-09-10'),
('Rohit Kapoor', 'rohit.kapoor855@example.com', '9878901855', 'Chennai', 'Beginner', 3.9, 13, '2023-07-10'),
('Shreya Menon', 'shreya.menon856@example.com', '9889012856', 'Kolkata', 'Intermediate', 4.3, 35, '2022-06-10'),
('Nikhil Nair', 'nikhil.nair857@example.com', '9890123857', 'Ahmedabad', 'Expert', 4.5, 50, '2021-12-10'),
('Meera Krishnan', 'meera.krishnan858@example.com', '9801234858', 'Bangalore', 'Intermediate', 4.4, 38, '2022-05-10'),
('Aditya Shah', 'aditya.shah859@example.com', '9812345859', 'Mumbai', 'Expert', 4.7, 47, '2021-07-10'),
('Pooja Iyer', 'pooja.iyer860@example.com', '9823456860', 'Chennai', 'Intermediate', 4.2, 30, '2022-09-10'),
('Varun Menon', 'varun.menon861@example.com', '9834567861', 'Delhi', 'Beginner', 3.8, 14, '2023-06-10'),
('Ananya Iyer', 'ananya.iyer862@example.com', '9845678862', 'Bangalore', 'Expert', 4.8, 57, '2021-02-10'),
('Siddharth Rao', 'siddharth.rao863@example.com', '9856789863', 'Pune', 'Intermediate', 4.1, 32, '2022-10-10'),
('Isha Patel', 'isha.patel864@example.com', '9867890864', 'Ahmedabad', 'Expert', 4.6, 42, '2021-10-10'),
('Kunal Nair', 'kunal.nair865@example.com', '9878901865', 'Kochi', 'Beginner', 3.9, 15, '2023-08-10'),
('Riya Krishnan', 'riya.krishnan866@example.com', '9889012866', 'Bangalore', 'Intermediate', 4.3, 36, '2022-08-10'),
('Arjun Shah', 'arjun.shah867@example.com', '9890123867', 'Surat', 'Expert', 4.5, 49, '2022-01-10'),
('Sanjana Iyer', 'sanjana.iyer868@example.com', '9801234868', 'Chennai', 'Intermediate', 4.4, 39, '2022-06-10'),
('Rohan Desai', 'rohan.desai869@example.com', '9812345869', 'Surat', 'Expert', 4.7, 46, '2021-08-10'),
('Tanvi Iyer', 'tanvi.iyer870@example.com', '9823456870', 'Chennai', 'Intermediate', 4.2, 30, '2022-10-10'),
('Harsh Khanna', 'harsh.khanna871@example.com', '9834567871', 'Delhi', 'Beginner', 3.9, 12, '2023-05-10'),
('Aishwarya Rao', 'aishwarya.rao872@example.com', '9845678872', 'Hyderabad', 'Expert', 4.8, 59, '2021-02-10'),
('Vivek Kapoor', 'vivek.kapoor873@example.com', '9856789873', 'Pune', 'Intermediate', 4.1, 33, '2022-11-10'),
('Nisha Menon', 'nisha.menon874@example.com', '9867890874', 'Kolkata', 'Expert', 4.6, 43, '2021-10-10'),
('Abhishek Nair', 'abhishek.nair875@example.com', '9878901875', 'Bangalore', 'Beginner', 3.8, 16, '2023-09-10'),
('Sakshi Krishnan', 'sakshi.krishnan876@example.com', '9889012876', 'Mumbai', 'Intermediate', 4.3, 37, '2022-09-10'),
('Karan Shah', 'karan.shah877@example.com', '9890123877', 'Ahmedabad', 'Expert', 4.5, 48, '2022-02-10'),
('Preeti Reddy', 'preeti.reddy878@example.com', '9801234878', 'Hyderabad', 'Intermediate', 4.4, 40, '2022-07-10'),
('Manish Menon', 'manish.menon879@example.com', '9812345879', 'Chennai', 'Expert', 4.7, 45, '2021-09-10'),
('Swati Iyer', 'swati.iyer880@example.com', '9823456880', 'Bangalore', 'Intermediate', 4.2, 31, '2022-11-10'),
('Gaurav Rao', 'gaurav.rao881@example.com', '9834567881', 'Pune', 'Beginner', 3.9, 17, '2023-09-10'),
('Richa Malhotra', 'richa.malhotra882@example.com', '9845678882', 'Mumbai', 'Expert', 4.8, 56, '2021-03-10'),
('Yash Agarwal', 'yash.agarwal883@example.com', '9856789883', 'Delhi', 'Intermediate', 4.1, 34, '2023-01-10'),
('Anushka Patel', 'anushka.patel884@example.com', '9867890884', 'Ahmedabad', 'Expert', 4.6, 41, '2021-12-10'),
('Rishabh Nair', 'rishabh.nair885@example.com', '9878901885', 'Kochi', 'Beginner', 3.8, 18, '2023-10-10'),
('Shruti Krishnan', 'shruti.krishnan886@example.com', '9889012886', 'Bangalore', 'Intermediate', 4.3, 38, '2022-10-10'),
('Dhruv Shah', 'dhruv.shah887@example.com', '9890123887', 'Surat', 'Expert', 4.5, 47, '2022-03-10'),
('Ishita Iyer', 'ishita.iyer888@example.com', '9801234888', 'Chennai', 'Intermediate', 4.4, 41, '2022-08-10'),
('Akash Menon', 'akash.menon889@example.com', '9812345889', 'Kolkata', 'Expert', 4.7, 44, '2021-11-10'),
('Disha Rao', 'disha.rao890@example.com', '9823456890', 'Hyderabad', 'Intermediate', 4.2, 32, '2023-01-10'),
('Rajat Kapoor', 'rajat.kapoor891@example.com', '9834567891', 'Pune', 'Beginner', 3.9, 19, '2023-10-10'),
('Maya Malhotra', 'maya.malhotra892@example.com', '9845678892', 'Mumbai', 'Expert', 4.8, 55, '2021-04-10'),
('Sahil Agarwal', 'sahil.agarwal893@example.com', '9856789893', 'Delhi', 'Intermediate', 4.1, 35, '2023-02-10'),
('Zara Patel', 'zara.patel894@example.com', '9867890894', 'Ahmedabad', 'Expert', 4.6, 40, '2022-02-10'),
('Ravi Nair', 'ravi.nair895@example.com', '9878901895', 'Kochi', 'Beginner', 3.8, 20, '2023-11-10'),
('Kritika Krishnan', 'kritika.krishnan896@example.com', '9889012896', 'Bangalore', 'Intermediate', 4.3, 39, '2022-11-10'),
('Surya Shah', 'surya.shah897@example.com', '9890123897', 'Surat', 'Expert', 4.5, 46, '2022-04-10'),
('Aarav Iyer', 'aarav.iyer898@example.com', '9801234898', 'Chennai', 'Intermediate', 4.4, 42, '2022-10-10'),
('Ishaan Menon', 'ishaan.menon899@example.com', '9812345899', 'Kolkata', 'Expert', 4.7, 43, '2021-12-10'),
('Avni Rao', 'avni.rao900@example.com', '9823456900', 'Hyderabad', 'Intermediate', 4.2, 33, '2023-02-10'),
('Vihaan Kapoor', 'vihaan.kapoor901@example.com', '9834567901', 'Pune', 'Beginner', 3.9, 21, '2023-11-10'),
('Anika Malhotra', 'anika.malhotra902@example.com', '9845678902', 'Mumbai', 'Expert', 4.8, 54, '2021-05-10'),
('Advik Agarwal', 'advik.agarwal903@example.com', '9856789903', 'Delhi', 'Intermediate', 4.1, 36, '2023-03-10'),
('Myra Patel', 'myra.patel904@example.com', '9867890904', 'Ahmedabad', 'Expert', 4.6, 39, '2022-03-10'),
('Aryan Nair', 'aryan.nair905@example.com', '9878901905', 'Kochi', 'Beginner', 3.8, 22, '2023-12-10'),
('Kiara Krishnan', 'kiara.krishnan906@example.com', '9889012906', 'Bangalore', 'Intermediate', 4.3, 40, '2022-12-10'),
('Reyansh Shah', 'reyansh.shah907@example.com', '9890123907', 'Surat', 'Expert', 4.5, 45, '2022-05-10'),
('Aadhya Iyer', 'aadhya.iyer908@example.com', '9801234908', 'Chennai', 'Intermediate', 4.4, 43, '2022-11-10'),
('Arnav Menon', 'arnav.menon909@example.com', '9812345909', 'Kolkata', 'Expert', 4.7, 42, '2022-01-10'),
('Saanvi Rao', 'saanvi.rao910@example.com', '9823456910', 'Hyderabad', 'Intermediate', 4.2, 34, '2023-03-10'),
('Atharv Kapoor', 'atharv.kapoor911@example.com', '9834567911', 'Pune', 'Beginner', 3.9, 23, '2023-12-10'),
('Anvi Malhotra', 'anvi.malhotra912@example.com', '9845678912', 'Mumbai', 'Expert', 4.8, 53, '2021-06-10'),
('Pranav Agarwal', 'pranav.agarwal913@example.com', '9856789913', 'Delhi', 'Intermediate', 4.1, 37, '2023-04-10'),
('Diya Patel', 'diya.patel914@example.com', '9867890914', 'Ahmedabad', 'Expert', 4.6, 38, '2022-04-10'),
('Vivaan Nair', 'vivaan.nair915@example.com', '9878901915', 'Kochi', 'Beginner', 3.8, 24, '2024-01-10'),
('Aarohi Krishnan', 'aarohi.krishnan916@example.com', '9889012916', 'Bangalore', 'Intermediate', 4.3, 41, '2023-01-10'),
('Kiaan Shah', 'kiaan.shah917@example.com', '9890123917', 'Surat', 'Expert', 4.5, 44, '2022-06-10'),
('Anay Iyer', 'anay.iyer918@example.com', '9801234918', 'Chennai', 'Intermediate', 4.4, 44, '2022-12-10'),
('Ahaan Menon', 'ahaan.menon919@example.com', '9812345919', 'Kolkata', 'Expert', 4.7, 41, '2022-02-10'),
('Aaradhya Rao', 'aaradhya.rao920@example.com', '9823456920', 'Hyderabad', 'Intermediate', 4.2, 35, '2023-04-10'),
('Arhaan Kapoor', 'arhaan.kapoor921@example.com', '9834567921', 'Pune', 'Beginner', 3.9, 25, '2024-01-10'),
('Avyaan Malhotra', 'avyaan.malhotra922@example.com', '9845678922', 'Mumbai', 'Expert', 4.8, 52, '2021-07-10'),
('Ayaan Agarwal', 'ayaan.agarwal923@example.com', '9856789923', 'Delhi', 'Intermediate', 4.1, 38, '2023-05-10'),
('Aarush Patel', 'aarush.patel924@example.com', '9867890924', 'Ahmedabad', 'Expert', 4.6, 37, '2022-05-10'),
('Aadvik Nair', 'aadvik.nair925@example.com', '9878901925', 'Kochi', 'Beginner', 3.8, 26, '2024-02-10'),
('Aarav Krishnan', 'aarav.krishnan926@example.com', '9889012926', 'Bangalore', 'Intermediate', 4.3, 42, '2023-02-10'),
('Aarush Krishnan', 'aarush.krishnan927@example.com', '9890123927', 'Surat', 'Expert', 4.5, 43, '2022-08-10'),
('Aariz Shah', 'aariz.shah928@example.com', '9801234928', 'Chennai', 'Intermediate', 4.4, 45, '2023-01-10'),
('Aaryan Iyer', 'aaryan.iyer929@example.com', '9812345929', 'Kolkata', 'Expert', 4.7, 40, '2022-03-10'),
('Aaradhya Menon', 'aaradhya.menon930@example.com', '9823456930', 'Delhi', 'Intermediate', 4.2, 36, '2023-05-10'),
('Aarav Rao', 'aarav.rao931@example.com', '9834567931', 'Pune', 'Beginner', 3.9, 27, '2024-02-10'),
('Aarush Kapoor', 'aarush.kapoor932@example.com', '9845678932', 'Mumbai', 'Expert', 4.8, 51, '2021-08-10'),
('Aariz Malhotra', 'aariz.malhotra933@example.com', '9856789933', 'Delhi', 'Intermediate', 4.1, 39, '2023-06-10'),
('Aaryan Agarwal', 'aaryan.agarwal934@example.com', '9867890934', 'Ahmedabad', 'Expert', 4.6, 36, '2022-06-10'),
('Aaradhya Patel', 'aaradhya.patel935@example.com', '9878901935', 'Kochi', 'Beginner', 3.8, 28, '2024-03-10'),
('Aarav Nair', 'aarav.nair936@example.com', '9889012936', 'Bangalore', 'Intermediate', 4.3, 43, '2023-03-10'),
('Aarush Krishnan', 'aarush.krishnan937@example.com', '9890123937', 'Surat', 'Expert', 4.5, 42, '2022-09-10'),
('Aariz Shah', 'aariz.shah938@example.com', '9801234938', 'Chennai', 'Intermediate', 4.4, 46, '2023-02-10');

-- =====================================================
-- 100 MORE CLIENTS (814-913)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
VALUES
('TechNova 814', 'technova814@company.com', 'TechNova 814 Pvt Ltd', 'Mumbai', '2022-02-10'),
('DataNova 815', 'datanova815@company.com', 'DataNova 815 Pvt Ltd', 'Bangalore', '2021-03-10'),
('CloudNova 816', 'cloudnova816@company.com', 'CloudNova 816 Pvt Ltd', 'Delhi', '2022-04-10'),
('WebNova 817', 'webnova817@company.com', 'WebNova 817 Pvt Ltd', 'Pune', '2021-05-10'),
('AppNova 818', 'appnova818@company.com', 'AppNova 818 Pvt Ltd', 'Chennai', '2022-06-10'),
('TechNova 819', 'technova819@company.com', 'TechNova 819 Pvt Ltd', 'Hyderabad', '2021-07-10'),
('DataNova 820', 'datanova820@company.com', 'DataNova 820 Pvt Ltd', 'Kolkata', '2022-08-10'),
('CloudNova 821', 'cloudnova821@company.com', 'CloudNova 821 Pvt Ltd', 'Ahmedabad', '2021-09-10'),
('WebNova 822', 'webnova822@company.com', 'WebNova 822 Pvt Ltd', 'Noida', '2022-10-10'),
('AppNova 823', 'appnova823@company.com', 'AppNova 823 Pvt Ltd', 'Kochi', '2021-11-10'),
('TechNova 824', 'technova824@company.com', 'TechNova 824 Pvt Ltd', 'Surat', '2022-12-10'),
('DataNova 825', 'datanova825@company.com', 'DataNova 825 Pvt Ltd', 'Mumbai', '2021-01-10'),
('CloudNova 826', 'cloudnova826@company.com', 'CloudNova 826 Pvt Ltd', 'Bangalore', '2022-02-10'),
('WebNova 827', 'webnova827@company.com', 'WebNova 827 Pvt Ltd', 'Delhi', '2021-03-10'),
('AppNova 828', 'appnova828@company.com', 'AppNova 828 Pvt Ltd', 'Pune', '2022-04-10'),
('TechNova 829', 'technova829@company.com', 'TechNova 829 Pvt Ltd', 'Chennai', '2021-05-10'),
('DataNova 830', 'datanova830@company.com', 'DataNova 830 Pvt Ltd', 'Hyderabad', '2022-06-10'),
('CloudNova 831', 'cloudnova831@company.com', 'CloudNova 831 Pvt Ltd', 'Kolkata', '2021-07-10'),
('WebNova 832', 'webnova832@company.com', 'WebNova 832 Pvt Ltd', 'Ahmedabad', '2022-08-10'),
('AppNova 833', 'appnova833@company.com', 'AppNova 833 Pvt Ltd', 'Noida', '2021-09-10'),
('TechNova 834', 'technova834@company.com', 'TechNova 834 Pvt Ltd', 'Kochi', '2022-10-10'),
('DataNova 835', 'datanova835@company.com', 'DataNova 835 Pvt Ltd', 'Surat', '2021-11-10'),
('CloudNova 836', 'cloudnova836@company.com', 'CloudNova 836 Pvt Ltd', 'Mumbai', '2022-12-10'),
('WebNova 837', 'webnova837@company.com', 'WebNova 837 Pvt Ltd', 'Bangalore', '2021-01-10'),
('AppNova 838', 'appnova838@company.com', 'AppNova 838 Pvt Ltd', 'Delhi', '2022-02-10'),
('TechNova 839', 'technova839@company.com', 'TechNova 839 Pvt Ltd', 'Pune', '2021-03-10'),
('DataNova 840', 'datanova840@company.com', 'DataNova 840 Pvt Ltd', 'Chennai', '2022-04-10'),
('CloudNova 841', 'cloudnova841@company.com', 'CloudNova 841 Pvt Ltd', 'Hyderabad', '2021-05-10'),
('WebNova 842', 'webnova842@company.com', 'WebNova 842 Pvt Ltd', 'Kolkata', '2022-06-10'),
('AppNova 843', 'appnova843@company.com', 'AppNova 843 Pvt Ltd', 'Ahmedabad', '2021-07-10'),
('TechNova 844', 'technova844@company.com', 'TechNova 844 Pvt Ltd', 'Noida', '2022-08-10'),
('DataNova 845', 'datanova845@company.com', 'DataNova 845 Pvt Ltd', 'Kochi', '2021-09-10'),
('CloudNova 846', 'cloudnova846@company.com', 'CloudNova 846 Pvt Ltd', 'Surat', '2022-10-10'),
('WebNova 847', 'webnova847@company.com', 'WebNova 847 Pvt Ltd', 'Mumbai', '2021-11-10'),
('AppNova 848', 'appnova848@company.com', 'AppNova 848 Pvt Ltd', 'Bangalore', '2022-12-10'),
('TechNova 849', 'technova849@company.com', 'TechNova 849 Pvt Ltd', 'Delhi', '2021-01-10'),
('DataNova 850', 'datanova850@company.com', 'DataNova 850 Pvt Ltd', 'Pune', '2022-02-10'),
('CloudNova 851', 'cloudnova851@company.com', 'CloudNova 851 Pvt Ltd', 'Chennai', '2021-03-10'),
('WebNova 852', 'webnova852@company.com', 'WebNova 852 Pvt Ltd', 'Hyderabad', '2022-04-10'),
('AppNova 853', 'appnova853@company.com', 'AppNova 853 Pvt Ltd', 'Kolkata', '2021-05-10'),
('TechNova 854', 'technova854@company.com', 'TechNova 854 Pvt Ltd', 'Ahmedabad', '2022-06-10'),
('DataNova 855', 'datanova855@company.com', 'DataNova 855 Pvt Ltd', 'Noida', '2021-07-10'),
('CloudNova 856', 'cloudnova856@company.com', 'CloudNova 856 Pvt Ltd', 'Kochi', '2022-08-10'),
('WebNova 857', 'webnova857@company.com', 'WebNova 857 Pvt Ltd', 'Surat', '2021-09-10'),
('AppNova 858', 'appnova858@company.com', 'AppNova 858 Pvt Ltd', 'Mumbai', '2022-10-10'),
('TechNova 859', 'technova859@company.com', 'TechNova 859 Pvt Ltd', 'Bangalore', '2021-11-10'),
('DataNova 860', 'datanova860@company.com', 'DataNova 860 Pvt Ltd', 'Delhi', '2022-12-10'),
('CloudNova 861', 'cloudnova861@company.com', 'CloudNova 861 Pvt Ltd', 'Pune', '2021-01-10'),
('WebNova 862', 'webnova862@company.com', 'WebNova 862 Pvt Ltd', 'Chennai', '2022-02-10'),
('AppNova 863', 'appnova863@company.com', 'AppNova 863 Pvt Ltd', 'Hyderabad', '2021-03-10'),
('TechNova 864', 'technova864@company.com', 'TechNova 864 Pvt Ltd', 'Kolkata', '2022-04-10'),
('DataNova 865', 'datanova865@company.com', 'DataNova 865 Pvt Ltd', 'Ahmedabad', '2021-05-10'),
('CloudNova 866', 'cloudnova866@company.com', 'CloudNova 866 Pvt Ltd', 'Noida', '2022-06-10'),
('WebNova 867', 'webnova867@company.com', 'WebNova 867 Pvt Ltd', 'Kochi', '2021-07-10'),
('AppNova 868', 'appnova868@company.com', 'AppNova 868 Pvt Ltd', 'Surat', '2022-08-10'),
('TechNova 869', 'technova869@company.com', 'TechNova 869 Pvt Ltd', 'Mumbai', '2021-09-10'),
('DataNova 870', 'datanova870@company.com', 'DataNova 870 Pvt Ltd', 'Bangalore', '2022-10-10'),
('CloudNova 871', 'cloudnova871@company.com', 'CloudNova 871 Pvt Ltd', 'Delhi', '2021-11-10'),
('WebNova 872', 'webnova872@company.com', 'WebNova 872 Pvt Ltd', 'Pune', '2022-12-10'),
('AppNova 873', 'appnova873@company.com', 'AppNova 873 Pvt Ltd', 'Chennai', '2021-01-10'),
('TechNova 874', 'technova874@company.com', 'TechNova 874 Pvt Ltd', 'Hyderabad', '2022-02-10'),
('DataNova 875', 'datanova875@company.com', 'DataNova 875 Pvt Ltd', 'Kolkata', '2021-03-10'),
('CloudNova 876', 'cloudnova876@company.com', 'CloudNova 876 Pvt Ltd', 'Ahmedabad', '2022-04-10'),
('WebNova 877', 'webnova877@company.com', 'WebNova 877 Pvt Ltd', 'Noida', '2021-05-10'),
('AppNova 878', 'appnova878@company.com', 'AppNova 878 Pvt Ltd', 'Kochi', '2022-06-10'),
('TechNova 879', 'technova879@company.com', 'TechNova 879 Pvt Ltd', 'Surat', '2021-07-10'),
('DataNova 880', 'datanova880@company.com', 'DataNova 880 Pvt Ltd', 'Mumbai', '2022-08-10'),
('CloudNova 881', 'cloudnova881@company.com', 'CloudNova 881 Pvt Ltd', 'Bangalore', '2021-09-10'),
('WebNova 882', 'webnova882@company.com', 'WebNova 882 Pvt Ltd', 'Delhi', '2022-10-10'),
('AppNova 883', 'appnova883@company.com', 'AppNova 883 Pvt Ltd', 'Pune', '2021-11-10'),
('TechNova 884', 'technova884@company.com', 'TechNova 884 Pvt Ltd', 'Chennai', '2022-12-10'),
('DataNova 885', 'datanova885@company.com', 'DataNova 885 Pvt Ltd', 'Hyderabad', '2021-01-10'),
('CloudNova 886', 'cloudnova886@company.com', 'CloudNova 886 Pvt Ltd', 'Kolkata', '2022-02-10'),
('WebNova 887', 'webnova887@company.com', 'WebNova 887 Pvt Ltd', 'Ahmedabad', '2021-03-10'),
('AppNova 888', 'appnova888@company.com', 'AppNova 888 Pvt Ltd', 'Noida', '2022-04-10'),
('TechNova 889', 'technova889@company.com', 'TechNova 889 Pvt Ltd', 'Kochi', '2021-05-10'),
('DataNova 890', 'datanova890@company.com', 'DataNova 890 Pvt Ltd', 'Surat', '2022-06-10'),
('CloudNova 891', 'cloudnova891@company.com', 'CloudNova 891 Pvt Ltd', 'Mumbai', '2021-07-10'),
('WebNova 892', 'webnova892@company.com', 'WebNova 892 Pvt Ltd', 'Bangalore', '2022-08-10'),
('AppNova 893', 'appnova893@company.com', 'AppNova 893 Pvt Ltd', 'Delhi', '2021-09-10'),
('TechNova 894', 'technova894@company.com', 'TechNova 894 Pvt Ltd', 'Pune', '2022-10-10'),
('DataNova 895', 'datanova895@company.com', 'DataNova 895 Pvt Ltd', 'Chennai', '2021-11-10'),
('CloudNova 896', 'cloudnova896@company.com', 'CloudNova 896 Pvt Ltd', 'Hyderabad', '2022-12-10'),
('WebNova 897', 'webnova897@company.com', 'WebNova 897 Pvt Ltd', 'Kolkata', '2021-01-10'),
('AppNova 898', 'appnova898@company.com', 'AppNova 898 Pvt Ltd', 'Ahmedabad', '2022-02-10'),
('TechNova 899', 'technova899@company.com', 'TechNova 899 Pvt Ltd', 'Noida', '2021-03-10'),
('DataNova 900', 'datanova900@company.com', 'DataNova 900 Pvt Ltd', 'Kochi', '2022-04-10'),
('CloudNova 901', 'cloudnova901@company.com', 'CloudNova 901 Pvt Ltd', 'Surat', '2021-05-10'),
('WebNova 902', 'webnova902@company.com', 'WebNova 902 Pvt Ltd', 'Mumbai', '2022-06-10'),
('AppNova 903', 'appnova903@company.com', 'AppNova 903 Pvt Ltd', 'Bangalore', '2021-07-10'),
('TechNova 904', 'technova904@company.com', 'TechNova 904 Pvt Ltd', 'Delhi', '2022-08-10'),
('DataNova 905', 'datanova905@company.com', 'DataNova 905 Pvt Ltd', 'Pune', '2021-09-10'),
('CloudNova 906', 'cloudnova906@company.com', 'CloudNova 906 Pvt Ltd', 'Chennai', '2022-10-10'),
('WebNova 907', 'webnova907@company.com', 'WebNova 907 Pvt Ltd', 'Hyderabad', '2021-11-10'),
('AppNova 908', 'appnova908@company.com', 'AppNova 908 Pvt Ltd', 'Kolkata', '2022-12-10'),
('TechNova 909', 'technova909@company.com', 'TechNova 909 Pvt Ltd', 'Ahmedabad', '2021-01-10'),
('DataNova 910', 'datanova910@company.com', 'DataNova 910 Pvt Ltd', 'Noida', '2022-02-10'),
('CloudNova 911', 'cloudnova911@company.com', 'CloudNova 911 Pvt Ltd', 'Kochi', '2021-03-10'),
('WebNova 912', 'webnova912@company.com', 'WebNova 912 Pvt Ltd', 'Surat', '2022-04-10'),
('AppNova 913', 'appnova913@company.com', 'AppNova 913 Pvt Ltd', 'Mumbai', '2021-05-10');

-- =====================================================
-- 100 MORE GIGS (724-823)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(1 + RAND() * 913) as client_id,
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
    SELECT 724 as n UNION SELECT 725 UNION SELECT 726 UNION SELECT 727 UNION SELECT 728
    UNION SELECT 729 UNION SELECT 730 UNION SELECT 731 UNION SELECT 732 UNION SELECT 733
    UNION SELECT 734 UNION SELECT 735 UNION SELECT 736 UNION SELECT 737 UNION SELECT 738
    UNION SELECT 739 UNION SELECT 740 UNION SELECT 741 UNION SELECT 742 UNION SELECT 743
    UNION SELECT 744 UNION SELECT 745 UNION SELECT 746 UNION SELECT 747 UNION SELECT 748
    UNION SELECT 749 UNION SELECT 750 UNION SELECT 751 UNION SELECT 752 UNION SELECT 753
    UNION SELECT 754 UNION SELECT 755 UNION SELECT 756 UNION SELECT 757 UNION SELECT 758
    UNION SELECT 759 UNION SELECT 760 UNION SELECT 761 UNION SELECT 762 UNION SELECT 763
    UNION SELECT 764 UNION SELECT 765 UNION SELECT 766 UNION SELECT 767 UNION SELECT 768
    UNION SELECT 769 UNION SELECT 770 UNION SELECT 771 UNION SELECT 772 UNION SELECT 773
    UNION SELECT 774 UNION SELECT 775 UNION SELECT 776 UNION SELECT 777 UNION SELECT 778
    UNION SELECT 779 UNION SELECT 780 UNION SELECT 781 UNION SELECT 782 UNION SELECT 783
    UNION SELECT 784 UNION SELECT 785 UNION SELECT 786 UNION SELECT 787 UNION SELECT 788
    UNION SELECT 789 UNION SELECT 790 UNION SELECT 791 UNION SELECT 792 UNION SELECT 793
    UNION SELECT 794 UNION SELECT 795 UNION SELECT 796 UNION SELECT 797 UNION SELECT 798
    UNION SELECT 799 UNION SELECT 800 UNION SELECT 801 UNION SELECT 802 UNION SELECT 803
    UNION SELECT 804 UNION SELECT 805 UNION SELECT 806 UNION SELECT 807 UNION SELECT 808
    UNION SELECT 809 UNION SELECT 810 UNION SELECT 811 UNION SELECT 812 UNION SELECT 813
    UNION SELECT 814 UNION SELECT 815 UNION SELECT 816 UNION SELECT 817 UNION SELECT 818
    UNION SELECT 819 UNION SELECT 820 UNION SELECT 821 UNION SELECT 822 UNION SELECT 823
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (755-854)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 823) as gig_id,
    FLOOR(1 + RAND() * 938) as freelancer_id,
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 755 as n UNION SELECT 756 UNION SELECT 757 UNION SELECT 758 UNION SELECT 759
    UNION SELECT 760 UNION SELECT 761 UNION SELECT 762 UNION SELECT 763 UNION SELECT 764
    UNION SELECT 765 UNION SELECT 766 UNION SELECT 767 UNION SELECT 768 UNION SELECT 769
    UNION SELECT 770 UNION SELECT 771 UNION SELECT 772 UNION SELECT 773 UNION SELECT 774
    UNION SELECT 775 UNION SELECT 776 UNION SELECT 777 UNION SELECT 778 UNION SELECT 779
    UNION SELECT 780 UNION SELECT 781 UNION SELECT 782 UNION SELECT 783 UNION SELECT 784
    UNION SELECT 785 UNION SELECT 786 UNION SELECT 787 UNION SELECT 788 UNION SELECT 789
    UNION SELECT 790 UNION SELECT 791 UNION SELECT 792 UNION SELECT 793 UNION SELECT 794
    UNION SELECT 795 UNION SELECT 796 UNION SELECT 797 UNION SELECT 798 UNION SELECT 799
    UNION SELECT 800 UNION SELECT 801 UNION SELECT 802 UNION SELECT 803 UNION SELECT 804
    UNION SELECT 805 UNION SELECT 806 UNION SELECT 807 UNION SELECT 808 UNION SELECT 809
    UNION SELECT 810 UNION SELECT 811 UNION SELECT 812 UNION SELECT 813 UNION SELECT 814
    UNION SELECT 815 UNION SELECT 816 UNION SELECT 817 UNION SELECT 818 UNION SELECT 819
    UNION SELECT 820 UNION SELECT 821 UNION SELECT 822 UNION SELECT 823 UNION SELECT 824
    UNION SELECT 825 UNION SELECT 826 UNION SELECT 827 UNION SELECT 828 UNION SELECT 829
    UNION SELECT 830 UNION SELECT 831 UNION SELECT 832 UNION SELECT 833 UNION SELECT 834
    UNION SELECT 835 UNION SELECT 836 UNION SELECT 837 UNION SELECT 838 UNION SELECT 839
    UNION SELECT 840 UNION SELECT 841 UNION SELECT 842 UNION SELECT 843 UNION SELECT 844
    UNION SELECT 845 UNION SELECT 846 UNION SELECT 847 UNION SELECT 848 UNION SELECT 849
    UNION SELECT 850 UNION SELECT 851 UNION SELECT 852 UNION SELECT 853 UNION SELECT 854
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (305-404)
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
-- 100 MORE PAYMENTS (395-494)
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
-- 100 MORE REVIEWS (167-266)
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
-- 100 MORE MESSAGES (756-855)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 913)  -- client_id
        ELSE FLOOR(1 + RAND() * 938)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 938)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 913)  -- client_id
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
    SELECT 756 as n UNION SELECT 757 UNION SELECT 758 UNION SELECT 759 UNION SELECT 760
    UNION SELECT 761 UNION SELECT 762 UNION SELECT 763 UNION SELECT 764 UNION SELECT 765
    UNION SELECT 766 UNION SELECT 767 UNION SELECT 768 UNION SELECT 769 UNION SELECT 770
    UNION SELECT 771 UNION SELECT 772 UNION SELECT 773 UNION SELECT 774 UNION SELECT 775
    UNION SELECT 776 UNION SELECT 777 UNION SELECT 778 UNION SELECT 779 UNION SELECT 780
    UNION SELECT 781 UNION SELECT 782 UNION SELECT 783 UNION SELECT 784 UNION SELECT 785
    UNION SELECT 786 UNION SELECT 787 UNION SELECT 788 UNION SELECT 789 UNION SELECT 790
    UNION SELECT 791 UNION SELECT 792 UNION SELECT 793 UNION SELECT 794 UNION SELECT 795
    UNION SELECT 796 UNION SELECT 797 UNION SELECT 798 UNION SELECT 799 UNION SELECT 800
    UNION SELECT 801 UNION SELECT 802 UNION SELECT 803 UNION SELECT 804 UNION SELECT 805
    UNION SELECT 806 UNION SELECT 807 UNION SELECT 808 UNION SELECT 809 UNION SELECT 810
    UNION SELECT 811 UNION SELECT 812 UNION SELECT 813 UNION SELECT 814 UNION SELECT 815
    UNION SELECT 816 UNION SELECT 817 UNION SELECT 818 UNION SELECT 819 UNION SELECT 820
    UNION SELECT 821 UNION SELECT 822 UNION SELECT 823 UNION SELECT 824 UNION SELECT 825
    UNION SELECT 826 UNION SELECT 827 UNION SELECT 828 UNION SELECT 829 UNION SELECT 830
    UNION SELECT 831 UNION SELECT 832 UNION SELECT 833 UNION SELECT 834 UNION SELECT 835
    UNION SELECT 836 UNION SELECT 837 UNION SELECT 838 UNION SELECT 839 UNION SELECT 840
    UNION SELECT 841 UNION SELECT 842 UNION SELECT 843 UNION SELECT 844 UNION SELECT 845
    UNION SELECT 846 UNION SELECT 847 UNION SELECT 848 UNION SELECT 849 UNION SELECT 850
    UNION SELECT 851 UNION SELECT 852 UNION SELECT 853 UNION SELECT 854 UNION SELECT 855
) as numbers;

COMMIT;



