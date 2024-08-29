SELECT * FROM USERS;
-- Populate Users Table
INSERT ALL
    INTO Users (UserID, FirstName, LastName, Email, Password, Role)
    VALUES (1,'John', 'Doe', 'john@example.com', 'hashedpassword1', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role)
    VALUES (2, 'Jane', 'Smith', 'jane@example.com', 'hashedpassword2', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role)
    VALUES (3, 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword3', 'Student')
    INTO Users (UserID,FirstName, LastName, Email, Password, Role)
    VALUES (4, 'Bob', 'Brown', 'bob@example.com', 'hashedpassword4', 'Instructor')
SELECT * FROM dual;

-- Populate Profiles Table
INSERT ALL
    INTO Profiles (ProfileID, UserID, Bio, ProfilePicture, Industry)
    VALUES (1,1, 'Cooking and learning Lover', 'https://something.com/profilepic1.jpg', 'Tech')
    INTO Profiles (ProfileID,UserID, Bio, ProfilePicture, Industry)
    VALUES (2, 2, 'Experienced software developer.', 'https://something.com/profilepic2.jpg', 'Tech')
    INTO Profiles (ProfileID,UserID, Bio, ProfilePicture, Industry)
    VALUES (3, 3, 'Passionate about AI and Machine Learning.', 'https://something.com/profilepic3.jpg', 'AI')
    INTO Profiles (ProfileID,UserID, Bio, ProfilePicture, Industry)
    VALUES (4, 4, 'Interseted in web development.', 'https://something.com/profilepic4.jpg', 'Web Development')
SELECT * FROM dual;

-- Populate Courses Table
INSERT ALL
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price)
    VALUES (1,2, 'Intro to Programming', 'Learn the basics of programming', 'Tech', 'Y', 49.99)
    INTO Courses (CourseID,InstructorID, Title, Description, Industry, IsCertified, Price)
    VALUES (2,4, 'Advanced Web Development', 'Master web development skills', 'Web Development', 'Y', 99.99)
    INTO Courses (CourseID,InstructorID, Title, Description, Industry, IsCertified, Price)
    VALUES (3,2, 'Data Structures', 'In-depth course on data structures', 'Tech', 'N', 59.99)
    INTO Courses (CourseID,InstructorID, Title, Description, Industry, IsCertified, Price)
    VALUES (4,4, 'AI Fundamentals', 'Introduction to AI concepts', 'AI', 'Y', 79.99)
SELECT * FROM dual;

-- Populate Enrollments Table
INSERT ALL
    INTO Enrollments (EnrollmentID, CourseID, UserID, EnrollmentDate)
    VALUES (1, 1, 1, SYSDATE)
    INTO Enrollments (EnrollmentID, CourseID, UserID, EnrollmentDate)
    VALUES (2, 2, 3, SYSDATE)
    INTO Enrollments (EnrollmentID, CourseID, UserID, EnrollmentDate)
    VALUES (3, 3, 1, SYSDATE)
    INTO Enrollments (EnrollmentID, CourseID, UserID, EnrollmentDate)
    VALUES (4, 4, 3, SYSDATE)
SELECT * FROM dual;

-- Populate Tests Table
INSERT ALL
    INTO Tests (TestID, CourseID, TestTitle, TestDescription)
    VALUES (1, 1, 'Final Exam - Programming', 'Comprehensive exam covering all course material')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription)
    VALUES (2, 2, 'Midterm - Web Development', 'Midterm exam for advanced web development course')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription)
    VALUES (3, 3, 'Quiz - Data Structures', 'Quiz on basic data structures')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription)
    VALUES (4, 4, 'Final Exam - AI Fundamentals', 'Final exam on AI concepts')
SELECT * FROM dual;

-- Populate Scores Table
INSERT ALL
    INTO Scores (ScoreID, TestID, UserID, Score)
    VALUES (1, 1, 1, 95.00)
    INTO Scores (ScoreID, TestID, UserID, Score)
    VALUES (2, 2, 3, 88.00)
    INTO Scores (ScoreID,TestID, UserID, Score)
    VALUES (3, 3, 1, 76.00)
    INTO Scores (ScoreID, TestID, UserID, Score)
    VALUES (4, 4, 3, 89.00)
SELECT * FROM dual;

-- Populate Advertisements Tablee
INSERT ALL
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue)
    VALUES (1, 1, 'Learn Programming', 'Advertise your programming courses here', 500.00)
    INTO Advertisements (AdID,CourseID, AdTitle, AdDescription, Revenue)
    VALUES (2, 4, 'Master Web Development', 'Promote your web development course', 700.00)
    INTO Advertisements (AdID,CourseID, AdTitle, AdDescription, Revenue)
    VALUES (3, 3, 'Data Structures', 'Advertise your data structures course', 600.00)
    INTO Advertisements (AdID,CourseID, AdTitle, AdDescription, Revenue)
    VALUES (4, 2, 'AI Fundamentals', 'Promote your AI course', 800.00)
SELECT * FROM Dual;

-- Populate CourseFeedback Table
INSERT ALL
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Rating, Comments)
    VALUES (1, 1, 1, 4, 'Great introduction to programming!')
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Rating, Comments)
    VALUES (2, 3, 3, 5, 'Loved the advanced web development course!')
    INTO CourseFeedback (FeedbackID,CourseID, UserID, Rating, Comments)
    VALUES (3, 4, 1, 3, 'Data structures could be more detailed.')
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Rating, Comments)
    VALUES (4, 2, 3, 4, 'Good AI fundamentals course.')
SELECT * FROM dual;

-- Populate Certifications TableE
INSERT ALL
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate)
    VALUES (1, 2, 3, SYSDATE)
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate)
    VALUES (2, 1, 1, SYSDATE)
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate)
    VALUES (3, 4, 3, SYSDATE)
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate)
    VALUES (4, 4, 1, SYSDATE)
SELECT * FROM dual;
