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
*			+ class 
*																				*
*********************************************************************************
"""

from webapp import db


#--------------------------------Discuss Table------------------------------------- 
class Discuss(db.model)


#----------------------------------Post Table-------------------------------------- 
class Post(db.model):
	id = db.Column(db.Integer, primary_key = True, nullable = False)
	author = db.Column(db.String(20), unique = True, nullable = False)
	postTitle = db.Column(db.String(100), nullable = False)
	postContent = db.Column(db.String(300))
	datepost = db.Column(db.Datetime, nullable = False, default=datetime.utcnow)

	def __repr__(self):
		return "Post('{self.id}',{self.author}','{self.postTitle}','{self.postContent}','{self.datepost}')"


#-------------------------------ReplyComment table-------------------------------- 
class ReplyComment(db.model)