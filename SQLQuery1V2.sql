-- Retrieve all data

SELECT * FROM Student 



-- Count the number of participants:

SELECT COUNT(*) AS NumberOfParticipants FROM Student



-- Average age of participants:

SELECT AVG(Age) AS average_age FROM Student



-- Number of participants with depression :

SELECT COUNT(*) AS number_with_depression
FROM Student 
WHERE "Do you have Depression?" = 'Yes';



-- Percentage of participants with anxiety by gender:

SELECT "Choose your gender", COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Student) AS anxiety_percentage
FROM Student
WHERE "Do you have Anxiety?" = 'Yes'
GROUP BY "Choose your gender";



-- Count of participants seeking treatment by type of condition:

SELECT 
    SUM(CASE WHEN "Do you have Depression?" = 'Yes' THEN 1 ELSE 0 END) AS depression_count,
    SUM(CASE WHEN "Do you have Anxiety?" = 'Yes' THEN 1 ELSE 0 END) AS anxiety_count,
    SUM(CASE WHEN "Do you have Panic attack?" = 'Yes' THEN 1 ELSE 0 END) AS panic_attack_count
FROM Student;



-- Average age of participants who sought specialist treatment:

SELECT AVG(age) AS Average_Age 
FROM student
WHERE "Did you seek any specialist for a treatment?" ='yes';



-- Count of participants by marital status and depression status:

SELECT "Marital status", "Do you have Depression?", COUNT(*) AS count
FROM Student
GROUP BY "Marital status", "Do you have Depression?";



-- Calculate Average Age by Gender and Marital Status:

SELECT "Choose your gender", "Marital status", AVG("Age") AS avg_age 
FROM Student
Group BY "Choose your gender" , "Marital status";



-- Calculate the Percentage of Students for Each Mental Health Condition:

SELECT 
SUM(CASE WHEN "Do you have Depression?" = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*) AS depression_percentage,
SUM(CASE WHEN "Do you have Anxiety?" = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*) AS  anxiety_percentage,
SUM(CASE WHEN "Do you have Panic attack?" = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*) AS panic_attack_percentage
FROM Student;



 -- Most Common Course Among Students Who Sought Treatment for Depression: 

 SELECT "What is your course?" , COUNT(*) AS sought_treatment_depression
 FROM Student
 WHERE "Do you have Depression?" = 'Yes' AND "Did you seek any specialist for a treatment?" = 'Yes'
 GROUP BY "What is your course?"
 ORDER BY sought_treatment_depression DESC;



 -- What is the percentage of individuals with anxiety based on their gender and marital status?

 SELECT "Choose your gender" AS Gender, "Marital status" AS MaritalStatus,
    ROUND((COUNT(CASE WHEN "Do you have Anxiety?" = 'Yes' THEN 1 END) * 100.0) / COUNT(*),2) AS PercentageWithAnxiety
FROM Student
GROUP BY "Choose your gender", "Marital status";



-- Average Age of Individuals with Each Mental Health Condition:

SELECT "Do you have Depression?",
    AVG("Age") AS avg_age_depression,
    "Do you have Anxiety?",
    AVG("Age") AS avg_age_anxiety,
    "Do you have Panic attack?",
    AVG("Age") AS avg_age_panic_attack
FROM Student
GROUP BY "Do you have Depression?", "Do you have Anxiety?", "Do you have Panic attack?";














