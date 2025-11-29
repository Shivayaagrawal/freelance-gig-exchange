
USE freelance_gig_exchange;

-- =====================================================
-- 100 MORE FREELANCERS (512-611)
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
    SELECT 'Rohan' as first_name, 'Kumar' as last_name, 'Delhi' as location, 'Expert' as level, 512 as n UNION ALL
    SELECT 'Sneha', 'Mehta', 'Mumbai', 'Intermediate', 513 UNION ALL
    SELECT 'Amit', 'Singh', 'Kolkata', 'Beginner', 514 UNION ALL
    SELECT 'Kavita', 'Gupta', 'Bangalore', 'Expert', 515 UNION ALL
    SELECT 'Rajesh', 'Patel', 'Ahmedabad', 'Intermediate', 516 UNION ALL
    SELECT 'Priya', 'Reddy', 'Hyderabad', 'Expert', 517 UNION ALL
    SELECT 'Vikram', 'Sharma', 'Pune', 'Beginner', 518 UNION ALL
    SELECT 'Neha', 'Verma', 'Chennai', 'Intermediate', 519 UNION ALL
    SELECT 'Deepak', 'Joshi', 'Noida', 'Expert', 520 UNION ALL
    SELECT 'Anjali', 'Nair', 'Kochi', 'Intermediate', 521 UNION ALL
    SELECT 'Suresh', 'Desai', 'Surat', 'Expert', 522 UNION ALL
    SELECT 'Divya', 'Iyer', 'Bangalore', 'Intermediate', 523 UNION ALL
    SELECT 'Kunal', 'Agarwal', 'Delhi', 'Beginner', 524 UNION ALL
    SELECT 'Richa', 'Malhotra', 'Mumbai', 'Expert', 525 UNION ALL
    SELECT 'Yash', 'Khanna', 'Pune', 'Intermediate', 526 UNION ALL
    SELECT 'Isha', 'Rao', 'Hyderabad', 'Expert', 527 UNION ALL
    SELECT 'Rohit', 'Kapoor', 'Chennai', 'Beginner', 528 UNION ALL
    SELECT 'Shreya', 'Menon', 'Kolkata', 'Intermediate', 529 UNION ALL
    SELECT 'Nikhil', 'Nair', 'Ahmedabad', 'Expert', 530 UNION ALL
    SELECT 'Meera', 'Krishnan', 'Bangalore', 'Intermediate', 531 UNION ALL
    SELECT 'Aditya', 'Shah', 'Mumbai', 'Expert', 532 UNION ALL
    SELECT 'Pooja', 'Iyer', 'Chennai', 'Intermediate', 533 UNION ALL
    SELECT 'Varun', 'Menon', 'Delhi', 'Beginner', 534 UNION ALL
    SELECT 'Ananya', 'Iyer', 'Bangalore', 'Expert', 535 UNION ALL
    SELECT 'Siddharth', 'Rao', 'Pune', 'Intermediate', 536 UNION ALL
    SELECT 'Isha', 'Patel', 'Ahmedabad', 'Expert', 537 UNION ALL
    SELECT 'Kunal', 'Nair', 'Kochi', 'Beginner', 538 UNION ALL
    SELECT 'Riya', 'Krishnan', 'Bangalore', 'Intermediate', 539 UNION ALL
    SELECT 'Arjun', 'Shah', 'Surat', 'Expert', 540 UNION ALL
    SELECT 'Sanjana', 'Iyer', 'Chennai', 'Intermediate', 541 UNION ALL
    SELECT 'Rohan', 'Desai', 'Surat', 'Expert', 542 UNION ALL
    SELECT 'Tanvi', 'Iyer', 'Chennai', 'Intermediate', 543 UNION ALL
    SELECT 'Harsh', 'Khanna', 'Delhi', 'Beginner', 544 UNION ALL
    SELECT 'Aishwarya', 'Rao', 'Hyderabad', 'Expert', 545 UNION ALL
    SELECT 'Vivek', 'Kapoor', 'Pune', 'Intermediate', 546 UNION ALL
    SELECT 'Nisha', 'Menon', 'Kolkata', 'Expert', 547 UNION ALL
    SELECT 'Abhishek', 'Nair', 'Bangalore', 'Beginner', 548 UNION ALL
    SELECT 'Sakshi', 'Krishnan', 'Mumbai', 'Intermediate', 549 UNION ALL
    SELECT 'Karan', 'Shah', 'Ahmedabad', 'Expert', 550 UNION ALL
    SELECT 'Preeti', 'Reddy', 'Hyderabad', 'Intermediate', 551 UNION ALL
    SELECT 'Manish', 'Menon', 'Chennai', 'Expert', 552 UNION ALL
    SELECT 'Swati', 'Iyer', 'Bangalore', 'Intermediate', 553 UNION ALL
    SELECT 'Gaurav', 'Rao', 'Pune', 'Beginner', 554 UNION ALL
    SELECT 'Richa', 'Malhotra', 'Mumbai', 'Expert', 555 UNION ALL
    SELECT 'Yash', 'Agarwal', 'Delhi', 'Intermediate', 556 UNION ALL
    SELECT 'Anushka', 'Patel', 'Ahmedabad', 'Expert', 557 UNION ALL
    SELECT 'Rishabh', 'Nair', 'Kochi', 'Beginner', 558 UNION ALL
    SELECT 'Shruti', 'Krishnan', 'Bangalore', 'Intermediate', 559 UNION ALL
    SELECT 'Dhruv', 'Shah', 'Surat', 'Expert', 560 UNION ALL
    SELECT 'Ishita', 'Iyer', 'Chennai', 'Intermediate', 561 UNION ALL
    SELECT 'Akash', 'Menon', 'Kolkata', 'Expert', 562 UNION ALL
    SELECT 'Disha', 'Rao', 'Hyderabad', 'Intermediate', 563 UNION ALL
    SELECT 'Rajat', 'Kapoor', 'Pune', 'Beginner', 564 UNION ALL
    SELECT 'Maya', 'Malhotra', 'Mumbai', 'Expert', 565 UNION ALL
    SELECT 'Sahil', 'Agarwal', 'Delhi', 'Intermediate', 566 UNION ALL
    SELECT 'Zara', 'Patel', 'Ahmedabad', 'Expert', 567 UNION ALL
    SELECT 'Ravi', 'Nair', 'Kochi', 'Beginner', 568 UNION ALL
    SELECT 'Kritika', 'Krishnan', 'Bangalore', 'Intermediate', 569 UNION ALL
    SELECT 'Surya', 'Shah', 'Surat', 'Expert', 570 UNION ALL
    SELECT 'Aarav', 'Iyer', 'Chennai', 'Intermediate', 571 UNION ALL
    SELECT 'Ishaan', 'Menon', 'Kolkata', 'Expert', 572 UNION ALL
    SELECT 'Avni', 'Rao', 'Hyderabad', 'Intermediate', 573 UNION ALL
    SELECT 'Vihaan', 'Kapoor', 'Pune', 'Beginner', 574 UNION ALL
    SELECT 'Anika', 'Malhotra', 'Mumbai', 'Expert', 575 UNION ALL
    SELECT 'Advik', 'Agarwal', 'Delhi', 'Intermediate', 576 UNION ALL
    SELECT 'Myra', 'Patel', 'Ahmedabad', 'Expert', 577 UNION ALL
    SELECT 'Aryan', 'Nair', 'Kochi', 'Beginner', 578 UNION ALL
    SELECT 'Kiara', 'Krishnan', 'Bangalore', 'Intermediate', 579 UNION ALL
    SELECT 'Reyansh', 'Shah', 'Surat', 'Expert', 580 UNION ALL
    SELECT 'Aadhya', 'Iyer', 'Chennai', 'Intermediate', 581 UNION ALL
    SELECT 'Arnav', 'Menon', 'Kolkata', 'Expert', 582 UNION ALL
    SELECT 'Saanvi', 'Rao', 'Hyderabad', 'Intermediate', 583 UNION ALL
    SELECT 'Atharv', 'Kapoor', 'Pune', 'Beginner', 584 UNION ALL
    SELECT 'Anvi', 'Malhotra', 'Mumbai', 'Expert', 585 UNION ALL
    SELECT 'Pranav', 'Agarwal', 'Delhi', 'Intermediate', 586 UNION ALL
    SELECT 'Diya', 'Patel', 'Ahmedabad', 'Expert', 587 UNION ALL
    SELECT 'Vivaan', 'Nair', 'Kochi', 'Beginner', 588 UNION ALL
    SELECT 'Aarohi', 'Krishnan', 'Bangalore', 'Intermediate', 589 UNION ALL
    SELECT 'Kiaan', 'Shah', 'Surat', 'Expert', 590 UNION ALL
    SELECT 'Anay', 'Iyer', 'Chennai', 'Intermediate', 591 UNION ALL
    SELECT 'Ahaan', 'Menon', 'Kolkata', 'Expert', 592 UNION ALL
    SELECT 'Aaradhya', 'Rao', 'Hyderabad', 'Intermediate', 593 UNION ALL
    SELECT 'Arhaan', 'Kapoor', 'Pune', 'Beginner', 594 UNION ALL
    SELECT 'Avyaan', 'Malhotra', 'Mumbai', 'Expert', 595 UNION ALL
    SELECT 'Ayaan', 'Agarwal', 'Delhi', 'Intermediate', 596 UNION ALL
    SELECT 'Aarush', 'Patel', 'Ahmedabad', 'Expert', 597 UNION ALL
    SELECT 'Aadvik', 'Nair', 'Kochi', 'Beginner', 598 UNION ALL
    SELECT 'Aarav', 'Krishnan', 'Bangalore', 'Intermediate', 599 UNION ALL
    SELECT 'Aariz', 'Shah', 'Surat', 'Expert', 600 UNION ALL
    SELECT 'Aaryan', 'Iyer', 'Chennai', 'Intermediate', 601 UNION ALL
    SELECT 'Aaradhya', 'Menon', 'Kolkata', 'Expert', 602 UNION ALL
    SELECT 'Aarav', 'Rao', 'Hyderabad', 'Intermediate', 603 UNION ALL
    SELECT 'Aarush', 'Kapoor', 'Pune', 'Beginner', 604 UNION ALL
    SELECT 'Aariz', 'Malhotra', 'Mumbai', 'Expert', 605 UNION ALL
    SELECT 'Aaryan', 'Agarwal', 'Delhi', 'Intermediate', 606 UNION ALL
    SELECT 'Aaradhya', 'Patel', 'Ahmedabad', 'Expert', 607 UNION ALL
    SELECT 'Aarav', 'Nair', 'Kochi', 'Beginner', 608 UNION ALL
    SELECT 'Aarush', 'Krishnan', 'Bangalore', 'Intermediate', 609 UNION ALL
    SELECT 'Aariz', 'Shah', 'Surat', 'Expert', 610 UNION ALL
    SELECT 'Aaryan', 'Iyer', 'Chennai', 'Intermediate', 611
) as data;

-- =====================================================
-- 100 MORE CLIENTS (487-586)
-- =====================================================
INSERT IGNORE INTO clients (name, email, organization, location, member_since)
SELECT 
    CONCAT(company_name, ' ', n) as name,
    CONCAT(LOWER(REPLACE(company_name, ' ', '')), n, '@company.com') as email,
    CONCAT(company_name, ' Pvt Ltd') as organization,
    location,
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1460) DAY) as member_since
FROM (
    SELECT 'TechForce' as company_name, 'Mumbai' as location, 487 as n UNION ALL
    SELECT 'DataCore', 'Bangalore', 488 UNION ALL
    SELECT 'CloudBase', 'Delhi', 489 UNION ALL
    SELECT 'WebStream', 'Pune', 490 UNION ALL
    SELECT 'AppCore', 'Chennai', 491 UNION ALL
    SELECT 'TechBase', 'Hyderabad', 492 UNION ALL
    SELECT 'DataBase', 'Kolkata', 493 UNION ALL
    SELECT 'CloudCore', 'Ahmedabad', 494 UNION ALL
    SELECT 'WebBase', 'Noida', 495 UNION ALL
    SELECT 'AppBase', 'Kochi', 496 UNION ALL
    SELECT 'TechCore', 'Surat', 497 UNION ALL
    SELECT 'DataStream', 'Mumbai', 498 UNION ALL
    SELECT 'CloudStream', 'Bangalore', 499 UNION ALL
    SELECT 'WebCore', 'Delhi', 500 UNION ALL
    SELECT 'AppStream', 'Pune', 501 UNION ALL
    SELECT 'TechStream', 'Chennai', 502 UNION ALL
    SELECT 'DataWave', 'Hyderabad', 503 UNION ALL
    SELECT 'CloudWave', 'Kolkata', 504 UNION ALL
    SELECT 'WebWave', 'Ahmedabad', 505 UNION ALL
    SELECT 'AppWave', 'Noida', 506 UNION ALL
    SELECT 'TechWave', 'Kochi', 507 UNION ALL
    SELECT 'DataPulse', 'Surat', 508 UNION ALL
    SELECT 'CloudPulse', 'Mumbai', 509 UNION ALL
    SELECT 'WebPulse', 'Bangalore', 510 UNION ALL
    SELECT 'AppPulse', 'Delhi', 511 UNION ALL
    SELECT 'TechPulse', 'Pune', 512 UNION ALL
    SELECT 'DataEdge', 'Chennai', 513 UNION ALL
    SELECT 'CloudEdge', 'Hyderabad', 514 UNION ALL
    SELECT 'WebEdge', 'Kolkata', 515 UNION ALL
    SELECT 'AppEdge', 'Ahmedabad', 516 UNION ALL
    SELECT 'TechEdge', 'Noida', 517 UNION ALL
    SELECT 'DataHub', 'Kochi', 518 UNION ALL
    SELECT 'CloudHub', 'Surat', 519 UNION ALL
    SELECT 'WebHub', 'Mumbai', 520 UNION ALL
    SELECT 'AppHub', 'Bangalore', 521 UNION ALL
    SELECT 'TechHub', 'Delhi', 522 UNION ALL
    SELECT 'DataLink', 'Pune', 523 UNION ALL
    SELECT 'CloudLink', 'Chennai', 524 UNION ALL
    SELECT 'WebLink', 'Hyderabad', 525 UNION ALL
    SELECT 'AppLink', 'Kolkata', 526 UNION ALL
    SELECT 'TechLink', 'Ahmedabad', 527 UNION ALL
    SELECT 'DataNet', 'Noida', 528 UNION ALL
    SELECT 'CloudNet', 'Kochi', 529 UNION ALL
    SELECT 'WebNet', 'Surat', 530 UNION ALL
    SELECT 'AppNet', 'Mumbai', 531 UNION ALL
    SELECT 'TechNet', 'Bangalore', 532 UNION ALL
    SELECT 'DataGrid', 'Delhi', 533 UNION ALL
    SELECT 'CloudGrid', 'Pune', 534 UNION ALL
    SELECT 'WebGrid', 'Chennai', 535 UNION ALL
    SELECT 'AppGrid', 'Hyderabad', 536 UNION ALL
    SELECT 'TechGrid', 'Kolkata', 537 UNION ALL
    SELECT 'DataBase', 'Ahmedabad', 538 UNION ALL
    SELECT 'CloudBase', 'Noida', 539 UNION ALL
    SELECT 'WebBase', 'Kochi', 540 UNION ALL
    SELECT 'AppBase', 'Surat', 541 UNION ALL
    SELECT 'TechBase', 'Mumbai', 542 UNION ALL
    SELECT 'DataCloud', 'Bangalore', 543 UNION ALL
    SELECT 'CloudCloud', 'Delhi', 544 UNION ALL
    SELECT 'WebCloud', 'Pune', 545 UNION ALL
    SELECT 'AppCloud', 'Chennai', 546 UNION ALL
    SELECT 'TechCloud', 'Hyderabad', 547 UNION ALL
    SELECT 'DataSpace', 'Kolkata', 548 UNION ALL
    SELECT 'CloudSpace', 'Ahmedabad', 549 UNION ALL
    SELECT 'WebSpace', 'Noida', 550 UNION ALL
    SELECT 'AppSpace', 'Kochi', 551 UNION ALL
    SELECT 'TechSpace', 'Surat', 552 UNION ALL
    SELECT 'DataZone', 'Mumbai', 553 UNION ALL
    SELECT 'CloudZone', 'Bangalore', 554 UNION ALL
    SELECT 'WebZone', 'Delhi', 555 UNION ALL
    SELECT 'AppZone', 'Pune', 556 UNION ALL
    SELECT 'TechZone', 'Chennai', 557 UNION ALL
    SELECT 'DataPoint', 'Hyderabad', 558 UNION ALL
    SELECT 'CloudPoint', 'Kolkata', 559 UNION ALL
    SELECT 'WebPoint', 'Ahmedabad', 560 UNION ALL
    SELECT 'AppPoint', 'Noida', 561 UNION ALL
    SELECT 'TechPoint', 'Kochi', 562 UNION ALL
    SELECT 'DataMark', 'Surat', 563 UNION ALL
    SELECT 'CloudMark', 'Mumbai', 564 UNION ALL
    SELECT 'WebMark', 'Bangalore', 565 UNION ALL
    SELECT 'AppMark', 'Delhi', 566 UNION ALL
    SELECT 'TechMark', 'Pune', 567 UNION ALL
    SELECT 'DataLine', 'Chennai', 568 UNION ALL
    SELECT 'CloudLine', 'Hyderabad', 569 UNION ALL
    SELECT 'WebLine', 'Kolkata', 570 UNION ALL
    SELECT 'AppLine', 'Ahmedabad', 571 UNION ALL
    SELECT 'TechLine', 'Noida', 572 UNION ALL
    SELECT 'DataCore', 'Kochi', 573 UNION ALL
    SELECT 'CloudCore', 'Surat', 574 UNION ALL
    SELECT 'WebCore', 'Mumbai', 575 UNION ALL
    SELECT 'AppCore', 'Bangalore', 576 UNION ALL
    SELECT 'TechCore', 'Delhi', 577 UNION ALL
    SELECT 'DataForce', 'Pune', 578 UNION ALL
    SELECT 'CloudForce', 'Chennai', 579 UNION ALL
    SELECT 'WebForce', 'Hyderabad', 580 UNION ALL
    SELECT 'AppForce', 'Kolkata', 581 UNION ALL
    SELECT 'TechForce', 'Ahmedabad', 582 UNION ALL
    SELECT 'DataPower', 'Noida', 583 UNION ALL
    SELECT 'CloudPower', 'Kochi', 584 UNION ALL
    SELECT 'WebPower', 'Surat', 585 UNION ALL
    SELECT 'AppPower', 'Mumbai', 586
) as data;

-- =====================================================
-- 100 MORE GIGS (343-442)
-- =====================================================
INSERT IGNORE INTO gigs (client_id, category_id, title, description, budget, posted_date, deadline_date, status)
SELECT 
    FLOOR(1 + RAND() * 586) as client_id,
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
    SELECT 343 as n UNION SELECT 344 UNION SELECT 345 UNION SELECT 346 UNION SELECT 347
    UNION SELECT 348 UNION SELECT 349 UNION SELECT 350 UNION SELECT 351 UNION SELECT 352
    UNION SELECT 353 UNION SELECT 354 UNION SELECT 355 UNION SELECT 356 UNION SELECT 357
    UNION SELECT 358 UNION SELECT 359 UNION SELECT 360 UNION SELECT 361 UNION SELECT 362
    UNION SELECT 363 UNION SELECT 364 UNION SELECT 365 UNION SELECT 366 UNION SELECT 367
    UNION SELECT 368 UNION SELECT 369 UNION SELECT 370 UNION SELECT 371 UNION SELECT 372
    UNION SELECT 373 UNION SELECT 374 UNION SELECT 375 UNION SELECT 376 UNION SELECT 377
    UNION SELECT 378 UNION SELECT 379 UNION SELECT 380 UNION SELECT 381 UNION SELECT 382
    UNION SELECT 383 UNION SELECT 384 UNION SELECT 385 UNION SELECT 386 UNION SELECT 387
    UNION SELECT 388 UNION SELECT 389 UNION SELECT 390 UNION SELECT 391 UNION SELECT 392
    UNION SELECT 393 UNION SELECT 394 UNION SELECT 395 UNION SELECT 396 UNION SELECT 397
    UNION SELECT 398 UNION SELECT 399 UNION SELECT 400 UNION SELECT 401 UNION SELECT 402
    UNION SELECT 403 UNION SELECT 404 UNION SELECT 405 UNION SELECT 406 UNION SELECT 407
    UNION SELECT 408 UNION SELECT 409 UNION SELECT 410 UNION SELECT 411 UNION SELECT 412
    UNION SELECT 413 UNION SELECT 414 UNION SELECT 415 UNION SELECT 416 UNION SELECT 417
    UNION SELECT 418 UNION SELECT 419 UNION SELECT 420 UNION SELECT 421 UNION SELECT 422
    UNION SELECT 423 UNION SELECT 424 UNION SELECT 425 UNION SELECT 426 UNION SELECT 427
    UNION SELECT 428 UNION SELECT 429 UNION SELECT 430 UNION SELECT 431 UNION SELECT 432
    UNION SELECT 433 UNION SELECT 434 UNION SELECT 435 UNION SELECT 436 UNION SELECT 437
    UNION SELECT 438 UNION SELECT 439 UNION SELECT 440 UNION SELECT 441 UNION SELECT 442
) as numbers;

-- =====================================================
-- 100 MORE APPLICATIONS (382-481)
-- =====================================================
INSERT IGNORE INTO applications (gig_id, freelancer_id, proposal_text, bid_amount, applied_date, status)
SELECT 
    FLOOR(1 + RAND() * 442) as gig_id,
    FLOOR(1 + RAND() * 611) as freelancer_id,
    CONCAT('I have extensive experience in this field and can deliver high-quality work. Proposal for application ', n, '.') as proposal_text,
    FLOOR(30000 + RAND() * 270000) as bid_amount,
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 120) DAY) as applied_date,
    CASE FLOOR(1 + RAND() * 3)
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Approved'
        ELSE 'Rejected'
    END as status
FROM (
    SELECT 382 as n UNION SELECT 383 UNION SELECT 384 UNION SELECT 385 UNION SELECT 386
    UNION SELECT 387 UNION SELECT 388 UNION SELECT 389 UNION SELECT 390 UNION SELECT 391
    UNION SELECT 392 UNION SELECT 393 UNION SELECT 394 UNION SELECT 395 UNION SELECT 396
    UNION SELECT 397 UNION SELECT 398 UNION SELECT 399 UNION SELECT 400 UNION SELECT 401
    UNION SELECT 402 UNION SELECT 403 UNION SELECT 404 UNION SELECT 405 UNION SELECT 406
    UNION SELECT 407 UNION SELECT 408 UNION SELECT 409 UNION SELECT 410 UNION SELECT 411
    UNION SELECT 412 UNION SELECT 413 UNION SELECT 414 UNION SELECT 415 UNION SELECT 416
    UNION SELECT 417 UNION SELECT 418 UNION SELECT 419 UNION SELECT 420 UNION SELECT 421
    UNION SELECT 422 UNION SELECT 423 UNION SELECT 424 UNION SELECT 425 UNION SELECT 426
    UNION SELECT 427 UNION SELECT 428 UNION SELECT 429 UNION SELECT 430 UNION SELECT 431
    UNION SELECT 432 UNION SELECT 433 UNION SELECT 434 UNION SELECT 435 UNION SELECT 436
    UNION SELECT 437 UNION SELECT 438 UNION SELECT 439 UNION SELECT 440 UNION SELECT 441
    UNION SELECT 442 UNION SELECT 443 UNION SELECT 444 UNION SELECT 445 UNION SELECT 446
    UNION SELECT 447 UNION SELECT 448 UNION SELECT 449 UNION SELECT 450 UNION SELECT 451
    UNION SELECT 452 UNION SELECT 453 UNION SELECT 454 UNION SELECT 455 UNION SELECT 456
    UNION SELECT 457 UNION SELECT 458 UNION SELECT 459 UNION SELECT 460 UNION SELECT 461
    UNION SELECT 462 UNION SELECT 463 UNION SELECT 464 UNION SELECT 465 UNION SELECT 466
    UNION SELECT 467 UNION SELECT 468 UNION SELECT 469 UNION SELECT 470 UNION SELECT 471
    UNION SELECT 472 UNION SELECT 473 UNION SELECT 474 UNION SELECT 475 UNION SELECT 476
    UNION SELECT 477 UNION SELECT 478 UNION SELECT 479 UNION SELECT 480 UNION SELECT 481
) as numbers;

-- =====================================================
-- 100 MORE CONTRACTS (214-313)
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
-- 100 MORE PAYMENTS (304-403)
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
-- 100 MORE REVIEWS (127-226)
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
-- 100 MORE MESSAGES (374-473)
-- =====================================================
INSERT IGNORE INTO messages (sender_type, sender_id, receiver_id, message_text, sent_at, is_read)
SELECT 
    CASE FLOOR(1 + RAND() * 2)
        WHEN 1 THEN 'Client'
        ELSE 'Freelancer'
    END as sender_type,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 586)  -- client_id
        ELSE FLOOR(1 + RAND() * 611)  -- freelancer_id
    END as sender_id,
    CASE 
        WHEN FLOOR(1 + RAND() * 2) = 1 THEN FLOOR(1 + RAND() * 611)  -- freelancer_id
        ELSE FLOOR(1 + RAND() * 586)  -- client_id
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
    SELECT 374 as n UNION SELECT 375 UNION SELECT 376 UNION SELECT 377 UNION SELECT 378
    UNION SELECT 379 UNION SELECT 380 UNION SELECT 381 UNION SELECT 382 UNION SELECT 383
    UNION SELECT 384 UNION SELECT 385 UNION SELECT 386 UNION SELECT 387 UNION SELECT 388
    UNION SELECT 389 UNION SELECT 390 UNION SELECT 391 UNION SELECT 392 UNION SELECT 393
    UNION SELECT 394 UNION SELECT 395 UNION SELECT 396 UNION SELECT 397 UNION SELECT 398
    UNION SELECT 399 UNION SELECT 400 UNION SELECT 401 UNION SELECT 402 UNION SELECT 403
    UNION SELECT 404 UNION SELECT 405 UNION SELECT 406 UNION SELECT 407 UNION SELECT 408
    UNION SELECT 409 UNION SELECT 410 UNION SELECT 411 UNION SELECT 412 UNION SELECT 413
    UNION SELECT 414 UNION SELECT 415 UNION SELECT 416 UNION SELECT 417 UNION SELECT 418
    UNION SELECT 419 UNION SELECT 420 UNION SELECT 421 UNION SELECT 422 UNION SELECT 423
    UNION SELECT 424 UNION SELECT 425 UNION SELECT 426 UNION SELECT 427 UNION SELECT 428
    UNION SELECT 429 UNION SELECT 430 UNION SELECT 431 UNION SELECT 432 UNION SELECT 433
    UNION SELECT 434 UNION SELECT 435 UNION SELECT 436 UNION SELECT 437 UNION SELECT 438
    UNION SELECT 439 UNION SELECT 440 UNION SELECT 441 UNION SELECT 442 UNION SELECT 443
    UNION SELECT 444 UNION SELECT 445 UNION SELECT 446 UNION SELECT 447 UNION SELECT 448
    UNION SELECT 449 UNION SELECT 450 UNION SELECT 451 UNION SELECT 452 UNION SELECT 453
    UNION SELECT 454 UNION SELECT 455 UNION SELECT 456 UNION SELECT 457 UNION SELECT 458
    UNION SELECT 459 UNION SELECT 460 UNION SELECT 461 UNION SELECT 462 UNION SELECT 463
    UNION SELECT 464 UNION SELECT 465 UNION SELECT 466 UNION SELECT 467 UNION SELECT 468
    UNION SELECT 469 UNION SELECT 470 UNION SELECT 471 UNION SELECT 472 UNION SELECT 473
) as numbers;

COMMIT;


