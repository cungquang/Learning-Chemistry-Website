from webapp import db

#-------------------------------ReplyComment table-------------------------------- 
class Compound(db.Model):
    __tablename__ = "compound"
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
class Produces(db.Model):
    __tablename__ = "produces"
    ReactantFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    ProductFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    ChemicalEquation = db.Column(db.String(100), nullable = False)
    #Setup foreign key: Products.ReactantFormula references Compound.ChemicalFormula
    #                   Products.ProductFormula references Compound.ChemicalFormula

    compound_ref = db.relationship('Compound', foreign_keys = [ReactantFormula])
    product_ref = db.relationship('Compound', foreign_keys = [ProductFormula])

    def __repr__(self):
        return f"Producesc('{self.ReactantFormula}','{self.ProductFormula}','{self.ChemicalEquation}','{self.ReactionCondition}')"

#-------------------------------ReplyComment table-------------------------------- 
class Search(db.Model):
    __tablename__ = "search"
    CompoundFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)

    # Setup foreign key: Search.CompoundFormula references Compound.ChemicalFormula
    #                    Search.UserID references User.UserID
    search = db.relationship('Compound',lazy = True)
    search = db.relationship('RegisterUser',lazy = True)

    def __repr__(self):
        return f"Search('{self.CompoundFormula}','{self.UserID}')"

#-------------------------------ReplyComment table-------------------------------- 
class SearchHistory(db.Model):
    __tablename__ = "searchhistory"
    CompoundFormula = db.Column(db.String(30), db.ForeignKey('compound.ChemicalFormula'), primary_key = True, nullable = False)
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)
    KeywordHistory = db.Column(db.String(100))

    # Setup foreign key: Search.CompoundFormula references Compound.ChemicalFormula
    #                    Search.UserID references User.UserID
    searchhistory = db.relationship('Compound',lazy = True)
    searchhistory = db.relationship('RegisterUser',lazy = True)

    def __repr__(self):
        return f"SearchHistory('{self.CompoundFormula}','{self.UserID}','{self.KeywordHistory}')"

#----------------------------------Create table----------------------------------- 

#Create all empty tables:
db.create_all()