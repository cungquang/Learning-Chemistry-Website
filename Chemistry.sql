CREATE DATABASE IF NOT EXISTS Chemistry;
USE Chemistry;

CREATE TABLE IF NOT EXISTS RegisterUser(
	ID INT NOT NULL UNIQUE,
    FirstName CHAR(100) NOT NULL,
    LastName CHAR(100) NOT NULL,
    Email VARCHAR(300) NOT NULL,
    PRIMARY KEY(ID)
);

INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(1, "Chris", "Liu", "chris_liu@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(2, "Frank", "Dong", "frank_dong@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(3, "John", "Minh", "john_minh@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(4, "Xixuan", "Liu", "chris_liu@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(5, "Hong", "Cung", "hong_cung@sfu.ca");
SELECT * FROM RegisterUser;


CREATE TABLE IF NOT EXISTS Post(
	PostID INT NOT NULL UNIQUE,
    PostTitle CHAR(200),
    PostContent VARCHAR(600) NOT NULL,
    PostDate DATE NOT NULL,
    PostTime TIME NOT NULL,
    PRIMARY KEY (PostID)
);

INSERT INTO Post(PostID, PostTitle, PostContent, PostDate, PostTime) VALUES(1, "Chris Post", "By Chris Liu", curdate(), curtime());
INSERT INTO Post(PostID, PostTitle, PostContent, PostDate, PostTime) VALUES(2, "Frank Post", "By Frank Dong", curdate(), curtime());
INSERT INTO Post(PostID, PostTitle, PostContent, PostDate, PostTime) VALUES(3, "John Post", "By John Minh", curdate(), curtime());
INSERT INTO Post(PostID, PostTitle, PostContent, PostDate, PostTime) VALUES(4, "Xixuan Post", "By Xixuan", curdate(), curtime());
INSERT INTO Post(PostID, PostTitle, PostContent, PostDate, PostTime) VALUES(5, "Hong Post", "By Hong", curdate(), curtime());


DELETE FROM Post WHERE PostID = 5;
SELECT * FROM Post;


CREATE TABLE IF NOT EXISTS Discuss(
	PostID INT NOT NULL UNIQUE,
    ID INT NOT NULL,
    CreatorName CHAR(200) NOT NULL,
    PRIMARY KEY (PostID, ID),
	FOREIGN KEY (PostID) references Post(PostID) ON DELETE CASCADE,
    FOREIGN KEY (ID) references RegisterUser(ID) ON DELETE CASCADE
);


INSERT INTO Discuss(PostID, ID, CreatorName) VALUES(1, 1,(SELECT FirstName FROM RegisterUser WHERE ID = 1));
INSERT INTO Discuss(PostID, ID, CreatorName) VALUES(2, 2,(SELECT FirstName FROM RegisterUser WHERE ID = 2));
INSERT INTO Discuss(PostID, ID, CreatorName) VALUES(4, 3,(SELECT FirstName FROM RegisterUser WHERE ID = 3));
INSERT INTO Discuss(PostID, ID, CreatorName) VALUES(3, 4,(SELECT FirstName FROM RegisterUser WHERE ID = 4));
INSERT INTO Discuss(PostID, ID, CreatorName) VALUES(5, 3,(SELECT FirstName FROM RegisterUser WHERE ID = 5));

SELECT * FROM Discuss;



CREATE TABLE IF NOT EXISTS ReplyComment(
	CommentID INT NOT NULL,
    PostID INT NOT NULL,
    EditorName CHAR(200) DEFAULT "Anonymous",
    Content VARCHAR(500),
    CommentDate DATE NOT NULL,
    CommentTime TIME NOT NULL,
    PRIMARY KEY(CommentID, PostID),
    FOREIGN KEY Comment(PostID) references Post(PostID) ON DELETE CASCADE
);

INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(1, 2, 
	(SELECT FirstName FROM RegisterUser R WHERE R.ID = 3),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(2, 2, 
	(SELECT FirstName FROM RegisterUser R WHERE R.ID = 4),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(3, 3, 
	(SELECT FirstName FROM RegisterUser R WHERE R.ID = 4),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(4, 1, 
	(SELECT FirstName FROM RegisterUser R WHERE R.ID = 1),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, Content, CommentDate, CommentTime) VALUES(3, 2, "Hello World", curdate(), curtime()); 

SELECT * FROM ReplyComment;

############################################################ SEARCH BREANCH ##########################################################################################
CREATE TABLE IF NOT EXISTS Compound(
	CompoundName VARCHAR(30) NOT NULL UNIQUE,
    ChemicalFormula VARCHAR(10)  NOT NULL UNIQUE,
    AtomicNumber INT,
    State VARCHAR(30),
    MeltingPoint INT,
    BoilingPoint INT,
    Appearance VARCHAR(100),
    MolecularWeight VARCHAR(30),
    PRIMARY KEY(ChemicalFormula)
);

CREATE TABLE IF NOT EXISTS Produces(
	ReactantFormula VARCHAR(30) NOT NULL,
    ProductFormula VARCHAR(30) NOT NULL,
    ChemicalEquation VARCHAR(100) NOT NULL,
    ReactionCondition VARCHAR(100),
    PRIMARY KEY(ReactantFormula, ProductFormula),
    FOREIGN KEY(ReactantFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE,
    FOREIGN KEY(ProductFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Search (
	CompoundFormula VARCHAR(30) NOT NULL UNIQUE,
	UserID INT NOT NULL UNIQUE, 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula) REFERENCES Compound(CompoundFormula) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES RegisterUser(ID) ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS SearchHistory( 
	CompoundFormula VARCHAR(30) NOT NULL UNIQUE, 
	UserID INT NOT NULL UNIQUE, 
	KeywordHistory VARCHAR (100), 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula, UserID) REFERENCES Search(CompoundFormula,UserID) ON DELETE CASCADE
);




############################################################ End of Search ###########################################################################################

DROP TABLE RegisterUser;
DROP TABLE Post;
DROP TABLE Discuss;
DROP TABLE ReplyComment;


DROP DATABASE Chemistry;