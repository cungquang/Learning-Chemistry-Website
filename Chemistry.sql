CREATE DATABASE IF NOT EXISTS Chemistry;
USE Chemistry;

CREATE TABLE IF NOT EXISTS RegisterUser(
UserID CHAR(50) NOT NULL, 
FirstName CHAR(50) NOT NULL,
LastName CHAR(50) NOT NULL,
Email CHAR(100) NOT NULL,
PRIMARY KEY(UserID),
UNIQUE(UserID)
);	

INSERT INTO RegisterUser VALUES("Frank2012", "Lei", "Dong", "frankdong2012@gmail.com");
INSERT INTO RegisterUser VALUES("George123", "George", "Smith", "gsmite0202@sfu.ca"); 
INSERT INTO RegisterUser VALUES("Jason054", "Jason", "Lee", "jlee9806@sfu.ca");
INSERT INTO RegisterUser VALUES("Mary007", "Mary", "James", "mjames9712@gmail.com");
INSERT INTO RegisterUser VALUES("Peter238", "Peter", "Allan", "pallan9910@gmail.com");

SELECT * FROM RegisterUser;

INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(1, "Chris", "Liu", "chris_liu@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(2, "Frank", "Dong", "frank_dong@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(3, "John", "Minh", "john_minh@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(4, "Xixuan", "Liu", "chris_liu@sfu.ca");
INSERT INTO RegisterUser(ID, Firstname, LastName, EmaiL) VALUES(5, "Hong", "Cung", "hong_cung@sfu.ca");


############################################################ SEARCH BRANCH ##########################################################################################
CREATE TABLE IF NOT EXISTS Compound(
	CompoundName VARCHAR(30) NOT NULL,
    ChemicalFormula VARCHAR(10)  NOT NULL,
    AtomicNumber INT,
    State VARCHAR(30),
    MeltingPoint INT,
    BoilingPoint INT,
    Appearance VARCHAR(100),
    MolecularWeight VARCHAR(30),
    PRIMARY KEY(ChemicalFormula)
);
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Calcium", "Ca", 20, "Solid", 842, 1484, "Null gray, silver; with a pale yellow tint", "40.078u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Magnesium", "Mg", 12, "Solid", 650, 1107, "A silvery-white metal that ignites easily in air and burns with a bright light.", "24.305u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Carbon Dioxide", "CO2", NULL, NULL, -56.6, NULL, "Colorless gas", "44.009u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Hydrogen", "H", 1, "Gas", -259.16, -252.879, "Colorless gas", "1.008u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Oxygen", "O", 8, NULL, -218.79, -182.96, "Colorless gas", "15.999u");
   INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight)
	VALUE("Calcium Carbonate", "CaCO3", NULL, "Solid", 1339, NULL, "Fine white powder; chalky taste", "100.09u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Hydrogen Hydroxide", "H2O", NULL, "Liquid", 0, 99.98, "White crystalline solid, almost colorless liquid with a hint of blue, colorless gas", "18.015u");
    INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUE("Calcium Oxide", "CaO", NULL, "Solid", 2613, 2850, "White to pale yellow/brown powder", "56.077u");
    
CREATE TABLE IF NOT EXISTS Produces(
	ReactantFormula VARCHAR(30) NOT NULL,
    ProductFormula VARCHAR(30) NOT NULL,
    ChemicalEquation VARCHAR(100) NOT NULL,
    ReactionCondition VARCHAR(100),
    PRIMARY KEY(ReactantFormula, ProductFormula),
    FOREIGN KEY(ReactantFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE,
    FOREIGN KEY(ProductFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE
);
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium oxide"), "2Ca + O2 -> 2CaO", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium oxide"), "2Ca + O2 -> 2CaO", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"), "2H2 + O2 -> 2H2O", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"), "2H2 + O2 -> 2H2O", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"), "CaO + CO2 -> CaCO3", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
VALUE((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Carbon Dioxide"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"), "CaO + CO2 -> CaCO3", NULL); 



CREATE TABLE IF NOT EXISTS Search (
	CompoundFormula VARCHAR(30) NOT NULL,
	UserID INT NOT NULL, 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES RegisterUser(ID) ON DELETE CASCADE
); 
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ID FROM RegisterUser WHERE ID = 1));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ID FROM RegisterUser WHERE ID = 2));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"),(SELECT ID FROM RegisterUser WHERE ID = 3));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"),(SELECT ID FROM RegisterUser WHERE ID = 4));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Oxide"),(SELECT ID FROM RegisterUser WHERE ID = 3));

CREATE TABLE IF NOT EXISTS SearchHistory( 
	CompoundFormula VARCHAR(30) NOT NULL, 
	UserID INT NOT NULL, 
	KeywordHistory VARCHAR (100), 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula, UserID) REFERENCES Search(CompoundFormula,UserID) ON DELETE CASCADE
);

INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ID FROM RegisterUser WHERE ID = 1), "Ca CaCO3");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ID FROM RegisterUser WHERE ID = 2), "O2 H2O");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"),(SELECT ID FROM RegisterUser WHERE ID = 3),"H2 O2");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"),(SELECT ID FROM RegisterUser WHERE ID = 4),"CaCO3 Ca CO2");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Oxide"),(SELECT ID FROM RegisterUser WHERE ID = 3), "Ca O2");


############################################################ End of Search ###########################################################################################



############################################################ LEARN BRANCH ##########################################################################################
CREATE TABLE IPAddress(
IPAddress CHAR(50) NOT NULL,
UserID CHAR(50) NOT NULL, 
PRIMARY KEY(UserID),
UNIQUE(UserID),
FOREIGN KEY(UserID) references RegisterUser(UserID) ON DELETE CASCADE
);
INSERT INTO IPAddress VALUES("192.168.2.0", "Frank2012");
INSERT INTO IPAddress VALUES("162.16.215.3", "George123");
INSERT INTO IPAddress VALUES("132.122.70.8", "Jason054");
INSERT INTO IPAddress VALUES("238.17.204.32", "Mary007");
INSERT INTO IPAddress VALUES("182.138.1.5", "Peter238");

SELECT * FROM IPAddress;

CREATE TABLE PracticeQuestion(
QuestionID INT NOT NULL,
Content VARCHAR(500) NOT NULL,
Solution VARCHAR(500) NOT NULL,
Difficulty CHAR(50) NOT NULL, 
PRIMARY KEY(QuestionID),
UNIQUE(QuestionID)
);
INSERT INTO PracticeQuestion VALUES(1, "Zn(s) + Hcl(aq) -> ZnCl2(aq) + H2(g)", "Zn(s) + 2Hcl(aq) -> ZnCl2(aq) + H2(g)", "easy");
INSERT INTO PracticeQuestion VALUES(2, "Al(s) + H2SO4(aq) -> Al2(SO4)3(aq) + H2(g)", "2Al(s) + 3H2SO4(aq) -> Al2(SO4)3(aq) + 3H2(g)", "medium");
INSERT INTO PracticeQuestion VALUES(3, "NaOH(aq) + FeCl3(aq) -> NaCl(aq) + Fe(OH)3(s)", "3NaOH(aq) + FeCl3(aq) -> 3NaCl(aq) + Fe(OH)3(s)", "medium");
INSERT INTO PracticeQuestion VALUES(4, "Which one of the following is not a strong acid ?", "C", "easy");
INSERT INTO PracticeQuestion VALUES(5, "Which one of the following is not the necessary condition for combustion reaction ?", "D", "medium");

SELECT * FROM PracticeQuestion;

CREATE TABLE BalanceEquation(
QuestionID INT NOT NULL,
PRIMARY KEY(QuestionID),
UNIQUE(QuestionID),
FOREIGN KEY(QuestionID) references PracticeQuestion(QuestionID) ON DELETE CASCADE
);
INSERT INTO BalanceEquation VALUES(1);
INSERT INTO BalanceEquation VALUES(2);
INSERT INTO BalanceEquation VALUES(3);

SELECT * FROM BalanceEquation;

CREATE TABLE MultipleChoice(
QuestionID INT NOT NULL,
PRIMARY KEY(QuestionID),
UNIQUE(QuestionID),
FOREIGN KEY(QuestionID) references PracticeQuestion(QuestionID) ON DELETE CASCADE
);
INSERT INTO MultipleChoice VALUES(4);
INSERT INTO MultipleChoice VALUES(5);

SELECT * FROM MultipleChoice;

CREATE TABLE Choice(
QuestionID INT NOT NULL,
ChoiceID CHAR(3) NOT NULL,
Content VARCHAR(500) NOT NULL,
Explanation VARCHAR(500),
PRIMARY KEY(QuestionID, ChoiceID),
FOREIGN KEY(QuestionID) references MultipleChoice(QuestionID) ON DELETE CASCADE
);
INSERT INTO Choice VALUES(4, "A", "HCl", NULL);
INSERT INTO Choice VALUES(4, "B", "H2SO4", NULL);
INSERT INTO Choice VALUES(4, "C", "H3PO4", NULL);
INSERT INTO Choice VALUES(4, "D", "HBr", NULL);
INSERT INTO Choice VALUES(5, "A", "Flammabe substance", NULL);
INSERT INTO Choice VALUES(5, "B", "Supporter gas of combustion", NULL);
INSERT INTO Choice VALUES(5, "C", "Ignition temperature", NULL);
INSERT INTO Choice VALUES(5, "D", "Presence of fire", "The presence of fire is not necessary as long as ignition temperature is reached");

SELECT * FROM Choice;

CREATE TABLE Learn(
UserID CHAR(50) NOT NULL, 
QuestionID INT NOT NULL,
PRIMARY KEY(UserID, QuestionID),
UNIQUE(UserID, QuestionID),
FOREIGN KEY(UserID) references RegisterUser(UserID) ON DELETE CASCADE,
FOREIGN KEY(QuestionID) references PracticeQuestion(QuestionID) ON DELETE CASCADE
);
INSERT INTO Learn VALUES("Frank2012", 2);
INSERT INTO Learn VALUES("Frank2012", 3);
INSERT INTO Learn VALUES("Frank2012", 4);
INSERT INTO Learn VALUES("Jason054", 1);
INSERT INTO Learn VALUES("Peter238", 5);

SELECT * FROM Learn;
############################################################ End of Learn ###########################################################################################



############################################################ DISCUSS BRANCH ##########################################################################################

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

############################################################ End of Discuss ###########################################################################################



############################################################ DELETE AND DROP ###########################################################################################

DROP TABLE RegisterUser;
DROP TABLE Post;
DROP TABLE Discuss;
DROP TABLE ReplyComment;
DROP TABLE Compound; 
DROP TABLE Produces; 
DROP TABLE Search; 
DROP TABLE SearchHistory; 

DROP DATABASE Chemistry;