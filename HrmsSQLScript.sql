CREATE TABLE Users(
Id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
Email_Address varchar(50)  NOT NULL,
Password varchar(25) NOT NULL,
Is_Verified boolean DEFAULT false NOT NULL,
Created_Date date NOT NULL,
CONSTRAINT "PK_Users" PRIMARY KEY (Id),
CONSTRAINT "UK_Users_Email_Address" UNIQUE (Email_Address))

CREATE TABLE System_Personnel(
Id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
User_Id int  NOT NULL,
First_Name varchar(50) NOT NULL,
Personnel_Number varchar(4)  NOT NULL,
Last_Name varchar(50) NOT NULL,
Nationality_Identity char(11)   NOT NULL,
CONSTRAINT "PK_System_Personnel" PRIMARY KEY (Id),
CONSTRAINT "UK_SystemPersonnel_Nationality_Id" UNIQUE  (Nationality_Identity),
CONSTRAINT "FK_SystemPersonnel_Users" FOREIGN KEY(User_Id)
REFERENCES Users(Id))

CREATE TABLE Candidate(
Id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
User_Id int NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
Nationality_Identity char(11)  NOT NULL,
Date_Of_Birth date NOT NULL,
Is_Mernis_Verified boolean DEFAULT false NOT NULL,
CONSTRAINT "PK_Employee" PRIMARY KEY (Id),
CONSTRAINT "UK_Employee_Nationality_Identity" UNIQUE (Nationality_Identity),
CONSTRAINT "FK_Employee_Users" FOREIGN KEY(User_Id)
REFERENCES Users (Id))

CREATE TABLE Employeer(
Id int NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
User_Id int  NOT NULL,
Company_Name varchar(100) NOT NULL,
Web_Site_Address varchar(100) NOT NULL,
Tel_Number varchar(20) NOT NULL,
Is_System_Verified boolean DEFAULT false NOT NULL,
CONSTRAINT "PK_Employeer" PRIMARY KEY (Id),
CONSTRAINT "FK_Employeer_Users" FOREIGN KEY(User_Id)
REFERENCES Users(Id))

CREATE TABLE Activation(
Id int NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
User_Id int NOT NULL,
Activation_Code varchar(250) NOT NULL,
Created_Date_Activation date NOT NULL,
CONSTRAINT "PK_Activation" PRIMARY KEY (Id),
CONSTRAINT "UK_Activation_Activation_Code" UNIQUE (Activation_Code),
CONSTRAINT "FK_Activation_Users" FOREIGN KEY(User_Id)
REFERENCES Users (Id))

CREATE TABLE Mail_Activation(
Id int NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
Activation_Id int NOT NULL,
Mail_Content text NOT NULL,
Is_Sent_Mail boolean DEFAULT false NOT NULL,
CONSTRAINT "PK_Mail_Activation" PRIMARY KEY (Id),
CONSTRAINT "FK_Mail_Activation_Activation" FOREIGN KEY(Activation_Id)
REFERENCES Activation(Id))

CREATE TABLE Verification_By_System_Personnel(
Id int NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
System_Personnel_Id int NOT NULL,
Employeer_Id int NOT NULL,
Verification_Date date NOT NULL,
CONSTRAINT "PK_Verification_By_System_Personel" PRIMARY KEY (Id),
CONSTRAINT "FK_Verification_By_System_Personnel_System_Personnel" FOREIGN KEY(System_Personnel_Id)
REFERENCES System_Personnel(Id),
CONSTRAINT "FK_Verification_By_System_Personnel_Employeer" FOREIGN KEY(Employeer_Id)
REFERENCES Employeer(Id))

CREATE TABLE Job_Position(
id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY(INCREMENT 1 START 1),
Position_Number varchar(8) NOT NULL,
Position_Name varchar(100) NOT NULL,
CONSTRAINT "PK_Job_Position" PRIMARY KEY (Id),
CONSTRAINT "UK_JobPosition_Position_Name" UNIQUE (Position_Name))










