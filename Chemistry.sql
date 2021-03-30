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
	VALUES("Calcium", "Ca", 20, "Solid", 842, 1484, "Null gray, silver; with a pale yellow tint", "40.078u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Magnesium", "Mg", 12, "Solid", 650, 1107, "A silvery-white metal that ignites easily in air and burns with a bright light.", "24.305u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Carbon Dioxide", "CO2", NULL, NULL, -56.6, NULL, "Colorless gas", "44.009u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Hydrogen", "H2", 1, "Gas", -259.16, -252.879, "Colorless gas", "1.008u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Oxygen", "O2", 8, NULL, -218.79, -182.96, "Colorless gas", "15.999u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight)
	VALUES("Calcium Carbonate", "CaCO3", NULL, "Solid", 1339, NULL, "Fine white powder; chalky taste", "100.09u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Hydrogen Hydroxide", "H2O", NULL, "Liquid", 0, 99.98, "White crystalline solid, almost colorless liquid with a hint of blue, colorless gas", "18.015u");
INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
	VALUES("Calcium Oxide", "CaO", NULL, "Solid", 2613, 2850, "White to pale yellow/brown powder", "56.077u");

INSERT INTO Compound(CompoundName, ChemicalFormula, AtomicNumber, State, MeltingPoint, BoilingPoint, Appearance, MolecularWeight) 
    VALUES("Iron", "Fe", 26, "Solid", 1538, 2862, "lustrous metallic with a grayish tinge", "55.845u"),
    ("Sulfuric acid", "H2SO4", NULL, "Liquid", 10.31, 337, "Clear, colorless liquid", "98.079u"),
    ("Iron(III) sulfate", "Fe2(SO4)3", NULL, "Solid", 480, 175, "grayish-white crystals", "399.88u"),
    ("Ethane", "C2H6", NULL, "Gas", -182.8, -88.5, "Colorless gas", "30.070u"),
    ("Potassium hydroxide", "KOH", NULL, "Solid", 360, 1327, "white solid, deliquescent", "56.11u"),
    ("Phosphoric acid", "H3PO4", NULL, "Liquid", 40, 212, "colorless syrup", "97.994u"),
    ("Tripotassium phosphate", "K3PO4", NULL, "Solid", 1380, NULL, "White deliquescent powder", "212.27u"),
    ("Tin(IV) oxide", "SnO2", NULL, "Solid", 1630, 1800, "Yellowish or light grey powder", "150.708u"),
    ("Tin", "Sn", 50, "Solid", 231.93, 2602, "silvery-white (beta, β) or gray (alpha, α)", "118.71u"),
    ("Ammonia", "NH3", NULL, "Gas", -77.73, -33.34, "Colourless gas", "17.031u"),
    ("Nitric oxide", "NO", NULL, "Gas", -164, -152, "Colourless gas", "30.006u"),
    ("Potassium nitrate", "KNO3", NULL, "Solid", 334, 400, "white solid", "101.103u"),
    ("Carbonic acid", "H2CO3", NULL, "Liquid", NULL, NULL, "Colourless aqueous solution", "63.03u"),
    ("Potassium carbonate", "K2CO3", NULL, "Solid", 891, NULL, "White, hygroscopic solid", "138.205u"),
    ("Nitric acid", "HNO3", NULL, "Liquid", -42, 83, "Colorless, yellow or red fuming liquid", "63.012u"),
    ("Methane", "CH4", NULL, "Gas", -182.456, -161.5, "Colorless gas", "16.043u"),
    ("Sodium", "Na", 11, "Solid", 97.794, 882.940, "silvery white metallic", "23.000u"),
    ("Chlorine", "Cl", 17, "Gas", -101.5, -34.04, "pale yellow-green gas", "35.453u"),
    ("Sodium chloride", "NaCl", NULL, "Solid", 800.7, 1465, "Colorless cubic crystals", "58.443u"),
    ("Aluminium", "Al", 13, "Solid", 660.32, 2470, "silvery gray metallic", "26.982u"),
    ("Aluminium oxide", "Al2CO3", NULL, "Solid", 2072, 2977, "white solid", "101.960u"),
    ("Nitrogen", "N2", 7, NULL, -209.86, -195.795, "colorless gas, liquid or solid", "14.007u"),
    ("Lead(IV) hydroxide", "Pb(OH)4", NULL, NULL,NULL, NULL, NULL, "275.23u"),
    ("Lead(II) sulfate", "Pb(SO4)2", NULL, "Solid",1087, NULL, "white solid", "303.26u"),
    ("Hydrogen chloride", "HCl", NULL, "Gas",-114.22, -85.05, "Colorless gas", "36.46u"),
    ("Aluminium chloride", "AlCl3", NULL, "Solid",180, NULL, "white or pale yellow solid, hygroscopic", "133.341u"),
    ("Arsenic", "As", 33, "Solid",NULL, NULL, "metallic grey", "74.922u"),
    ("Sodium hydroxide", "NaOH", NULL, "Solid",323, 1388, "White, waxy, opaque crystals", "39.997u"),
    ("Sodium arsenite", "Na3AsO3", NULL, "Solid",550, NULL, "white or grayish powder, hygroscopic", "129.91u"),
    ("Mercury(II) hydroxide", "HgOH2", NULL, NULL, NULL, NULL, NULL, "234.605u"),
    ("Zine", "Zn", 30, 'Solid', 419.53, 907, "silver-gray", "65.38u"),
    ("Zinc chloride", "ZnCl2", NULL, 'Solid', 290, 732, "white crystalline solid, hygroscopic and very deliquescent", "136.315u"),
    ("Phosphorus pentachloride", "PCl5", NULL, 'Solid', 160.5, 166.8, "colourless crystals", "208.22u"),
    ("Tricalcium phosphate", "Ca3(PO4)2", NULL, 'Solid', 1391.5, NULL, "White amorphous powder", "310.18u"),
    ("Calcium sulfate", "CaSO4", NULL, 'Solid', 1460, NULL, " white solid", "136.14u"),
    ("Monocalcium phosphate", "Ca(H2PO4)2", NULL, 'Solid', 109, 203, " White powder", "234.05u"),
    ("Gold(III) sulfide", "Au2S3", NULL, 'Solid', NULL, NULL, " Black powder", "490.1u"),
    ("Gold", "Au", 79, 'Solid', 1064.18, 2970, "metallic yellow", "196.967u"),
    ("Hydrogen sulfide", "H2S", NULL, 'Gas', -82, -60, "Colorless gas", "34.08u"),
    ("Ammonium nitrate", "NH4NO3", NULL, NULL, 169.6, NULL, "Colorless", "80.043u");
    


SELECT * FROM Compound;
    
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
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium oxide"), "2Ca + O2 -> 2CaO", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium oxide"), "2Ca + O2 -> 2CaO", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"), "2H2 + O2 -> 2H2O", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"), "2H2 + O2 -> 2H2O", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"), "CaO + CO2 -> CaCO3", NULL); 
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Carbon Dioxide"),(SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"), "CaO + CO2 -> CaCO3", NULL); 

INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
	VALUES("Fe","Fe2(SO4)3", "2Fe + 3H2SO4 -> Fe2(SO4)3 + 3H2", NULL),
    ("H2SO4", "Fe2(SO4)3", "2Fe + 3H2SO4 -> Fe2(SO4)3 + 3H2", NULL),
    ("C2H6", "CO2", "2C2H6 + 7O2 -> 6H2O + 4CO2", NULL),
    ("O2", "CO2", "2C2H6 + 7O2 -> 6H2O + 4CO2", NULL),
    ("KOH", "K3PO4", "3KOH + H3PO4 -> K3PO4 + 3H2O", NULL),
    ("H3PO4", "K3PO4", "3KOH + H3PO4 -> K3PO4 + 3H2O", NULL),
    ("SnO2", "Sn", "SnO2 + 2H2 -> Sn + 2H2O", NULL),
    ("H2","Sn", "SnO2 + 2H2 -> Sn + 2H2O", NULL),
    ("SnO2", "H2O", "SnO2 + 2H2 -> Sn + 2H2O", NULL),
    ("NH3","NO", "4NH3 + 5O2 -> 4NO + 6H2O", NULL),
    ("O2","NO", "4NH3 + 5O2 -> 4NO + 6H2O", NULL),
    ("KNO3","K2CO3", "2KNO3 + H2CO3 -> K2CO3 + 2HNO3", NULL),
    ("H2CO3","K2CO3", "2KNO3 + H2CO3 -> K2CO3 + 2HNO3", NULL),
    ("KNO3","HNO3", "2KNO3 + H2CO3 -> K2CO3 + 2HNO3", NULL),
    ("H2CO3","HNO3", "2KNO3 + H2CO3 -> K2CO3 + 2HNO3", NULL),
    ("CH4","CO2", "CH4 + 2O2 -> CO2 + 2H2O", NULL),
    ("Na","NaCl", "2Na + 2Cl -> NaCl", NULL),
    ("Cl","NaCl", "2Na + 2Cl -> NaCl", NULL),
    ("Al","Al2CO3", "4Al + 3O2 -> 2Al2CO3", NULL),
    ("O2","Al2CO3", "4Al + 3O2 -> 2Al2CO3", NULL),
    ("N2","NH3", "N2 + 3H2 -> 2NH3", NULL),
    ("H2","NH3", "N2 + 3H2 -> 2NH3", NULL),
    ("H2SO4","Pb(SO4)2", "2H2SO4 + Pb(OH)4 -> Pb(SO4)2 + 4H2O", NULL),
    ("Pb(OH)4","Pb(SO4)2", "2H2SO4 + Pb(OH)4 -> Pb(SO4)2 + 4H2O", NULL),
    ("Al","AlCl3", "2Al + 6HCl -> 2AlCl3 + 3H2", NULL),
    ("HCl","AlCl3", "2Al + 6HCl -> 2AlCl3 + 3H2", NULL),
    ("H3PO4","PCl5", "H3PO4 + 5HCl -> PCl5 + 4H2O", NULL),
    ("HCl","PCl5", "H3PO4 + 5HCl -> PCl5 + 4H2O", NULL),
    ("As","Na3AsO3", "2As + 6NaOH -> 2Na3AsO3 + 3H2", NULL),
    ("NaOH","Na3AsO3", "2As + 6NaOH -> 2Na3AsO3 + 3H2", NULL),
    ("Zn","ZnCl2", "Zn + 2HCl -> ZnCl2 + H2", NULL);
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
    VALUES("HCl","ZnCl2", "Zn + 2HCl -> ZnCl2 + H2", NULL),
    ("Ca3(PO4)2","CaSO4", "Ca3(PO4)2 + 2H2SO4 -> 2CaSO4 + Ca(H2PO4)2", NULL),
    ("H2SO4","CaSO4", "Ca3(PO4)2 + 2H2SO4 -> 2CaSO4 + Ca(H2PO4)2", NULL),
    ("Ca3(PO4)2","Ca(H2PO4)2", "Ca3(PO4)2 + 2H2SO4 -> 2CaSO4 + Ca(H2PO4)2", NULL),
    ("H2SO4","Ca(H2PO4)2", "Ca3(PO4)2 + 2H2SO4 -> 2CaSO4 + Ca(H2PO4)2", NULL),
    ("Au2S3","Au", "Au2S3 + 3H2 -> 2Au + 3H2S", NULL),
    ("H2","Au", "Au2S3 + 3H2 -> 2Au + 3H2S", NULL),
    ("Au2S3","H2S", "Au2S3 + 3H2 -> 2Au + 3H2S", NULL);
INSERT INTO Produces (ReactantFormula, ProductFormula, ChemicalEquation,ReactionCondition)
    VALUES("H2","H2S", "Au2S3 + 3H2 -> 2Au + 3H2S", NULL),
    ("NH4NO3","N2", "2NH4NO3 -> 2N2 + O2 + 4H2O", NULL),
    ("NH4NO3","O2", "2NH4NO3 -> 2N2 + O2 + 4H2O", NULL),
    ("NH4NO3","H2O", "2NH4NO3 -> 2N2 + O2 + 4H2O", NULL);

SELECT * FROM PRODUCES;

CREATE TABLE IF NOT EXISTS Search (
	CompoundFormula VARCHAR(30) NOT NULL,
	UserID CHAR(50) NOT NULL, 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula) REFERENCES Compound(ChemicalFormula) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES RegisterUser(UserID) ON DELETE CASCADE
); 

INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT UserID FROM RegisterUser WHERE UserID = "Frank2012"));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT UserID FROM RegisterUser WHERE UserID = "George123"));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"),(SELECT UserID FROM RegisterUser WHERE UserID = "Mary007"));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"),(SELECT UserID FROM RegisterUser WHERE UserID = "Mary007"));
INSERT INTO Search (CompoundFormula, UserID) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Oxide"),(SELECT UserID FROM RegisterUser WHERE UserID = "Peter238"));

CREATE TABLE IF NOT EXISTS SearchHistory( 
	CompoundFormula VARCHAR(30) NOT NULL, 
	UserID CHAR(50) NOT NULL, 
	KeywordHistory VARCHAR (100), 
	PRIMARY KEY(CompoundFormula, UserID),
	FOREIGN KEY(CompoundFormula, UserID) REFERENCES Search(CompoundFormula,UserID) ON DELETE CASCADE
);

INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium"),(SELECT UserID FROM RegisterUser WHERE UserID = "Frank2012"), "Ca CaCO3");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Oxygen"),(SELECT UserID FROM RegisterUser WHERE UserID = "George123"), "O2 H2O");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Hydrogen Hydroxide"),(SELECT UserID FROM RegisterUser WHERE UserID = "Mary007"),"H2 O2");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Carbonate"),(SELECT UserID FROM RegisterUser WHERE UserID = "Mary007"),"CaCO3 Ca CO2");
INSERT INTO SearchHistory (CompoundFormula, UserID, KeywordHistory) VALUES ((SELECT ChemicalFormula FROM Compound WHERE CompoundName = "Calcium Oxide"),(SELECT UserID FROM RegisterUser WHERE UserID = "Peter238"), "Ca O2");


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
	PostID INT NOT NULL,
    UserID CHAR(50) NOT NULL,
    CreatorName CHAR(200) NOT NULL,
    PRIMARY KEY (PostID, UserID),
	FOREIGN KEY (PostID) references Post(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) references RegisterUser(UserID) ON DELETE CASCADE
);

INSERT INTO Discuss(PostID, UserID, CreatorName) VALUES(1, "Frank2012",(SELECT FirstName FROM RegisterUser WHERE UserID LIKE "Frank2012"));
INSERT INTO Discuss(PostID, UserID, CreatorName) VALUES(1, "George123",(SELECT FirstName FROM RegisterUser WHERE UserID LIKE "George123"));
INSERT INTO Discuss(PostID, UserID, CreatorName) VALUES(2, "Jason054",(SELECT FirstName FROM RegisterUser WHERE UserID LIKE "Jason054"));
INSERT INTO Discuss(PostID, UserID, CreatorName) VALUES(2, "Peter238",(SELECT FirstName FROM RegisterUser WHERE UserID LIKE "Peter238"));
INSERT INTO Discuss(PostID, UserID, CreatorName) VALUES(5, "Frank2012",(SELECT FirstName FROM RegisterUser WHERE UserID LIKE "Frank2012"));

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
	(SELECT FirstName FROM RegisterUser R WHERE R.UserID = "Frank2012"),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(2, 2, 
	(SELECT FirstName FROM RegisterUser R WHERE R.UserID = "George123"),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(3, 3, 
	(SELECT FirstName FROM RegisterUser R WHERE R.UserID = "Peter238"),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(4, 1, 
	(SELECT FirstName FROM RegisterUser R WHERE R.UserID = "Mary007"),"Hello World", curdate(), curtime()); 
INSERT INTO ReplyComment(CommentID, PostID, EditorName, Content, CommentDate, CommentTime) VALUES(5, 5,"Jason", "Hello World", curdate(), curtime()); 

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