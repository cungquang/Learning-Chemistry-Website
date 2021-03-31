from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_login import UserMixin
from datetime import datetime
from flask import render_template, url_for, flash, redirect
from flask_login import login_user, current_user, logout_user
from datetime import datetime
from flask import jsonify
from flask import request
import json


#Decalre the variable app - main function
app = Flask(__name__)

#--------------------------Web Configuration-------------------------- 

#Configuration of the app:
app.config['SECRET_KEY'] ='f619d6b3556fc0401cf31f077be67042'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
#Create database 
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager =  LoginManager(app)

"""
Code for running with MySQL server
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:password@localhost/db_name'

"""



""" 
Optional Instruction:
    Overide table name - default name of the table is the class name
    + __tablename__ = "Discuss"         
    
    Other way to set multiple primary key:
    + __table_args__=(PrimaryKeyConstraint('PostID', 'UserID'),{})

Other operation with database:
    db.create_all()                             //create all the tables in database
    db.session.add(tuple)                       //add the new tuple to the database
    db.session.commit()                         //execute or actual add tuple from add() to database
    <tableName>.querry.all()                    //get all the querry from the <tablename> table
    <tableName>.querry.filter_by(cond).first()  //return the first tuple in the table match the condition
    <tableName>.querry.get(condition)           //return the tuple that match the condition
""" 


#-----------------------------RegisterUser Table----------------------------------- 

#load_user(user_id):
#Pre-cond:
#Post-cond:
@login_manager.user_loader
def load_user(user_id):
    return RegisterUser.query.get(int(user_id))

class RegisterUser(db.Model, UserMixin):
    __tablename__ = "registeruser"
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    FirstName = db.Column(db.String(50), nullable = False)
    LastName = db.Column(db.String(50), nullable = False)
    Email = db.Column(db.String(100), nullable = False)
    Password = db.Column(db.String(60), nullable = False)

    #Setup foreign key: Discuss.UserID reference to RegisterUser.UserID
    discuss = db.relationship('Discuss', backref='registeruser', lazy=True)
    Post = db.relationship('Post', backref='registeruser', lazy=True)

    def __repr__(self):
        return f"RegisterUser('{self.id}','{self.FirstName}','{self.LastName}','{self.Email}','{self.Password}')"



#--------------------------------Discuss Table------------------------------------- 
class Discuss(db.Model):
    __tablename__ = "discuss"   
    PostID = db.Column(db.Integer, db.ForeignKey('post.PostID'), primary_key = True, nullable = False)
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)
    
    CreatorName = db.Column(db.String(200), nullable = False)

    def __repr__(self):
        return f"Discuss('{self.PostID}','{self.UserID}','{self.CreatorName}')"



#----------------------------------Post Table-------------------------------------- 
class Post(db.Model):
    __tablename__ = "post"
    PostID = db.Column(db.Integer, primary_key = True, nullable = False)
    AuthorID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), nullable = False)
    
    PostTitle = db.Column(db.String(100), nullable = False)
    PostContent = db.Column(db.String(300))
    Datepost = db.Column(db.DateTime, nullable = False, default=datetime.utcnow)
    
    #Setup foreign key: Discuss.PosID reference to Post.PostID
    Discuss = db.relationship('Discuss', backref='post')
    Reply = db.relationship('ReplyComment', backref='post')

    def __repr__(self):
        return f"Post('{self.PostID}',{self.Author}','{self.PostTitle}','{self.PostContent}','{self.DatePost}')"



#-------------------------------ReplyComment table-------------------------------- 
class ReplyComment(db.Model):
    __tablename__ = "replycomment"
    CommentID = db.Column(db.Integer, primary_key = True, nullable = False)
    PostID = db.Column(db.Integer, db.ForeignKey('post.PostID'), primary_key = True, nullable = False)
    
    EditorName = db.Column(db.String(100), default = "Anonymous")
    Content = db.Column(db.String(500), nullable = False)
    CommentDate = db.Column(db.DateTime, nullable = False, default=datetime.utcnow)


    def __repr__(self):
        return f"ReplyComment('{self.CommentID}','{self.PostID}','{self.EditorName}','{self.Content}','{self.CommentDate}')"

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
    ReactionCondition = db.Column(db.String(100))
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
        return f"Search('{self.CompoundFormula}','{self.UserID}','{self.EditorName}','{self.Content}','{self.CommentDate}')"

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






#---------------------------------Home Route----------------------------------  -- 
@app.route('/') 
 
#Home page
@app.route('/home')
def home():
    return render_template('home.html', title="Home Page")

@app.route('/account', methods=['GET','POST'])  
def account():
    if current_user.is_authenticated:
        flash(f'Already login','success')
        return redirect(url_for('home'))
    signup = SignupForm()
    if signup.validate_on_submit():


        #hash the provide password - using object class bcrypt
        hash_password = bcrypt.generate_password_hash(signup.password.data).decode('utf-8')
        
        #use variable for temporary carry data
        new_user = RegisterUser(FirstName=signup.firstName.data, LastName=signup.lastName.data,
            Email=signup.email.data, Password=hash_password)
        
        #Add user's registration data into the database
        db.session.add(new_user)
        db.session.commit()
        flash(f'Account create for {signup.firstName.data}!', 'success')

        #Return user to the login
        return redirect(url_for('home'))

    signin = SigninForm()
    if signin.validate_on_submit():
        user = RegisterUser.query.filter_by(Email=signin.email.data).first()

        #success to login
        if user and bcrypt.check_password_hash(user.Password, signin.password.data):
            #log user in
            login_user(user, remember=signin.state.data)
            
            #return user to home page
            return redirect(url_for('home'))

        #fail to login
        else:
            flash(f'Login Unsuccessful. Please check username and password','danger')

    return render_template('account.html', title="Account", signup=signup, signin=signin)

#Logout route
@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('home'))


#-------------------------------Practice Route---------------------------------- 
#Practice page
@app.route('/practice')
def practice():
    return render_template('practice.html')


#---------------------------------Forum Route----------------------------------- 
#Forum page 
@app.route('/forum')
def forum():
    #Get all the post in the database
    #question = Post.querry.all()

    #Send to the webpage
    return render_template('forum.html', title='Forum') 

#--------------------------------Search Route------------------------------------
@app.route('/search')
def search():
    all_compounds = Compound.query.all()
    compound_headers = ["CompoundName","ChemicalFormula","AtomicNumber","State","MeltingPoint","BoilingPoint","Appearance","MolecularWeight"]
    compound_dict = {}
    for i, row in enumerate(all_compounds):
        index = 0
        compound_dict[i] = {compound_headers[index]: row.CompoundName, compound_headers[index+1]: row.ChemicalFormula, compound_headers[index+2]: row.AtomicNumber, compound_headers[index+3]: row.State, compound_headers[index+4]: row.MeltingPoint, compound_headers[index+5]: row.Appearance, compound_headers[index+6]: row.MolecularWeight}
    keys_values = compound_dict.items()
    compound_json = {str(key): value for key, value in keys_values}
    return render_template('search.html', title='Search', all_compounds = compound_json)

def replace_none(test_dict):
    # checking for dictionary and replacing if None
    if isinstance(test_dict, dict):
        for key in test_dict:
            if test_dict[key] is None:
                test_dict[key] = {}
            else:
                replace_none(test_dict[key])
    # checking for list, and testing for each value
    elif isinstance(test_dict, list):
        for val in test_dict:
            replace_none(val)


@app.route("/compoundinfo",methods=["POST","GET"])
def compoundinfo():
    searchbox = request.form.get("text")
    print(searchbox)
    compounds = Compound.query.all()
    compound = Compound()
    for row in compounds:
        if row.ChemicalFormula == searchbox:
            compound = row
    print(compound)
    compound_headers = ["CompoundName","ChemicalFormula","AtomicNumber","State","MeltingPoint","BoilingPoint","Appearance","MolecularWeight"]
    compound_dict = {}
    index = 0
    compound_dict[index] = {compound_headers[index]: compound.CompoundName, compound_headers[index+1]: compound.ChemicalFormula, compound_headers[index+2]: compound.AtomicNumber, compound_headers[index+3]: compound.State, compound_headers[index+4]: compound.MeltingPoint, compound_headers[index+5]: compound.Appearance, compound_headers[index+6]: compound.MolecularWeight}
    keys_values = compound_dict.items()
    compound_json = {str(key): value for key, value in keys_values}
    replace_none(compound_json)
    print(compound_json)
    return jsonify(compound_json)


@app.route("/livesearch",methods=["POST","GET"])
def livesearch():
    searchbox = request.form.get("text")
    produces = Produces.query.all()
    produce = Produces()
    for row in produces:
        if row.ReactantFormula == searchbox or row.ProductFormula == searchbox:
            produce = row
    produce_headers = ["ReactantFormula", "ProductFormula", "ChemicalEquation", "ReactionCondition"]
    produce_dict = {}
    index = 0
    produce_dict[index] = {produce_headers[index]: produce.ReactantFormula, produce_headers[index+1]: produce.ProductFormula, produce_headers[index+2]: produce.ChemicalEquation, produce_headers[index+3]: produce.ReactionCondition}
    keys_values = produce_dict.items()
    produce_json = {str(key): value for key, value in keys_values}
    replace_none(produce_json)
    return jsonify(produce_json)
    
if __name__ == '__main__':
    app.run(debug = True)


