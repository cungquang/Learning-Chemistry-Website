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
from wtforms import StringField, SubmitField, PasswordField, TextAreaField
from wtforms.validators import DataRequired, Length, Email, EqualTo



#-------------------------------Sign_up Form--------------------------------- 
#SignUp():
# this function inherit from FlaskForm
# Pre-condition: none
# Post-condition: return SignIn form which contain user registration information
class SignupForm(FlaskForm):

	#variable contains the first name
	firstName = StringField('First Name', validators=[DataRequired(), 
		Length(min=1, max=100)])
	
	#variable contains the last name
	lastName = StringField('Last Name',validators=[DataRequired(), 
		Length(min=1, max=100)])

	#variable contains the an email
	email = StringField('Email Address', validators=[DataRequired(), Email()])

	#variable contain the password
	password = PasswordField('Password', validators=[DataRequired()])

	#variable confirm the password
	confirmation = PasswordField('Confirm Password',validators=[DataRequired(), EqualTo('password')])

	#variable to submit the post
	signup = SubmitField('Sign Up')



#-------------------------------Sign_in Form--------------------------------- 
#SignIn():
# this function inherit from FlaskForm
# Pre-condition: none
# Post-condition: return SignIn form which contain user registration information
class SigninForm(FlaskForm):

	#variable contains the an email
	email = StringField('Email Address', validators=[DataRequired(), Email()])

	#variable contain the password
	password = PasswordField('Password', validators=[DataRequired()])

	#variable to submit the post
	signin = SubmitField('Sign In')



#-------------------------------CommentPost Form--------------------------------- 
#CommentPost():
# this function inherit from FlaskForm
# Pre-condition: none
# Post-condition: return the form which contain the post information
class CommentForm(FlaskForm):

	#variable contains the title of the post
	postTitle = StringField('Post Title', validators=[DataRequired(), 
		Length(min=1, max=100)])
	
	#variable contains the content of tohe post
	postContent = TextAreaField('Post Content',validators=[DataRequired(), 
		Length(min=1, max=500)])
	
	#variable to submit the post
	post = SubmitField('Post')

