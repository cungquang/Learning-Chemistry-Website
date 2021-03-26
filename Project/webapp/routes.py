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
*		- This file contain route for each tab on the webpage					*
*		- Each function represent a tab on the webpage, includes:				*
*			+ def home()														*
*			+ def forum()														*
*			+ def practice()													*
*																				*
*********************************************************************************
"""


from flask import render_template, url_for, flash, redirect
from datetime import datetime
from webapp.forms import CommentForm, SignupForm, SigninForm
from webapp.datas import Post
from webapp import app, db

#---------------------------------Home Route------------------------------------ 
@app.route('/')	
 
#Home page
@app.route('/home')
def home():
	return render_template('home.html', title="Home Page")

@app.route('/account', methods=['GET','POST'])	
def account():
	signup = SignupForm()
	signin = SigninForm()
	
	if signup.validate_on_submit():
		flash(f'Account create for {signup.firstName.data}!', 'success')
		return redirect(url_for('home'))

	if signin.validate_on_submit():
		flash(f'Welcome', 'success')
		return redirect(url_for('home'))

	return render_template('account.html', title="Account", signup=signup, signin=signin)


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
"""
@app.route("/forum/new", methods=['GET','POST'])
def new_post():
	#Get current time and date
	ctime = datetime.now().strftime("%d/%m/%y %H:%M:%S")
	current = "Post time: " + ctime 
	
	#Get userinformation from database

	#Get data from Comment form
	question = CommentForm()						#Collect user input for the post
	if question.validate_on_submit():				#Validate user input base the assigned condition
		post = Post(question.) 								#create post function
		db.session.add(post)						
		db.session.commit()
		flash(current, 'success')
		return redirect(url_for(forum))
	return render_template('new_post.html', title='Create', form = question)
"""