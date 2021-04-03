"""
*********************************************************************************
*	Group of authors:															*
*		Chris Liu																*
*		Frank Dong																*
*		John Canh Nhat Minh														*
*		Hong Quang Cung															*
*		Xixuan																	*
*																				*
*********************************************************************************
*																				*
*	File Description:															*
*		- This file contain database management code							*
*		- Each class will control a table in database							*
*			+ class Post 														*
*																				*
*********************************************************************************
"""
from webapp import db, login_manager	
from flask_login import UserMixin
from datetime import datetime

""" 
Optional Instruction:
	Overide table name - default name of the table is the class name
	+ __tablename__ = "Discuss"			
	
	Other way to set multiple primary key:
	+ __table_args__=(PrimaryKeyConstraint('PostID', 'UserID'),{})

Other operation with database:
	db.create_all() 							//create all the tables in database
	db.session.add(tuple)						//add the new tuple to the database
	db.session.commit()							//execute or actual add tuple from add() to database
	<tableName>.querry.all()					//get all the querry from the <tablename> table
	<tableName>.querry.filter_by(cond).first()	//return the first tuple in the table match the condition
	<tableName>.querry.get(condition)			//return the tuple that match the condition
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
	__table_args__={'sqlite_autoincrement': True}
	id = db.Column(db.Integer, primary_key = True, nullable = False)
	FirstName = db.Column(db.String(50), nullable = False)
	LastName = db.Column(db.String(50), nullable = False)
	Email = db.Column(db.String(100), nullable = False)
	Password = db.Column(db.String(60), nullable = False)

	#Setup foreign key: Discuss.UserID reference to RegisterUser.UserID
	discuss = db.relationship('Discuss', backref='registeruser', lazy=True)
	post = db.relationship('Post', backref='registeruser', lazy=True)
	reply = db.relationship('ReplyComment', cascade="all,delete", backref='registeruser', lazy=True)

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
	__table_args__={'sqlite_autoincrement': True}
	PostID = db.Column(db.Integer, primary_key = True, nullable = False)
	AuthorID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), nullable = False)
	
	PostTitle = db.Column(db.String(100), nullable = False)
	PostContent = db.Column(db.String(300))
	DatePost = db.Column(db.DateTime, nullable = False, default=datetime.utcnow)
	
	#Setup foreign key: Discuss.PosID reference to Post.PostID
	Discuss = db.relationship('Discuss', backref='post')
	Reply = db.relationship('ReplyComment',cascade="all,delete", backref='post', lazy=True)

	def __repr__(self):
		return f"Post('{self.PostID}',{self.AuthorID}','{self.PostTitle}','{self.PostContent}','{self.DatePost}')"


#-------------------------------ReplyComment table-------------------------------- 
class ReplyComment(db.Model):
	__tablename__ = "replycomment"
	__table_args__={'sqlite_autoincrement': True}
	CommentID = db.Column(db.Integer, primary_key = True, nullable = False)
	PostID = db.Column(db.Integer, db.ForeignKey('post.PostID'), nullable = False)
	AuthorID = db.Column(db.Integer,db.ForeignKey('registeruser.id'), nullable=False)
	

	EditorName = db.Column(db.String(100), default = "Anonymous")
	Content = db.Column(db.String(300), nullable = False)
	CommentDate = db.Column(db.DateTime, nullable = False, default=datetime.utcnow)

	def __repr__(self):
		return f"ReplyComment('{self.CommentID}','{self.PostID}','{self.AuthorID}','{self.EditorName}','{self.Content}','{self.CommentDate}')"


#----------------------------------Create table----------------------------------- 

#Create all empty tables:
db.create_all()
