CREATE TABLE Users (
    UserID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE,
    Password VARCHAR2(255) NOT NULL,
    Role VARCHAR2(20) NOT NULL CHECK (Role IN ('Student', 'Instructor'))
);

CREATE TABLE Profiles (
    ProfileID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    UserID NUMBER NOT NULL,
    Bio VARCHAR2(125),
    ProfilePicture VARCHAR2(255),
    Industry VARCHAR2(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Courses (
    CourseID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    InstructorID NUMBER NOT NULL,
    Title VARCHAR2(100) NOT NULL UNIQUE,
    Description VARCHAR2(125),
    Industry VARCHAR2(50),
    IsCertified CHAR(1) DEFAULT 'N' CHECK (IsCertified IN ('Y', 'N')),
    Price NUMBER(10,2) DEFAULT 0.00 NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

CREATE TABLE Enrollments (
    EnrollmentID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    EnrollmentDate DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Tests (
    TestID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    TestTitle VARCHAR2(100) NOT NULL UNIQUE,
    TestDescription VARCHAR2(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Scores (
    ScoreID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    TestID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    Score NUMBER(5,2) NOT NULL CHECK (Score BETWEEN 0 AND 100),
    FOREIGN KEY (TestID) REFERENCES Tests(TestID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Advertisements (
    AdID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    AdTitle VARCHAR2(100) NOT NULL UNIQUE,
    AdDescription VARCHAR2(255),
    Revenue NUMBER(10,2) DEFAULT 0.00 NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE CourseFeedback (
    FeedbackID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    Rating NUMBER(1) NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR2(125),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Certifications (
    CertificationID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    CertificationDate DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);