from webapp import db

#-------------------------------ReplyComment table-------------------------------- 
# Compound():
# Pre-condition: None
# Post-condition: construct the table of compound information
class Compound(db.Model):
    __tablename__ = "compound"
  
    # Construct attributes, primary key
    # Primary key: CompoundName, ChemicalFormula
    CompoundName = db.Column(db.String(30), primary_key = True, nullable = False)
    ChemicalFormula = db.Column(db.String(30), primary_key = True, nullable = False)
    AtomicNumber = db.Column(db.Integer())
    State = db.Column(db.String(30))
    MeltingPoint = db.Column(db.Integer())
    BoilingPoint = db.Column(db.Integer())
    Appearance = db.Column(db.String(100))
    MolecularWeight = db.Column(db.String(30))

    def __repr__(self):
        return f"Compound('{self.CompoundName}','{self.ChemicalFormula}','{self.AtomicNumber}','{self.State}','{self.MeltingPoint}','{self.BoilingPoint}','{self.Appearance}','{self.MolecularWeight}')"

#-------------------------------ReplyComment table-------------------------------- 
# Produces():
# Pre-condition: Compound table exists
# Post-condition: construct the table of produces
class Produces(db.Model):
    __tablename__ = "produces"
  
    # Construct attributes, primary key and foreign key 
    # Primary key: ReactantFormula, ProductFormula
    # Foreign key:
    # Products.ReactantFormula references Compound.ChemicalFormula
    # Products.ProductFormula references Compound.ChemicalFormula
    ReactantFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    ProductFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    ChemicalEquation = db.Column(db.String(100), nullable = False)

    # Enable to interact with the data from Compound
    compound_ref = db.relationship('Compound', foreign_keys = [ReactantFormula])
    product_ref = db.relationship('Compound', foreign_keys = [ProductFormula])

    def __repr__(self):
        return f"Producesc('{self.ReactantFormula}','{self.ProductFormula}','{self.ChemicalEquation}')"

#-------------------------------ReplyComment table-------------------------------- 
# Search():
# Pre-condition: Compound, RegisterUser tables exist
# Post-condition: construct the table of search
class Search(db.Model):
    __tablename__ = "search"
    
    # Construct attributes, primary key and foreign key 
    # Primary key: CompoundFormula, UserID
    # Foreign key:
    # Search.CompoundFormula references Compound.ChemicalFormula
    # Search.UserID references User.UserID
    CompoundFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)

    # Enable to interact with the data from Compound and RegisterUser
    search = db.relationship('Compound',lazy = True)
    search = db.relationship('RegisterUser',lazy = True)

    def __repr__(self):
        return f"Search('{self.CompoundFormula}','{self.UserID}')"

#-------------------------------ReplyComment table-------------------------------- 
# SearchHistory():
# Pre-condition: Compound, RegisterUser tables exist
# Post-condition: construct the table of search
class SearchHistory(db.Model):
    __tablename__ = "searchhistory"

    # Construct attributes, primary key and foreign key 
    # Primary key: CompoundFormula, UserID
    # Foreign key:
    # SearchHistory.CompoundFormula references Compound.ChemicalFormula
    # SearchHistory.UserID references User.UserID
    CompoundFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)
    KeywordHistory = db.Column(db.String(100))

    # Enable to interact with the data from Compound and RegisterUser
    searchhistory = db.relationship('Compound',lazy = True)
    searchhistory = db.relationship('RegisterUser',lazy = True)

    def __repr__(self):
        return f"SearchHistory('{self.CompoundFormula}','{self.UserID}','{self.KeywordHistory}')"

#----------------------------------Create table----------------------------------- 

#Create all empty tables:
db.create_all()
