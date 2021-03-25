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
*		- This file contains form that will be used on html file				*
*		- Each function manages a form:											*
*			+ CommentPost()														*
*																				*
*********************************************************************************
"""

from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired, Length


#-------------------------------CommentPost Form--------------------------------- 
#CommentPost():
# this function inherit from FlaskForm
# Pre-condition: none
# Post-condition: dispa
class CommentPost(FlaskForm):

	#variable contains the title of the post
	postTitle = StringField('postTitle', validators=[DataRequired(), 
		Length(min=1, max=100)])
	
	#variable contains the content of the post
	postContent = StringField('postContent',validators=[DataRequired(), 
		Length(min=1, max=500)])
	
	#variable to submit the post
	post = SubmitField('post')