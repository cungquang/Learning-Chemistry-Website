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
from flask_login import login_user, current_user, logout_user
from datetime import datetime
from webapp.forms import CommentForm, SignupForm, SigninForm
from webapp.datas import RegisterUser, Post, Discuss, ReplyComment
from webapp import app, db, bcrypt



#---------------------------------Home Route----------------------------------	-- 
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
	question = Post.query.all()

	#Send to the webpage
	return render_template('forum.html', title='Forum', questions=question)

#New post option
@app.route("/forum/new_post", methods=['GET','POST'])
def new_post():
	#Get data from Comment form
	postform = CommentForm()					
	
	#Validate the post content
	if postform.validate_on_submit():	

		#add new post into database:
		post = Post(registeruser=current_user,PostTitle=postform.postTitle.data,PostContent=postform.postContent.data)	
		db.session.add(post)
		db.session.commit()
		flash(f'Create a new post on {datetime.utcnow()}')
		return redirect(url_for('forum'))

	return render_template('new_post.html', title='Create', postform=postform)

#Route for each post
@app.route("/post/<int:postid>")
def single_post(postid):
	
	#get all infor of the post match condition
	topic = Post.query.get_or_404(postid)
	return render_template("single_post.html", title=topic.PostTitle, topic=topic)