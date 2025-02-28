

-- حذف الجداول لو كانت موجودة مسبقًا لتجنب الأخطاء
DROP TABLE IF EXISTS Interact;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Interaction;
DROP TABLE IF EXISTS [User];

-- إنشاء جدول المستخدمين
CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL,
    DOB DATE,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    JoinDate DATETIME DEFAULT GETDATE()
);

-- إنشاء جدول المنشورات
CREATE TABLE Post (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    PostDate DATETIME DEFAULT GETDATE(),
    Visability VARCHAR(20) CHECK (Visability IN ('Public', 'Private', 'Friends')) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE CASCADE
);

-- إنشاء جدول التعليقات
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    CommentDate DATETIME DEFAULT GETDATE(),
    Content TEXT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE
);

-- إنشاء جدول التفاعلات
CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY IDENTITY(1,1),
    Type VARCHAR(50) NOT NULL,
    InteractionDate DATETIME DEFAULT GETDATE()
);

-- إنشاء جدول العلاقات بين المستخدمين والتفاعلات
CREATE TABLE Interact (
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    InteractionID INT NOT NULL,
    PRIMARY KEY (UserID, PostID, InteractionID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE,
    FOREIGN KEY (InteractionID) REFERENCES Interaction(InteractionID) ON DELETE CASCADE
);

-- إدخال بيانات تجريبية
INSERT INTO [User] (UserName, DOB, Email, Gender) VALUES ('Ibrahim', '2004-01-01', 'ibrahim@email.com', 'Male');
INSERT INTO Post (UserID, Content, Visability) VALUES (1, 'My first post!', 'Public');
INSERT INTO Comment (UserID, PostID, Content) VALUES (1, 1, 'Great post!');
INSERT INTO Interaction (Type) VALUES ('Like');
INSERT INTO Interact (UserID, PostID, InteractionID) VALUES (1, 1, 1);

-- استعلام لاختبار صحة البيانات
SELECT * FROM [User];
SELECT * FROM Post;
SELECT * FROM Comment;
SELECT * FROM Interaction;
SELECT * FROM Interact;

