-- =====================================================
-- INSERT 100 MORE TUPLES IN ALL TABLES - ROUND 4
-- =====================================================
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (612-711)
-- =====================================================
INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
VALUES
('Rohan Kumar', 'rohan.kumar612@example.com', '9812345612', 'Delhi', 'Expert', 4.6, 48, '2021-03-25'),
('Sneha Mehta', 'sneha.mehta613@example.com', '9823456613', 'Mumbai', 'Intermediate', 4.3, 26, '2022-05-30'),
('Amit Singh', 'amit.singh614@example.com', '9834567614', 'Kolkata', 'Beginner', 4.0, 10, '2023-03-05'),
('Kavita Gupta', 'kavita.gupta615@example.com', '9845678615', 'Bangalore', 'Expert', 4.7, 56, '2020-12-30'),
('Rajesh Patel', 'rajesh.patel616@example.com', '9856789616', 'Ahmedabad', 'Intermediate', 4.2, 29, '2022-08-05'),
('Priya Reddy', 'priya.reddy617@example.com', '9867890617', 'Hyderabad', 'Expert', 4.5, 44, '2021-07-05'),
('Vikram Sharma', 'vikram.sharma618@example.com', '9878901618', 'Pune', 'Beginner', 3.9, 11, '2023-05-10'),
('Neha Verma', 'neha.verma619@example.com', '9889012619', 'Chennai', 'Intermediate', 4.4, 34, '2022-04-05'),
('Deepak Joshi', 'deepak.joshi620@example.com', '9890123620', 'Noida', 'Expert', 4.6, 51, '2021-10-05'),
('Anjali Nair', 'anjali.nair621@example.com', '9801234621', 'Kochi', 'Intermediate', 4.3, 37, '2022-02-20'),
('Suresh Desai', 'suresh.desai622@example.com', '9812345622', 'Surat', 'Expert', 4.7, 49, '2021-05-05'),
('Divya Iyer', 'divya.iyer623@example.com', '9823456623', 'Bangalore', 'Intermediate', 4.2, 28, '2022-06-25'),
('Kunal Agarwal', 'kunal.agarwal624@example.com', '9834567624', 'Delhi', 'Beginner', 3.8, 12, '2023-03-28'),
('Richa Malhotra', 'richa.malhotra625@example.com', '9845678625', 'Mumbai', 'Expert', 4.8, 58, '2021-01-05'),
('Yash Khanna', 'yash.khanna626@example.com', '9856789626', 'Pune', 'Intermediate', 4.1, 31, '2022-09-05'),
('Isha Rao', 'isha.rao627@example.com', '9867890627', 'Hyderabad', 'Expert', 4.6, 43, '2021-08-10'),
('Rohit Kapoor', 'rohit.kapoor628@example.com', '9878901628', 'Chennai', 'Beginner', 3.9, 13, '2023-06-05'),
('Shreya Menon', 'shreya.menon629@example.com', '9889012629', 'Kolkata', 'Intermediate', 4.3, 35, '2022-05-05'),
('Nikhil Nair', 'nikhil.nair630@example.com', '9890123630', 'Ahmedabad', 'Expert', 4.5, 50, '2021-11-05'),
('Meera Krishnan', 'meera.krishnan631@example.com', '9801234631', 'Bangalore', 'Intermediate', 4.4, 38, '2022-04-10'),
('Aditya Shah', 'aditya.shah632@example.com', '9812345632', 'Mumbai', 'Expert', 4.7, 47, '2021-06-05'),
('Pooja Iyer', 'pooja.iyer633@example.com', '9823456633', 'Chennai', 'Intermediate', 4.2, 30, '2022-08-10'),
('Varun Menon', 'varun.menon634@example.com', '9834567634', 'Delhi', 'Beginner', 3.8, 14, '2023-05-05'),
('Ananya Iyer', 'ananya.iyer635@example.com', '9845678635', 'Bangalore', 'Expert', 4.8, 57, '2021-01-10'),
('Siddharth Rao', 'siddharth.rao636@example.com', '9856789636', 'Pune', 'Intermediate', 4.1, 32, '2022-09-15'),
('Isha Patel', 'isha.patel637@example.com', '9867890637', 'Ahmedabad', 'Expert', 4.6, 42, '2021-09-05'),
('Kunal Nair', 'kunal.nair638@example.com', '9878901638', 'Kochi', 'Beginner', 3.9, 15, '2023-07-05'),
('Riya Krishnan', 'riya.krishnan639@example.com', '9889012639', 'Bangalore', 'Intermediate', 4.3, 36, '2022-07-10'),
('Arjun Shah', 'arjun.shah640@example.com', '9890123640', 'Surat', 'Expert', 4.5, 49, '2021-12-05'),
('Sanjana Iyer', 'sanjana.iyer641@example.com', '9801234641', 'Chennai', 'Intermediate', 4.4, 39, '2022-05-10'),
('Rohan Desai', 'rohan.desai642@example.com', '9812345642', 'Surat', 'Expert', 4.7, 46, '2021-07-10'),
('Tanvi Iyer', 'tanvi.iyer643@example.com', '9823456643', 'Chennai', 'Intermediate', 4.2, 30, '2022-09-20'),
('Harsh Khanna', 'harsh.khanna644@example.com', '9834567644', 'Delhi', 'Beginner', 3.9, 12, '2023-04-05'),
('Aishwarya Rao', 'aishwarya.rao645@example.com', '9845678645', 'Hyderabad', 'Expert', 4.8, 59, '2021-01-15'),
('Vivek Kapoor', 'vivek.kapoor646@example.com', '9856789646', 'Pune', 'Intermediate', 4.1, 33, '2022-10-25'),
('Nisha Menon', 'nisha.menon647@example.com', '9867890647', 'Kolkata', 'Expert', 4.6, 43, '2021-09-10'),
('Abhishek Nair', 'abhishek.nair648@example.com', '9878901648', 'Bangalore', 'Beginner', 3.8, 16, '2023-08-05'),
('Sakshi Krishnan', 'sakshi.krishnan649@example.com', '9889012649', 'Mumbai', 'Intermediate', 4.3, 37, '2022-08-10'),
('Karan Shah', 'karan.shah650@example.com', '9890123650', 'Ahmedabad', 'Expert', 4.5, 48, '2022-01-05'),
('Preeti Reddy', 'preeti.reddy651@example.com', '9801234651', 'Hyderabad', 'Intermediate', 4.4, 40, '2022-06-10'),
('Manish Menon', 'manish.menon652@example.com', '9812345652', 'Chennai', 'Expert', 4.7, 45, '2021-08-15'),
('Swati Iyer', 'swati.iyer653@example.com', '9823456653', 'Bangalore', 'Intermediate', 4.2, 31, '2022-10-10'),
('Gaurav Rao', 'gaurav.rao654@example.com', '9834567654', 'Pune', 'Beginner', 3.9, 17, '2023-08-10'),
('Richa Malhotra', 'richa.malhotra655@example.com', '9845678655', 'Mumbai', 'Expert', 4.8, 56, '2021-02-05'),
('Yash Agarwal', 'yash.agarwal656@example.com', '9856789656', 'Delhi', 'Intermediate', 4.1, 34, '2022-12-05'),
('Anushka Patel', 'anushka.patel657@example.com', '9867890657', 'Ahmedabad', 'Expert', 4.6, 41, '2021-11-10'),
('Rishabh Nair', 'rishabh.nair658@example.com', '9878901658', 'Kochi', 'Beginner', 3.8, 18, '2023-09-05'),
('Shruti Krishnan', 'shruti.krishnan659@example.com', '9889012659', 'Bangalore', 'Intermediate', 4.3, 38, '2022-09-10'),
('Dhruv Shah', 'dhruv.shah660@example.com', '9890123660', 'Surat', 'Expert', 4.5, 47, '2022-02-10'),
('Ishita Iyer', 'ishita.iyer661@example.com', '9801234661', 'Chennai', 'Intermediate', 4.4, 41, '2022-07-10'),
('Akash Menon', 'akash.menon662@example.com', '9812345662', 'Kolkata', 'Expert', 4.7, 44, '2021-10-10'),
('Disha Rao', 'disha.rao663@example.com', '9823456663', 'Hyderabad', 'Intermediate', 4.2, 32, '2022-12-10'),
('Rajat Kapoor', 'rajat.kapoor664@example.com', '9834567664', 'Pune', 'Beginner', 3.9, 19, '2023-09-10'),
('Maya Malhotra', 'maya.malhotra665@example.com', '9845678665', 'Mumbai', 'Expert', 4.8, 55, '2021-03-10'),
('Sahil Agarwal', 'sahil.agarwal666@example.com', '9856789666', 'Delhi', 'Intermediate', 4.1, 35, '2023-01-05'),
('Zara Patel', 'zara.patel667@example.com', '9867890667', 'Ahmedabad', 'Expert', 4.6, 40, '2022-01-10'),
('Ravi Nair', 'ravi.nair668@example.com', '9878901668', 'Kochi', 'Beginner', 3.8, 20, '2023-10-05'),
('Kritika Krishnan', 'kritika.krishnan669@example.com', '9889012669', 'Bangalore', 'Intermediate', 4.3, 39, '2022-10-10'),
('Surya Shah', 'surya.shah670@example.com', '9890123670', 'Surat', 'Expert', 4.5, 46, '2022-03-10'),
('Aarav Iyer', 'aarav.iyer671@example.com', '9801234671', 'Chennai', 'Intermediate', 4.4, 42, '2022-09-10'),
('Ishaan Menon', 'ishaan.menon672@example.com', '9812345672', 'Kolkata', 'Expert', 4.7, 43, '2021-11-15'),
('Avni Rao', 'avni.rao673@example.com', '9823456673', 'Hyderabad', 'Intermediate', 4.2, 33, '2023-01-10'),
('Vihaan Kapoor', 'vihaan.kapoor674@example.com', '9834567674', 'Pune', 'Beginner', 3.9, 21, '2023-10-10'),
('Anika Malhotra', 'anika.malhotra675@example.com', '9845678675', 'Mumbai', 'Expert', 4.8, 54, '2021-04-10'),
('Advik Agarwal', 'advik.agarwal676@example.com', '9856789676', 'Delhi', 'Intermediate', 4.1, 36, '2023-02-10'),
('Myra Patel', 'myra.patel677@example.com', '9867890677', 'Ahmedabad', 'Expert', 4.6, 39, '2022-02-10'),
('Aryan Nair', 'aryan.nair678@example.com', '9878901678', 'Kochi', 'Beginner', 3.8, 22, '2023-11-05'),
('Kiara Krishnan', 'kiara.krishnan679@example.com', '9889012679', 'Bangalore', 'Intermediate', 4.3, 40, '2022-11-10'),
('Reyansh Shah', 'reyansh.shah680@example.com', '9890123680', 'Surat', 'Expert', 4.5, 45, '2022-04-10'),
('Aadhya Iyer', 'aadhya.iyer681@example.com', '9801234681', 'Chennai', 'Intermediate', 4.4, 43, '2022-10-10'),
('Arnav Menon', 'arnav.menon682@example.com', '9812345682', 'Kolkata', 'Expert', 4.7, 42, '2021-12-10'),
('Saanvi Rao', 'saanvi.rao683@example.com', '9823456683', 'Hyderabad', 'Intermediate', 4.2, 34, '2023-02-10'),
('Atharv Kapoor', 'atharv.kapoor684@example.com', '9834567684', 'Pune', 'Beginner', 3.9, 23, '2023-11-10'),
('Anvi Malhotra', 'anvi.malhotra685@example.com', '9845678685', 'Mumbai', 'Expert', 4.8, 53, '2021-05-10'),
('Pranav Agarwal', 'pranav.agarwal686@example.com', '9856789686', 'Delhi', 'Intermediate', 4.1, 37, '2023-03-10'),
('Diya Patel', 'diya.patel687@example.com', '9867890687', 'Ahmedabad', 'Expert', 4.6, 38, '2022-03-10'),
('Vivaan Nair', 'vivaan.nair688@example.com', '9878901688', 'Kochi', 'Beginner', 3.8, 24, '2023-12-05'),
('Aarohi Krishnan', 'aarohi.krishnan689@example.com', '9889012689', 'Bangalore', 'Intermediate', 4.3, 41, '2022-12-10'),
('Kiaan Shah', 'kiaan.shah690@example.com', '9890123690', 'Surat', 'Expert', 4.5, 44, '2022-05-10'),
('Anay Iyer', 'anay.iyer691@example.com', '9801234691', 'Chennai', 'Intermediate', 4.4, 44, '2022-11-10'),
('Ahaan Menon', 'ahaan.menon692@example.com', '9812345692', 'Kolkata', 'Expert', 4.7, 41, '2022-01-15'),
('Aaradhya Rao', 'aaradhya.rao693@example.com', '9823456693', 'Hyderabad', 'Intermediate', 4.2, 35, '2023-03-10'),
('Arhaan Kapoor', 'arhaan.kapoor694@example.com', '9834567694', 'Pune', 'Beginner', 3.9, 25, '2023-12-10'),
('Avyaan Malhotra', 'avyaan.malhotra695@example.com', '9845678695', 'Mumbai', 'Expert', 4.8, 52, '2021-06-10'),
('Ayaan Agarwal', 'ayaan.agarwal696@example.com', '9856789696', 'Delhi', 'Intermediate', 4.1, 38, '2023-04-10'),
('Aarush Patel', 'aarush.patel697@example.com', '9867890697', 'Ahmedabad', 'Expert', 4.6, 37, '2022-04-10'),
('Aadvik Nair', 'aadvik.nair698@example.com', '9878901698', 'Kochi', 'Beginner', 3.8, 26, '2024-01-05'),
('Aarav Krishnan', 'aarav.krishnan699@example.com', '9889012699', 'Bangalore', 'Intermediate', 4.3, 42, '2023-01-10'),
('Aarush Krishnan', 'aarush.krishnan700@example.com', '9890123700', 'Surat', 'Expert', 4.5, 43, '2022-07-10'),
('Aariz Shah', 'aariz.shah701@example.com', '9801234701', 'Chennai', 'Intermediate', 4.4, 45, '2022-12-10'),
('Aaryan Iyer', 'aaryan.iyer702@example.com', '9812345702', 'Kolkata', 'Expert', 4.7, 40, '2022-02-15'),
('Aaradhya Menon', 'aaradhya.menon703@example.com', '9823456703', 'Delhi', 'Intermediate', 4.2, 36, '2023-04-10'),
('Aarav Rao', 'aarav.rao704@example.com', '9834567704', 'Pune', 'Beginner', 3.9, 27, '2024-01-10'),
('Aarush Kapoor', 'aarush.kapoor705@example.com', '9845678705', 'Mumbai', 'Expert', 4.8, 51, '2021-07-10'),
('Aariz Malhotra', 'aariz.malhotra706@example.com', '9856789706', 'Delhi', 'Intermediate', 4.1, 39, '2023-05-10'),
('Aaryan Agarwal', 'aaryan.agarwal707@example.com', '9867890707', 'Ahmedabad', 'Expert', 4.6, 36, '2022-05-10'),
('Aaradhya Patel', 'aaradhya.patel708@example.com', '9878901708', 'Kochi', 'Beginner', 3.8, 28, '2024-02-05'),
('Aarav Nair', 'aarav.nair709@example.com', '9889012709', 'Bangalore', 'Intermediate', 4.3, 43, '2023-02-10'),
('Aarush Krishnan', 'aarush.krishnan710@example.com', '9890123710', 'Surat', 'Expert', 4.5, 42, '2022-08-10'),
('Aariz Shah', 'aariz.shah711@example.com', '9801234711', 'Chennai', 'Intermediate', 4.4, 46, '2023-01-15');

-- =====================================================
-- 100 MORE CLIENTS (587-686)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
VALUES
('CloudPower Pro Technologies', 'info@cloudpowerpro587.com', 'CloudPower Pro Technologies Pvt Ltd', 'Bangalore', '2022-01-25'),
('TechPower Pro Systems', 'contact@techpowerpro588.com', 'TechPower Pro Systems', 'Delhi', '2021-02-28'),
('Digital Power Pro', 'info@digitalpowerpro589.com', 'Digital Power Pro', 'Pune', '2022-03-05'),
('InnovatePower Pro Labs', 'contact@innovatepowerpro590.com', 'InnovatePower Pro Labs', 'Chennai', '2021-04-10'),
('CodePower Pro Technologies', 'info@codepowerpro591.com', 'CodePower Pro Technologies', 'Hyderabad', '2022-05-15'),
('DataMax Pro Analytics', 'contact@datamaxpro592.com', 'DataMax Pro Analytics', 'Kolkata', '2021-06-20'),
('WebMax Pro Studio', 'info@webmaxpro593.com', 'WebMax Pro Studio', 'Ahmedabad', '2022-07-25'),
('AppMax Pro Solutions', 'contact@appmaxpro594.com', 'AppMax Pro Solutions', 'Noida', '2021-08-30'),
('CloudMax Pro Technologies', 'info@cloudmaxpro595.com', 'CloudMax Pro Technologies', 'Kochi', '2022-09-05'),
('TechMax Pro Systems', 'contact@techmaxpro596.com', 'TechMax Pro Systems', 'Surat', '2021-10-10'),
('Digital Max Pro', 'info@digitalmaxpro597.com', 'Digital Max Pro', 'Mumbai', '2022-11-15'),
('InnovateMax Pro Labs', 'contact@innovatemaxpro598.com', 'InnovateMax Pro Labs', 'Bangalore', '2021-12-20'),
('CodeMax Pro Technologies', 'info@codemaxpro599.com', 'CodeMax Pro Technologies', 'Delhi', '2022-01-25'),
('DataPrime Pro Analytics', 'contact@dataprimepro600.com', 'DataPrime Pro Analytics', 'Pune', '2021-02-28'),
('WebPrime Pro Studio', 'info@webprimepro601.com', 'WebPrime Pro Studio', 'Chennai', '2022-03-05'),
('AppPrime Pro Solutions', 'contact@appprimepro602.com', 'AppPrime Pro Solutions', 'Hyderabad', '2021-04-10'),
('CloudPrime Pro Technologies', 'info@cloudprimepro603.com', 'CloudPrime Pro Technologies', 'Kolkata', '2022-05-15'),
('TechPrime Pro Systems', 'contact@techprimepro604.com', 'TechPrime Pro Systems', 'Ahmedabad', '2021-06-20'),
('Digital Prime Pro', 'info@digitalprimepro605.com', 'Digital Prime Pro', 'Noida', '2022-07-25'),
('InnovatePrime Pro Labs', 'contact@innovateprimepro606.com', 'InnovatePrime Pro Labs', 'Kochi', '2021-08-30'),
('CodePrime Pro Technologies', 'info@codeprimepro607.com', 'CodePrime Pro Technologies', 'Surat', '2022-09-05'),
('DataStar Pro Analytics', 'contact@datastarpro608.com', 'DataStar Pro Analytics', 'Mumbai', '2021-10-10'),
('WebStar Pro Studio', 'info@webstarpro609.com', 'WebStar Pro Studio', 'Bangalore', '2022-11-15'),
('AppStar Pro Solutions', 'contact@appstarpro610.com', 'AppStar Pro Solutions', 'Delhi', '2021-12-20'),
('CloudStar Pro Technologies', 'info@cloudstarpro611.com', 'CloudStar Pro Technologies', 'Pune', '2022-01-25'),
('TechStar Pro Systems', 'contact@techstarpro612.com', 'TechStar Pro Systems', 'Chennai', '2021-02-28'),
('Digital Star Pro', 'info@digitalstarpro613.com', 'Digital Star Pro', 'Hyderabad', '2022-03-05'),
('InnovateStar Pro Labs', 'contact@innovatestarpro614.com', 'InnovateStar Pro Labs', 'Kolkata', '2021-04-10'),
('CodeStar Pro Technologies', 'info@codestarpro615.com', 'CodeStar Pro Technologies', 'Ahmedabad', '2022-05-15'),
('DataPlus Pro Analytics', 'contact@datapluspro616.com', 'DataPlus Pro Analytics', 'Noida', '2021-06-20'),
('WebPlus Pro Studio', 'info@webpluspro617.com', 'WebPlus Pro Studio', 'Kochi', '2022-07-25'),
('AppPlus Pro Solutions', 'contact@apppluspro618.com', 'AppPlus Pro Solutions', 'Surat', '2021-08-30'),
('CloudPlus Pro Technologies', 'info@cloudpluspro619.com', 'CloudPlus Pro Technologies', 'Mumbai', '2022-09-05'),
('TechPlus Pro Systems', 'contact@techpluspro620.com', 'TechPlus Pro Systems', 'Bangalore', '2021-10-10'),
('Digital Plus Pro', 'info@digitalpluspro621.com', 'Digital Plus Pro', 'Delhi', '2022-11-15'),
('InnovatePlus Pro Labs', 'contact@innovatepluspro622.com', 'InnovatePlus Pro Labs', 'Pune', '2021-12-20'),
('CodePlus Pro Technologies', 'info@codepluspro623.com', 'CodePlus Pro Technologies', 'Chennai', '2022-01-25'),
('DataPro Plus Analytics', 'contact@dataproplu624.com', 'DataPro Plus Analytics', 'Hyderabad', '2021-02-28'),
('WebPro Plus Studio', 'info@webproplus625.com', 'WebPro Plus Studio', 'Kolkata', '2022-03-05'),
('AppPro Plus Solutions', 'contact@appproplus626.com', 'AppPro Plus Solutions', 'Ahmedabad', '2021-04-10'),
('CloudPro Plus Technologies', 'info@cloudproplus627.com', 'CloudPro Plus Technologies', 'Noida', '2022-05-15'),
('TechPro Plus Systems', 'contact@techproplus628.com', 'TechPro Plus Systems', 'Kochi', '2021-06-20'),
('Digital Pro Plus', 'info@digitalproplus629.com', 'Digital Pro Plus', 'Surat', '2022-07-25'),
('InnovatePro Plus Labs', 'contact@innovateproplus630.com', 'InnovatePro Plus Labs', 'Mumbai', '2021-08-30'),
('CodePro Plus Technologies', 'info@codeproplus631.com', 'CodePro Plus Technologies', 'Bangalore', '2022-09-05'),
('DataElite Pro Analytics', 'contact@dataelitepro632.com', 'DataElite Pro Analytics', 'Delhi', '2021-10-10'),
('WebElite Pro Studio', 'info@webelitepro633.com', 'WebElite Pro Studio', 'Pune', '2022-11-15'),
('AppElite Pro Solutions', 'contact@appelitepro634.com', 'AppElite Pro Solutions', 'Chennai', '2021-12-20'),
('CloudElite Pro Technologies', 'info@cloudelitepro635.com', 'CloudElite Pro Technologies', 'Hyderabad', '2022-01-25'),
('TechElite Pro Systems', 'contact@techelitepro636.com', 'TechElite Pro Systems', 'Kolkata', '2021-02-28'),
('Digital Elite Pro', 'info@digitalelitepro637.com', 'Digital Elite Pro', 'Ahmedabad', '2022-03-05'),
('InnovateElite Pro Labs', 'contact@innovateelitepro638.com', 'InnovateElite Pro Labs', 'Noida', '2021-04-10'),
('CodeElite Pro Technologies', 'info@codeelitepro639.com', 'CodeElite Pro Technologies', 'Kochi', '2022-05-15'),
('DataApex Pro Analytics', 'contact@dataapexpro640.com', 'DataApex Pro Analytics', 'Surat', '2021-06-20'),
('WebApex Pro Studio', 'info@webapexpro641.com', 'WebApex Pro Studio', 'Mumbai', '2022-07-25'),
('AppApex Pro Solutions', 'contact@appapexpro642.com', 'AppApex Pro Solutions', 'Bangalore', '2021-08-30'),
('CloudApex Pro Technologies', 'info@cloudapexpro643.com', 'CloudApex Pro Technologies', 'Delhi', '2022-09-05'),
('TechApex Pro Systems', 'contact@techapexpro644.com', 'TechApex Pro Systems', 'Pune', '2021-10-10'),
('Digital Apex Pro', 'info@digitalapexpro645.com', 'Digital Apex Pro', 'Chennai', '2022-11-15'),
('InnovateApex Pro Labs', 'contact@innovateapexpro646.com', 'InnovateApex Pro Labs', 'Hyderabad', '2021-12-20'),
('CodeApex Pro Technologies', 'info@codeapexpro647.com', 'CodeApex Pro Technologies', 'Kolkata', '2022-01-25'),
('DataPeak Pro Analytics', 'contact@datapeakpro648.com', 'DataPeak Pro Analytics', 'Ahmedabad', '2021-02-28'),
('WebPeak Pro Studio', 'info@webpeakpro649.com', 'WebPeak Pro Studio', 'Noida', '2022-03-05'),
('AppPeak Pro Solutions', 'contact@apppeakpro650.com', 'AppPeak Pro Solutions', 'Kochi', '2021-04-10'),
('CloudPeak Pro Technologies', 'info@cloudpeakpro651.com', 'CloudPeak Pro Technologies', 'Surat', '2022-05-15'),
('TechPeak Pro Systems', 'contact@techpeakpro652.com', 'TechPeak Pro Systems', 'Mumbai', '2021-06-20'),
('Digital Peak Pro', 'info@digitalpeakpro653.com', 'Digital Peak Pro', 'Bangalore', '2022-07-25'),
('InnovatePeak Pro Labs', 'contact@innovatepeakpro654.com', 'InnovatePeak Pro Labs', 'Delhi', '2021-08-30'),
('CodePeak Pro Technologies', 'info@codepeakpro655.com', 'CodePeak Pro Technologies', 'Pune', '2022-09-05'),
('DataSummit Pro Analytics', 'contact@datasummitpro656.com', 'DataSummit Pro Analytics', 'Chennai', '2021-10-10'),
('WebSummit Pro Studio', 'info@websummitpro657.com', 'WebSummit Pro Studio', 'Hyderabad', '2022-11-15'),
('AppSummit Pro Solutions', 'contact@appsummitpro658.com', 'AppSummit Pro Solutions', 'Kolkata', '2021-12-20'),
('CloudSummit Pro Technologies', 'info@cloudsummitpro659.com', 'CloudSummit Pro Technologies', 'Ahmedabad', '2022-01-25'),
('TechSummit Pro Systems', 'contact@techsummitpro660.com', 'TechSummit Pro Systems', 'Noida', '2021-02-28'),
('Digital Summit Pro', 'info@digitalsummitpro661.com', 'Digital Summit Pro', 'Kochi', '2022-03-05'),
('InnovateSummit Pro Labs', 'contact@innovatesummitpro662.com', 'InnovateSummit Pro Labs', 'Surat', '2021-04-10'),
('CodeSummit Pro Technologies', 'info@codesummitpro663.com', 'CodeSummit Pro Technologies', 'Mumbai', '2022-05-15'),
('DataCrest Pro Analytics', 'contact@datacrestpro664.com', 'DataCrest Pro Analytics', 'Bangalore', '2021-06-20'),
('WebCrest Pro Studio', 'info@webcrestpro665.com', 'WebCrest Pro Studio', 'Delhi', '2022-07-25'),
('AppCrest Pro Solutions', 'contact@appcrestpro666.com', 'AppCrest Pro Solutions', 'Pune', '2021-08-30'),
('CloudCrest Pro Technologies', 'info@cloudcrestpro667.com', 'CloudCrest Pro Technologies', 'Chennai', '2022-09-05'),
('TechCrest Pro Systems', 'contact@techcrestpro668.com', 'TechCrest Pro Systems', 'Hyderabad', '2021-10-10'),
('Digital Crest Pro', 'info@digitalcrestpro669.com', 'Digital Crest Pro', 'Kolkata', '2022-11-15'),
('InnovateCrest Pro Labs', 'contact@innovatecrestpro670.com', 'InnovateCrest Pro Labs', 'Ahmedabad', '2021-12-20'),
('CodeCrest Pro Technologies', 'info@codecrestpro671.com', 'CodeCrest Pro Technologies', 'Noida', '2022-01-25'),
('DataPinnacle Pro Analytics', 'contact@datapinnaclepro672.com', 'DataPinnacle Pro Analytics', 'Kochi', '2021-02-28'),
('WebPinnacle Pro Studio', 'info@webpinnaclepro673.com', 'WebPinnacle Pro Studio', 'Surat', '2022-03-05'),
('AppPinnacle Pro Solutions', 'contact@apppinnaclepro674.com', 'AppPinnacle Pro Solutions', 'Mumbai', '2021-04-10'),
('CloudPinnacle Pro Technologies', 'info@cloudpinnaclepro675.com', 'CloudPinnacle Pro Technologies', 'Bangalore', '2022-05-15'),
('TechPinnacle Pro Systems', 'contact@techpinnaclepro676.com', 'TechPinnacle Pro Systems', 'Delhi', '2021-06-20'),
('Digital Pinnacle Pro', 'info@digitalpinnaclepro677.com', 'Digital Pinnacle Pro', 'Pune', '2022-07-25'),
('InnovatePinnacle Pro Labs', 'contact@innovatepinnaclepro678.com', 'InnovatePinnacle Pro Labs', 'Chennai', '2021-08-30'),
('CodePinnacle Pro Technologies', 'info@codepinnaclepro679.com', 'CodePinnacle Pro Technologies', 'Hyderabad', '2022-09-05'),
('DataZenith Pro Analytics', 'contact@datazenithpro680.com', 'DataZenith Pro Analytics', 'Kolkata', '2021-10-10'),
('WebZenith Pro Studio', 'info@webzenithpro681.com', 'WebZenith Pro Studio', 'Ahmedabad', '2022-11-15'),
('AppZenith Pro Solutions', 'contact@appzenithpro682.com', 'AppZenith Pro Solutions', 'Noida', '2021-12-20'),
('CloudZenith Pro Technologies', 'info@cloudzenithpro683.com', 'CloudZenith Pro Technologies', 'Kochi', '2022-01-25'),
('TechZenith Pro Systems', 'contact@techzenithpro684.com', 'TechZenith Pro Systems', 'Surat', '2021-02-28'),
('Digital Zenith Pro', 'info@digitalzenithpro685.com', 'Digital Zenith Pro', 'Mumbai', '2022-03-05'),
('InnovateZenith Pro Labs', 'contact@innovatezenithpro686.com', 'InnovateZenith Pro Labs', 'Bangalore', '2021-04-10');

-- =====================================================
-- 100 MORE GIGS (470-569)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(1 + RAND() * 686) as client_id,
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
    SELECT 470 as n UNION SELECT 471 UNION SELECT 472 UNION SELECT 473 UNION SELECT 474
    UNION SELECT 475 UNION SELECT 476 UNION SELECT 477 UNION SELECT 478 UNION SELECT 479
    UNION SELECT 480 UNION SELECT 481 UNION SELECT 482 UNION SELECT 483 UNION SELECT 484
    UNION SELECT 485 UNION SELECT 486 UNION SELECT 487 UNION SELECT 488 UNION SELECT 489
    UNION SELECT 490 UNION SELECT 491 UNION SELECT 492 UNION SELECT 493 UNION SELECT 494
    UNION SELECT 495 UNION SELECT 496 UNION SELECT 497 UNION SELECT 498 UNION SELECT 499
    UNION SELECT 500 UNION SELECT 501 UNION SELECT 502 UNION SELECT 503 UNION SELECT 504
    UNION SELECT 505 UNION SELECT 506 UNION SELECT 507 UNION SELECT 508 UNION SELECT 509
    UNION SELECT 510 UNION SELECT 511 UNION SELECT 512 UNION SELECT 513 UNION SELECT 514
    UNION SELECT 515 UNION SELECT 516 UNION SELECT 517 UNION SELECT 518 UNION SELECT 519
    UNION SELECT 520 UNION SELECT 521 UNION SELECT 522 UNION SELECT 523 UNION SELECT 524
    UNION SELECT 525 UNION SELECT 526 UNION SELECT 527 UNION SELECT 528 UNION SELECT 529
    UNION SELECT 530 UNION SELECT 531 UNION SELECT 532 UNION SELECT 533 UNION SELECT 534
    UNION SELECT 535 UNION SELECT 536 UNION SELECT 537 UNION SELECT 538 UNION SELECT 539
    UNION SELECT 540 UNION SELECT 541 UNION SELECT 542 UNION SELECT 543 UNION SELECT 544
    UNION SELECT 545 UNION SELECT 546 UNION SELECT 547 UNION SELECT 548 UNION SELECT 549
    UNION SELECT 550 UNION SELECT 551 UNION SELECT 552 UNION SELECT 553 UNION SELECT 554
    UNION SELECT 555 UNION SELECT 556 UNION SELECT 557 UNION SELECT 558 UNION SELECT 559
    UNION SELECT 560 UNION SELECT 561 UNION SELECT 562 UNION SELECT 563 UNION SELECT 564
    UNION SELECT 565 UNION SELECT 566 UNION SELECT 567 UNION SELECT 568 UNION SELECT 569
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (507-606)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 569) as gig_id,
    FLOOR(1 + RAND() * 711) as freelancer_id,
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 507 as n UNION SELECT 508 UNION SELECT 509 UNION SELECT 510 UNION SELECT 511
    UNION SELECT 512 UNION SELECT 513 UNION SELECT 514 UNION SELECT 515 UNION SELECT 516
    UNION SELECT 517 UNION SELECT 518 UNION SELECT 519 UNION SELECT 520 UNION SELECT 521
    UNION SELECT 522 UNION SELECT 523 UNION SELECT 524 UNION SELECT 525 UNION SELECT 526
    UNION SELECT 527 UNION SELECT 528 UNION SELECT 529 UNION SELECT 530 UNION SELECT 531
    UNION SELECT 532 UNION SELECT 533 UNION SELECT 534 UNION SELECT 535 UNION SELECT 536
    UNION SELECT 537 UNION SELECT 538 UNION SELECT 539 UNION SELECT 540 UNION SELECT 541
    UNION SELECT 542 UNION SELECT 543 UNION SELECT 544 UNION SELECT 545 UNION SELECT 546
    UNION SELECT 547 UNION SELECT 548 UNION SELECT 549 UNION SELECT 550 UNION SELECT 551
    UNION SELECT 552 UNION SELECT 553 UNION SELECT 554 UNION SELECT 555 UNION SELECT 556
    UNION SELECT 557 UNION SELECT 558 UNION SELECT 559 UNION SELECT 560 UNION SELECT 561
    UNION SELECT 562 UNION SELECT 563 UNION SELECT 564 UNION SELECT 565 UNION SELECT 566
    UNION SELECT 567 UNION SELECT 568 UNION SELECT 569 UNION SELECT 570 UNION SELECT 571
    UNION SELECT 572 UNION SELECT 573 UNION SELECT 574 UNION SELECT 575 UNION SELECT 576
    UNION SELECT 577 UNION SELECT 578 UNION SELECT 579 UNION SELECT 580 UNION SELECT 581
    UNION SELECT 582 UNION SELECT 583 UNION SELECT 584 UNION SELECT 585 UNION SELECT 586
    UNION SELECT 587 UNION SELECT 588 UNION SELECT 589 UNION SELECT 590 UNION SELECT 591
    UNION SELECT 592 UNION SELECT 593 UNION SELECT 594 UNION SELECT 595 UNION SELECT 596
    UNION SELECT 597 UNION SELECT 598 UNION SELECT 599 UNION SELECT 600 UNION SELECT 601
    UNION SELECT 602 UNION SELECT 603 UNION SELECT 604 UNION SELECT 605 UNION SELECT 606
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (244-343)
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
-- 100 MORE PAYMENTS (334-433)
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
-- 100 MORE REVIEWS (143-242)
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
-- 100 MORE MESSAGES (504-603)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 686)  -- client_id
        ELSE FLOOR(1 + RAND() * 711)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 711)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 686)  -- client_id
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
    SELECT 504 as n UNION SELECT 505 UNION SELECT 506 UNION SELECT 507 UNION SELECT 508
    UNION SELECT 509 UNION SELECT 510 UNION SELECT 511 UNION SELECT 512 UNION SELECT 513
    UNION SELECT 514 UNION SELECT 515 UNION SELECT 516 UNION SELECT 517 UNION SELECT 518
    UNION SELECT 519 UNION SELECT 520 UNION SELECT 521 UNION SELECT 522 UNION SELECT 523
    UNION SELECT 524 UNION SELECT 525 UNION SELECT 526 UNION SELECT 527 UNION SELECT 528
    UNION SELECT 529 UNION SELECT 530 UNION SELECT 531 UNION SELECT 532 UNION SELECT 533
    UNION SELECT 534 UNION SELECT 535 UNION SELECT 536 UNION SELECT 537 UNION SELECT 538
    UNION SELECT 539 UNION SELECT 540 UNION SELECT 541 UNION SELECT 542 UNION SELECT 543
    UNION SELECT 544 UNION SELECT 545 UNION SELECT 546 UNION SELECT 547 UNION SELECT 548
    UNION SELECT 549 UNION SELECT 550 UNION SELECT 551 UNION SELECT 552 UNION SELECT 553
    UNION SELECT 554 UNION SELECT 555 UNION SELECT 556 UNION SELECT 557 UNION SELECT 558
    UNION SELECT 559 UNION SELECT 560 UNION SELECT 561 UNION SELECT 562 UNION SELECT 563
    UNION SELECT 564 UNION SELECT 565 UNION SELECT 566 UNION SELECT 567 UNION SELECT 568
    UNION SELECT 569 UNION SELECT 570 UNION SELECT 571 UNION SELECT 572 UNION SELECT 573
    UNION SELECT 574 UNION SELECT 575 UNION SELECT 576 UNION SELECT 577 UNION SELECT 578
    UNION SELECT 579 UNION SELECT 580 UNION SELECT 581 UNION SELECT 582 UNION SELECT 583
    UNION SELECT 584 UNION SELECT 585 UNION SELECT 586 UNION SELECT 587 UNION SELECT 588
    UNION SELECT 589 UNION SELECT 590 UNION SELECT 591 UNION SELECT 592 UNION SELECT 593
    UNION SELECT 594 UNION SELECT 595 UNION SELECT 596 UNION SELECT 597 UNION SELECT 598
    UNION SELECT 599 UNION SELECT 600 UNION SELECT 601 UNION SELECT 602 UNION SELECT 603
) as numbers;

COMMIT;



