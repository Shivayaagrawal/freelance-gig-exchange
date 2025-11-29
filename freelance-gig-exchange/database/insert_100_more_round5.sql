-- =====================================================
-- INSERT 100 MORE TUPLES IN ALL TABLES - ROUND 5
-- =====================================================
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (739-838)
-- =====================================================
INSERT IGNORE INTO freelancers (name, email, phone, location, experience_level, rating, total_completed, join_date)
SELECT 
    CONCAT(first_name, ' ', last_name) as name,
    CONCAT(LOWER(first_name), '.', LOWER(last_name), n, '@example.com') as email,
    CONCAT('98', LPAD(FLOOR(RAND() * 100000000), 8, '0')) as phone,
    location,
    level,
    ROUND(3.5 + RAND() * 1.5, 1) as rating,
    FLOOR(5 + RAND() * 55) as total_completed,
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1460) DAY) as join_date
FROM (
    SELECT 'Rohan' as first_name, 'Kumar' as last_name, 'Delhi' as location, 'Expert' as level, 739 as n UNION ALL
    SELECT 'Sneha', 'Mehta', 'Mumbai', 'Intermediate', 740 UNION ALL
    SELECT 'Amit', 'Singh', 'Kolkata', 'Beginner', 741 UNION ALL
    SELECT 'Kavita', 'Gupta', 'Bangalore', 'Expert', 742 UNION ALL
    SELECT 'Rajesh', 'Patel', 'Ahmedabad', 'Intermediate', 743 UNION ALL
    SELECT 'Priya', 'Reddy', 'Hyderabad', 'Expert', 744 UNION ALL
    SELECT 'Vikram', 'Sharma', 'Pune', 'Beginner', 745 UNION ALL
    SELECT 'Neha', 'Verma', 'Chennai', 'Intermediate', 746 UNION ALL
    SELECT 'Deepak', 'Joshi', 'Noida', 'Expert', 747 UNION ALL
    SELECT 'Anjali', 'Nair', 'Kochi', 'Intermediate', 748 UNION ALL
    SELECT 'Suresh', 'Desai', 'Surat', 'Expert', 749 UNION ALL
    SELECT 'Divya', 'Iyer', 'Bangalore', 'Intermediate', 750 UNION ALL
    SELECT 'Kunal', 'Agarwal', 'Delhi', 'Beginner', 751 UNION ALL
    SELECT 'Richa', 'Malhotra', 'Mumbai', 'Expert', 752 UNION ALL
    SELECT 'Yash', 'Khanna', 'Pune', 'Intermediate', 753 UNION ALL
    SELECT 'Isha', 'Rao', 'Hyderabad', 'Expert', 754 UNION ALL
    SELECT 'Rohit', 'Kapoor', 'Chennai', 'Beginner', 755 UNION ALL
    SELECT 'Shreya', 'Menon', 'Kolkata', 'Intermediate', 756 UNION ALL
    SELECT 'Nikhil', 'Nair', 'Ahmedabad', 'Expert', 757 UNION ALL
    SELECT 'Meera', 'Krishnan', 'Bangalore', 'Intermediate', 758 UNION ALL
    SELECT 'Aditya', 'Shah', 'Mumbai', 'Expert', 759 UNION ALL
    SELECT 'Pooja', 'Iyer', 'Chennai', 'Intermediate', 760 UNION ALL
    SELECT 'Varun', 'Menon', 'Delhi', 'Beginner', 761 UNION ALL
    SELECT 'Ananya', 'Iyer', 'Bangalore', 'Expert', 762 UNION ALL
    SELECT 'Siddharth', 'Rao', 'Pune', 'Intermediate', 763 UNION ALL
    SELECT 'Isha', 'Patel', 'Ahmedabad', 'Expert', 764 UNION ALL
    SELECT 'Kunal', 'Nair', 'Kochi', 'Beginner', 765 UNION ALL
    SELECT 'Riya', 'Krishnan', 'Bangalore', 'Intermediate', 766 UNION ALL
    SELECT 'Arjun', 'Shah', 'Surat', 'Expert', 767 UNION ALL
    SELECT 'Sanjana', 'Iyer', 'Chennai', 'Intermediate', 768 UNION ALL
    SELECT 'Rohan', 'Desai', 'Surat', 'Expert', 769 UNION ALL
    SELECT 'Tanvi', 'Iyer', 'Chennai', 'Intermediate', 770 UNION ALL
    SELECT 'Harsh', 'Khanna', 'Delhi', 'Beginner', 771 UNION ALL
    SELECT 'Aishwarya', 'Rao', 'Hyderabad', 'Expert', 772 UNION ALL
    SELECT 'Vivek', 'Kapoor', 'Pune', 'Intermediate', 773 UNION ALL
    SELECT 'Nisha', 'Menon', 'Kolkata', 'Expert', 774 UNION ALL
    SELECT 'Abhishek', 'Nair', 'Bangalore', 'Beginner', 775 UNION ALL
    SELECT 'Sakshi', 'Krishnan', 'Mumbai', 'Intermediate', 776 UNION ALL
    SELECT 'Karan', 'Shah', 'Ahmedabad', 'Expert', 777 UNION ALL
    SELECT 'Preeti', 'Reddy', 'Hyderabad', 'Intermediate', 778 UNION ALL
    SELECT 'Manish', 'Menon', 'Chennai', 'Expert', 779 UNION ALL
    SELECT 'Swati', 'Iyer', 'Bangalore', 'Intermediate', 780 UNION ALL
    SELECT 'Gaurav', 'Rao', 'Pune', 'Beginner', 781 UNION ALL
    SELECT 'Richa', 'Malhotra', 'Mumbai', 'Expert', 782 UNION ALL
    SELECT 'Yash', 'Agarwal', 'Delhi', 'Intermediate', 783 UNION ALL
    SELECT 'Anushka', 'Patel', 'Ahmedabad', 'Expert', 784 UNION ALL
    SELECT 'Rishabh', 'Nair', 'Kochi', 'Beginner', 785 UNION ALL
    SELECT 'Shruti', 'Krishnan', 'Bangalore', 'Intermediate', 786 UNION ALL
    SELECT 'Dhruv', 'Shah', 'Surat', 'Expert', 787 UNION ALL
    SELECT 'Ishita', 'Iyer', 'Chennai', 'Intermediate', 788 UNION ALL
    SELECT 'Akash', 'Menon', 'Kolkata', 'Expert', 789 UNION ALL
    SELECT 'Disha', 'Rao', 'Hyderabad', 'Intermediate', 790 UNION ALL
    SELECT 'Rajat', 'Kapoor', 'Pune', 'Beginner', 791 UNION ALL
    SELECT 'Maya', 'Malhotra', 'Mumbai', 'Expert', 792 UNION ALL
    SELECT 'Sahil', 'Agarwal', 'Delhi', 'Intermediate', 793 UNION ALL
    SELECT 'Zara', 'Patel', 'Ahmedabad', 'Expert', 794 UNION ALL
    SELECT 'Ravi', 'Nair', 'Kochi', 'Beginner', 795 UNION ALL
    SELECT 'Kritika', 'Krishnan', 'Bangalore', 'Intermediate', 796 UNION ALL
    SELECT 'Surya', 'Shah', 'Surat', 'Expert', 797 UNION ALL
    SELECT 'Aarav', 'Iyer', 'Chennai', 'Intermediate', 798 UNION ALL
    SELECT 'Ishaan', 'Menon', 'Kolkata', 'Expert', 799 UNION ALL
    SELECT 'Avni', 'Rao', 'Hyderabad', 'Intermediate', 800 UNION ALL
    SELECT 'Vihaan', 'Kapoor', 'Pune', 'Beginner', 801 UNION ALL
    SELECT 'Anika', 'Malhotra', 'Mumbai', 'Expert', 802 UNION ALL
    SELECT 'Advik', 'Agarwal', 'Delhi', 'Intermediate', 803 UNION ALL
    SELECT 'Myra', 'Patel', 'Ahmedabad', 'Expert', 804 UNION ALL
    SELECT 'Aryan', 'Nair', 'Kochi', 'Beginner', 805 UNION ALL
    SELECT 'Kiara', 'Krishnan', 'Bangalore', 'Intermediate', 806 UNION ALL
    SELECT 'Reyansh', 'Shah', 'Surat', 'Expert', 807 UNION ALL
    SELECT 'Aadhya', 'Iyer', 'Chennai', 'Intermediate', 808 UNION ALL
    SELECT 'Arnav', 'Menon', 'Kolkata', 'Expert', 809 UNION ALL
    SELECT 'Saanvi', 'Rao', 'Hyderabad', 'Intermediate', 810 UNION ALL
    SELECT 'Atharv', 'Kapoor', 'Pune', 'Beginner', 811 UNION ALL
    SELECT 'Anvi', 'Malhotra', 'Mumbai', 'Expert', 812 UNION ALL
    SELECT 'Pranav', 'Agarwal', 'Delhi', 'Intermediate', 813 UNION ALL
    SELECT 'Diya', 'Patel', 'Ahmedabad', 'Expert', 814 UNION ALL
    SELECT 'Vivaan', 'Nair', 'Kochi', 'Beginner', 815 UNION ALL
    SELECT 'Aarohi', 'Krishnan', 'Bangalore', 'Intermediate', 816 UNION ALL
    SELECT 'Kiaan', 'Shah', 'Surat', 'Expert', 817 UNION ALL
    SELECT 'Anay', 'Iyer', 'Chennai', 'Intermediate', 818 UNION ALL
    SELECT 'Ahaan', 'Menon', 'Kolkata', 'Expert', 819 UNION ALL
    SELECT 'Aaradhya', 'Rao', 'Hyderabad', 'Intermediate', 820 UNION ALL
    SELECT 'Arhaan', 'Kapoor', 'Pune', 'Beginner', 821 UNION ALL
    SELECT 'Avyaan', 'Malhotra', 'Mumbai', 'Expert', 822 UNION ALL
    SELECT 'Ayaan', 'Agarwal', 'Delhi', 'Intermediate', 823 UNION ALL
    SELECT 'Aarush', 'Patel', 'Ahmedabad', 'Expert', 824 UNION ALL
    SELECT 'Aadvik', 'Nair', 'Kochi', 'Beginner', 825 UNION ALL
    SELECT 'Aarav', 'Krishnan', 'Bangalore', 'Intermediate', 826 UNION ALL
    SELECT 'Aarush', 'Krishnan', 'Surat', 'Expert', 827 UNION ALL
    SELECT 'Aariz', 'Shah', 'Chennai', 'Intermediate', 828 UNION ALL
    SELECT 'Aaryan', 'Iyer', 'Kolkata', 'Expert', 829 UNION ALL
    SELECT 'Aaradhya', 'Menon', 'Delhi', 'Intermediate', 830 UNION ALL
    SELECT 'Aarav', 'Rao', 'Pune', 'Beginner', 831 UNION ALL
    SELECT 'Aarush', 'Kapoor', 'Mumbai', 'Expert', 832 UNION ALL
    SELECT 'Aariz', 'Malhotra', 'Delhi', 'Intermediate', 833 UNION ALL
    SELECT 'Aaryan', 'Agarwal', 'Ahmedabad', 'Expert', 834 UNION ALL
    SELECT 'Aaradhya', 'Patel', 'Kochi', 'Beginner', 835 UNION ALL
    SELECT 'Aarav', 'Nair', 'Bangalore', 'Intermediate', 836 UNION ALL
    SELECT 'Aarush', 'Krishnan', 'Surat', 'Expert', 837 UNION ALL
    SELECT 'Aariz', 'Shah', 'Chennai', 'Intermediate', 838
) as data;

-- =====================================================
-- 100 MORE CLIENTS (714-813)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
SELECT 
    CONCAT(company_name, ' ', n) as name,
    CONCAT(LOWER(REPLACE(company_name, ' ', '')), n, '@company.com') as email,
    CONCAT(company_name, ' Pvt Ltd') as organization,
    location,
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1460) DAY) as member_since
FROM (
    SELECT 'TechNova' as company_name, 'Mumbai' as location, 714 as n UNION ALL
    SELECT 'DataNova', 'Bangalore', 715 UNION ALL
    SELECT 'CloudNova', 'Delhi', 716 UNION ALL
    SELECT 'WebNova', 'Pune', 717 UNION ALL
    SELECT 'AppNova', 'Chennai', 718 UNION ALL
    SELECT 'TechNova', 'Hyderabad', 719 UNION ALL
    SELECT 'DataNova', 'Kolkata', 720 UNION ALL
    SELECT 'CloudNova', 'Ahmedabad', 721 UNION ALL
    SELECT 'WebNova', 'Noida', 722 UNION ALL
    SELECT 'AppNova', 'Kochi', 723 UNION ALL
    SELECT 'TechNova', 'Surat', 724 UNION ALL
    SELECT 'DataNova', 'Mumbai', 725 UNION ALL
    SELECT 'CloudNova', 'Bangalore', 726 UNION ALL
    SELECT 'WebNova', 'Delhi', 727 UNION ALL
    SELECT 'AppNova', 'Pune', 728 UNION ALL
    SELECT 'TechNova', 'Chennai', 729 UNION ALL
    SELECT 'DataNova', 'Hyderabad', 730 UNION ALL
    SELECT 'CloudNova', 'Kolkata', 731 UNION ALL
    SELECT 'WebNova', 'Ahmedabad', 732 UNION ALL
    SELECT 'AppNova', 'Noida', 733 UNION ALL
    SELECT 'TechNova', 'Kochi', 734 UNION ALL
    SELECT 'DataNova', 'Surat', 735 UNION ALL
    SELECT 'CloudNova', 'Mumbai', 736 UNION ALL
    SELECT 'WebNova', 'Bangalore', 737 UNION ALL
    SELECT 'AppNova', 'Delhi', 738 UNION ALL
    SELECT 'TechNova', 'Pune', 739 UNION ALL
    SELECT 'DataNova', 'Chennai', 740 UNION ALL
    SELECT 'CloudNova', 'Hyderabad', 741 UNION ALL
    SELECT 'WebNova', 'Kolkata', 742 UNION ALL
    SELECT 'AppNova', 'Ahmedabad', 743 UNION ALL
    SELECT 'TechNova', 'Noida', 744 UNION ALL
    SELECT 'DataNova', 'Kochi', 745 UNION ALL
    SELECT 'CloudNova', 'Surat', 746 UNION ALL
    SELECT 'WebNova', 'Mumbai', 747 UNION ALL
    SELECT 'AppNova', 'Bangalore', 748 UNION ALL
    SELECT 'TechNova', 'Delhi', 749 UNION ALL
    SELECT 'DataNova', 'Pune', 750 UNION ALL
    SELECT 'CloudNova', 'Chennai', 751 UNION ALL
    SELECT 'WebNova', 'Hyderabad', 752 UNION ALL
    SELECT 'AppNova', 'Kolkata', 753 UNION ALL
    SELECT 'TechNova', 'Ahmedabad', 754 UNION ALL
    SELECT 'DataNova', 'Noida', 755 UNION ALL
    SELECT 'CloudNova', 'Kochi', 756 UNION ALL
    SELECT 'WebNova', 'Surat', 757 UNION ALL
    SELECT 'AppNova', 'Mumbai', 758 UNION ALL
    SELECT 'TechNova', 'Bangalore', 759 UNION ALL
    SELECT 'DataNova', 'Delhi', 760 UNION ALL
    SELECT 'CloudNova', 'Pune', 761 UNION ALL
    SELECT 'WebNova', 'Chennai', 762 UNION ALL
    SELECT 'AppNova', 'Hyderabad', 763 UNION ALL
    SELECT 'TechNova', 'Kolkata', 764 UNION ALL
    SELECT 'DataNova', 'Ahmedabad', 765 UNION ALL
    SELECT 'CloudNova', 'Noida', 766 UNION ALL
    SELECT 'WebNova', 'Kochi', 767 UNION ALL
    SELECT 'AppNova', 'Surat', 768 UNION ALL
    SELECT 'TechNova', 'Mumbai', 769 UNION ALL
    SELECT 'DataNova', 'Bangalore', 770 UNION ALL
    SELECT 'CloudNova', 'Delhi', 771 UNION ALL
    SELECT 'WebNova', 'Pune', 772 UNION ALL
    SELECT 'AppNova', 'Chennai', 773 UNION ALL
    SELECT 'TechNova', 'Hyderabad', 774 UNION ALL
    SELECT 'DataNova', 'Kolkata', 775 UNION ALL
    SELECT 'CloudNova', 'Ahmedabad', 776 UNION ALL
    SELECT 'WebNova', 'Noida', 777 UNION ALL
    SELECT 'AppNova', 'Kochi', 778 UNION ALL
    SELECT 'TechNova', 'Surat', 779 UNION ALL
    SELECT 'DataNova', 'Mumbai', 780 UNION ALL
    SELECT 'CloudNova', 'Bangalore', 781 UNION ALL
    SELECT 'WebNova', 'Delhi', 782 UNION ALL
    SELECT 'AppNova', 'Pune', 783 UNION ALL
    SELECT 'TechNova', 'Chennai', 784 UNION ALL
    SELECT 'DataNova', 'Hyderabad', 785 UNION ALL
    SELECT 'CloudNova', 'Kolkata', 786 UNION ALL
    SELECT 'WebNova', 'Ahmedabad', 787 UNION ALL
    SELECT 'AppNova', 'Noida', 788 UNION ALL
    SELECT 'TechNova', 'Kochi', 789 UNION ALL
    SELECT 'DataNova', 'Surat', 790 UNION ALL
    SELECT 'CloudNova', 'Mumbai', 791 UNION ALL
    SELECT 'WebNova', 'Bangalore', 792 UNION ALL
    SELECT 'AppNova', 'Delhi', 793 UNION ALL
    SELECT 'TechNova', 'Pune', 794 UNION ALL
    SELECT 'DataNova', 'Chennai', 795 UNION ALL
    SELECT 'CloudNova', 'Hyderabad', 796 UNION ALL
    SELECT 'WebNova', 'Kolkata', 797 UNION ALL
    SELECT 'AppNova', 'Ahmedabad', 798 UNION ALL
    SELECT 'TechNova', 'Noida', 799 UNION ALL
    SELECT 'DataNova', 'Kochi', 800 UNION ALL
    SELECT 'CloudNova', 'Surat', 801 UNION ALL
    SELECT 'WebNova', 'Mumbai', 802 UNION ALL
    SELECT 'AppNova', 'Bangalore', 803 UNION ALL
    SELECT 'TechNova', 'Delhi', 804 UNION ALL
    SELECT 'DataNova', 'Pune', 805 UNION ALL
    SELECT 'CloudNova', 'Chennai', 806 UNION ALL
    SELECT 'WebNova', 'Hyderabad', 807 UNION ALL
    SELECT 'AppNova', 'Kolkata', 808 UNION ALL
    SELECT 'TechNova', 'Ahmedabad', 809 UNION ALL
    SELECT 'DataNova', 'Noida', 810 UNION ALL
    SELECT 'CloudNova', 'Kochi', 811 UNION ALL
    SELECT 'WebNova', 'Surat', 812 UNION ALL
    SELECT 'AppNova', 'Mumbai', 813
) as data;

-- =====================================================
-- 100 MORE GIGS (593-692)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(1 + RAND() * 813) as client_id,
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
    SELECT 593 as n UNION SELECT 594 UNION SELECT 595 UNION SELECT 596 UNION SELECT 597
    UNION SELECT 598 UNION SELECT 599 UNION SELECT 600 UNION SELECT 601 UNION SELECT 602
    UNION SELECT 603 UNION SELECT 604 UNION SELECT 605 UNION SELECT 606 UNION SELECT 607
    UNION SELECT 608 UNION SELECT 609 UNION SELECT 610 UNION SELECT 611 UNION SELECT 612
    UNION SELECT 613 UNION SELECT 614 UNION SELECT 615 UNION SELECT 616 UNION SELECT 617
    UNION SELECT 618 UNION SELECT 619 UNION SELECT 620 UNION SELECT 621 UNION SELECT 622
    UNION SELECT 623 UNION SELECT 624 UNION SELECT 625 UNION SELECT 626 UNION SELECT 627
    UNION SELECT 628 UNION SELECT 629 UNION SELECT 630 UNION SELECT 631 UNION SELECT 632
    UNION SELECT 633 UNION SELECT 634 UNION SELECT 635 UNION SELECT 636 UNION SELECT 637
    UNION SELECT 638 UNION SELECT 639 UNION SELECT 640 UNION SELECT 641 UNION SELECT 642
    UNION SELECT 643 UNION SELECT 644 UNION SELECT 645 UNION SELECT 646 UNION SELECT 647
    UNION SELECT 648 UNION SELECT 649 UNION SELECT 650 UNION SELECT 651 UNION SELECT 652
    UNION SELECT 653 UNION SELECT 654 UNION SELECT 655 UNION SELECT 656 UNION SELECT 657
    UNION SELECT 658 UNION SELECT 659 UNION SELECT 660 UNION SELECT 661 UNION SELECT 662
    UNION SELECT 663 UNION SELECT 664 UNION SELECT 665 UNION SELECT 666 UNION SELECT 667
    UNION SELECT 668 UNION SELECT 669 UNION SELECT 670 UNION SELECT 671 UNION SELECT 672
    UNION SELECT 673 UNION SELECT 674 UNION SELECT 675 UNION SELECT 676 UNION SELECT 677
    UNION SELECT 678 UNION SELECT 679 UNION SELECT 680 UNION SELECT 681 UNION SELECT 682
    UNION SELECT 683 UNION SELECT 684 UNION SELECT 685 UNION SELECT 686 UNION SELECT 687
    UNION SELECT 688 UNION SELECT 689 UNION SELECT 690 UNION SELECT 691 UNION SELECT 692
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (630-729)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 692) as gig_id,
    FLOOR(1 + RAND() * 838) as freelancer_id,
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 630 as n UNION SELECT 631 UNION SELECT 632 UNION SELECT 633 UNION SELECT 634
    UNION SELECT 635 UNION SELECT 636 UNION SELECT 637 UNION SELECT 638 UNION SELECT 639
    UNION SELECT 640 UNION SELECT 641 UNION SELECT 642 UNION SELECT 643 UNION SELECT 644
    UNION SELECT 645 UNION SELECT 646 UNION SELECT 647 UNION SELECT 648 UNION SELECT 649
    UNION SELECT 650 UNION SELECT 651 UNION SELECT 652 UNION SELECT 653 UNION SELECT 654
    UNION SELECT 655 UNION SELECT 656 UNION SELECT 657 UNION SELECT 658 UNION SELECT 659
    UNION SELECT 660 UNION SELECT 661 UNION SELECT 662 UNION SELECT 663 UNION SELECT 664
    UNION SELECT 665 UNION SELECT 666 UNION SELECT 667 UNION SELECT 668 UNION SELECT 669
    UNION SELECT 670 UNION SELECT 671 UNION SELECT 672 UNION SELECT 673 UNION SELECT 674
    UNION SELECT 675 UNION SELECT 676 UNION SELECT 677 UNION SELECT 678 UNION SELECT 679
    UNION SELECT 680 UNION SELECT 681 UNION SELECT 682 UNION SELECT 683 UNION SELECT 684
    UNION SELECT 685 UNION SELECT 686 UNION SELECT 687 UNION SELECT 688 UNION SELECT 689
    UNION SELECT 690 UNION SELECT 691 UNION SELECT 692 UNION SELECT 693 UNION SELECT 694
    UNION SELECT 695 UNION SELECT 696 UNION SELECT 697 UNION SELECT 698 UNION SELECT 699
    UNION SELECT 700 UNION SELECT 701 UNION SELECT 702 UNION SELECT 703 UNION SELECT 704
    UNION SELECT 705 UNION SELECT 706 UNION SELECT 707 UNION SELECT 708 UNION SELECT 709
    UNION SELECT 710 UNION SELECT 711 UNION SELECT 712 UNION SELECT 713 UNION SELECT 714
    UNION SELECT 715 UNION SELECT 716 UNION SELECT 717 UNION SELECT 718 UNION SELECT 719
    UNION SELECT 720 UNION SELECT 721 UNION SELECT 722 UNION SELECT 723 UNION SELECT 724
    UNION SELECT 725 UNION SELECT 726 UNION SELECT 727 UNION SELECT 728 UNION SELECT 729
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (279-378)
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
-- 100 MORE PAYMENTS (369-468)
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
-- 100 MORE REVIEWS (156-255)
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
-- 100 MORE MESSAGES (624-723)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 813)  -- client_id
        ELSE FLOOR(1 + RAND() * 838)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 838)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 813)  -- client_id
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
    SELECT 624 as n UNION SELECT 625 UNION SELECT 626 UNION SELECT 627 UNION SELECT 628
    UNION SELECT 629 UNION SELECT 630 UNION SELECT 631 UNION SELECT 632 UNION SELECT 633
    UNION SELECT 634 UNION SELECT 635 UNION SELECT 636 UNION SELECT 637 UNION SELECT 638
    UNION SELECT 639 UNION SELECT 640 UNION SELECT 641 UNION SELECT 642 UNION SELECT 643
    UNION SELECT 644 UNION SELECT 645 UNION SELECT 646 UNION SELECT 647 UNION SELECT 648
    UNION SELECT 649 UNION SELECT 650 UNION SELECT 651 UNION SELECT 652 UNION SELECT 653
    UNION SELECT 654 UNION SELECT 655 UNION SELECT 656 UNION SELECT 657 UNION SELECT 658
    UNION SELECT 659 UNION SELECT 660 UNION SELECT 661 UNION SELECT 662 UNION SELECT 663
    UNION SELECT 664 UNION SELECT 665 UNION SELECT 666 UNION SELECT 667 UNION SELECT 668
    UNION SELECT 669 UNION SELECT 670 UNION SELECT 671 UNION SELECT 672 UNION SELECT 673
    UNION SELECT 674 UNION SELECT 675 UNION SELECT 676 UNION SELECT 677 UNION SELECT 678
    UNION SELECT 679 UNION SELECT 680 UNION SELECT 681 UNION SELECT 682 UNION SELECT 683
    UNION SELECT 684 UNION SELECT 685 UNION SELECT 686 UNION SELECT 687 UNION SELECT 688
    UNION SELECT 689 UNION SELECT 690 UNION SELECT 691 UNION SELECT 692 UNION SELECT 693
    UNION SELECT 694 UNION SELECT 695 UNION SELECT 696 UNION SELECT 697 UNION SELECT 698
    UNION SELECT 699 UNION SELECT 700 UNION SELECT 701 UNION SELECT 702 UNION SELECT 703
    UNION SELECT 704 UNION SELECT 705 UNION SELECT 706 UNION SELECT 707 UNION SELECT 708
    UNION SELECT 709 UNION SELECT 710 UNION SELECT 711 UNION SELECT 712 UNION SELECT 713
    UNION SELECT 714 UNION SELECT 715 UNION SELECT 716 UNION SELECT 717 UNION SELECT 718
    UNION SELECT 719 UNION SELECT 720 UNION SELECT 721 UNION SELECT 722 UNION SELECT 723
) as numbers;

COMMIT;



