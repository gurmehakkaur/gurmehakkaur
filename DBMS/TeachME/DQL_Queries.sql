--1. Retrieve all students who are enrolled in courses, along with the course titles and instructors.
SELECT u.FirstName, u.LastName, c.Title AS CourseTitle, i.FirstName AS InstructorFirstName, i.LastName AS InstructorLastName
FROM Enrollments e
JOIN Users u ON e.UserID = u.UserID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Users i ON c.InstructorID = i.UserID
WHERE u.Role = 'Student';

--2. Create a view to list all courses along with the number of students enrolled in each course.
CREATE VIEW CourseEnrollmentCount AS
SELECT c.CourseID, c.Title, COUNT(e.UserID) AS StudentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title;

--3. Calculate the average score for each test across all students.
SELECT t.TestTitle, AVG(s.Score) AS AverageScore
FROM Scores s
JOIN Tests t ON s.TestID = t.TestID
GROUP BY t.TestTitle;

--4. Find the course with the highest enrollment.
SELECT c.Title
FROM Courses c
WHERE c.CourseID = (
    SELECT e.CourseID
    FROM Enrollments e
    GROUP BY e.CourseID
    ORDER BY COUNT(e.UserID) DESC
    FETCH FIRST 1 ROWS ONLY
);

--5. List all students who enrolled in the last 30 days.
SELECT u.FirstName, u.LastName, e.EnrollmentDate
FROM Users u
JOIN Enrollments e ON u.UserID = e.UserID
WHERE u.Role = 'Student'
AND e.EnrollmentDate >= ADD_MONTHS(SYSDATE, -1);


--6. Display the full name of students along with their enrollment dates, formatted.
SELECT u.FirstName || ' ' || u.LastName AS FullName, TO_CHAR(e.EnrollmentDate, 'DD-MON-YYYY') AS EnrollmentDate
FROM Users u
JOIN Enrollments e ON u.UserID = e.UserID
WHERE u.Role = 'Student';

--7. Find courses that have more than 2 students enrolled.
SELECT c.Title, COUNT(e.UserID) AS EnrollmentCount
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
HAVING COUNT(e.UserID) > 2;

--8. Transfer a student from one course to another and ensure both operations succeed or fail together.
BEGIN
    UPDATE Enrollments
    SET CourseID = 2
    WHERE UserID = 1 AND CourseID = 1;
    
    INSERT INTO Enrollments (CourseID, UserID, EnrollmentDate)
    VALUES (3, 1, SYSDATE);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;

--9. Find all instructors who are teaching courses that have at least one student enrolled.
SELECT u.FirstName, u.LastName
FROM Users u
WHERE u.Role = 'Instructor'
AND EXISTS (
    SELECT 1
    FROM Courses c
    JOIN Enrollments e ON c.CourseID = e.CourseID
    WHERE c.InstructorID = u.UserID
);

--10. Find the average course price for instructors who have more than one course.
SELECT AVG(c.Price) AS AveragePrice
FROM Courses c
WHERE c.InstructorID IN (
    SELECT InstructorID
    FROM Courses
    GROUP BY InstructorID
    HAVING COUNT(*) > 1
);

--11. Create a new user with specific roles and permissions, and then revoke a privilege.
CREATE USER gurmehak IDENTIFIED BY gurmehak13;

GRANT CONNECT, RESOURCE TO gurmehak;
GRANT SELECT ON Users TO gurmehak;

REVOKE SELECT ON Users FROM gurmehak;



