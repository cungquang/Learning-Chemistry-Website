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

from flask import render_template, url_for, flash, redirect, request, jsonify
from flask_login import login_user, current_user, logout_user
from flask import render_template, url_for, flash, redirect, abort
from flask_login import login_user, current_user, logout_user, login_required
from datetime import datetime
from webapp.forms import CommentForm, SignupForm, SigninForm, ReplyForm
from webapp.datas import RegisterUser, Post, Discuss, ReplyComment
from webapp.search_data import Compound, Produces, Search, SearchHistory
from webapp.Question_data import PracticeQuestion, Choice, Learn
from webapp import app, db, bcrypt
import json



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
@login_required
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

	return render_template('new_post.html', title='Create', postform=postform, legend='New Post')

#Route for each post (to show)
@app.route("/forum/<int:postid>")
def single_post(postid):
	
	#get the post match id:
	topic = Post.query.get_or_404(postid)
	reply = ReplyComment.query.filter(ReplyComment.PostID==postid)
	return render_template("single_post.html", title=topic.PostTitle, topic=topic, Reply=reply)


#Route for update_post
@app.route("/forum/<int:postid>/updatepost",methods=['GET', 'POST'])
@login_required
def update_post(postid):

	#get the post match the id:
	topic = Post.query.get_or_404(postid)

	#check if this is the creator of the post:
	if topic.registeruser != current_user:
		#response the forbidden route
		abort(403)					#if not abort the access
	
	#if the method is posting information - POST:
	updatetopic = CommentForm() 

	#If user input is valid for updating, then add to the post
	if updatetopic.validate_on_submit():
		topic.PostTitle = updatetopic.postTitle.data
		topic.PostContent = updatetopic.postContent.data
		
		#update the content and title to the current topic:
		db.session.commit()	
		flash(f'Update the post on {datetime.utcnow()}','success')
		return redirect(url_for('single_post',postid=topic.PostID))

	#If the method is gettnig information - GET:
	elif request.method == 'GET':
		#Set the default of the post as the current content and title:
		updatetopic.postTitle.data = topic.PostTitle
		updatetopic.postContent.data = topic.PostContent
	return render_template('new_post.html', title='Edit', postform=updatetopic, legend='Edit Post')

#Route for delete_post
@app.route("/forum/<int:postid>/delete",methods=['POST'])
@login_required
def delete_post(postid):
	#get the post match the id:
	topic = Post.query.get_or_404(postid)

	#check if this is the creator of the post:
	if topic.registeruser != current_user:
		#response the forbidden route
		abort(403)
	db.session.delete(topic)
	db.session.commit()
	flash(f'Successfully delete the post','success')
	return redirect(url_for('forum'))



#New reply to the post:
@app.route("/forum/<int:postid>/reply", methods=['GET','POST'])
@login_required
def new_reply(postid):
	#Get data from Comment form
	replyform = ReplyForm()					
	
	#Validate the post content
	if replyform.validate_on_submit():	

		#add new post into database:
		reply = ReplyComment(PostID = postid, AuthorID=current_user.id, EditorName=current_user.FirstName, 
			Content=replyform.replyContent.data)
		db.session.add(reply)
		db.session.commit()
		flash(f'Reply on this post on {datetime.utcnow()}','success')
		return redirect(url_for('single_post',postid=postid))

	return render_template('new_reply.html', title='Reply', replyform=replyform, legend='New Reply')


#Route for update_post
@app.route("/forum/<int:postid>/<int:replyid>/update",methods=['GET', 'POST'])
@login_required
def update_reply(postid,replyid):

	#get the post match the id:
	reply = ReplyComment.query.filter_by(PostID=postid, CommentID=replyid).first()

	#check if this is the creator of the reply:
	if reply.registeruser != current_user:
		#response the forbidden route
		abort(403)					#if not abort the access
	
	#if the method is posting information - POST:
	updatereply = ReplyForm() 

	#If user input is valid for updating, then add to the post
	if updatereply.validate_on_submit():
		reply.Content = updatereply.replyContent.data
		
		#update the content and title to the current topic:
		db.session.commit()	
		flash(f'Update the reply on {datetime.utcnow()}','success')
		return redirect(url_for('single_post',postid=reply.PostID))

	#If the method is getting information - GET:
	elif request.method == 'GET':
		#Set the default of the post as the current content and title:
		updatereply.replyContent.data = reply.Content
	return render_template('new_reply.html', title='Edit', replyform=updatereply, legend='Edit Reply')


#Route for delete_reply
@app.route("/forum/<int:postid>/<int:replyid>/delete",methods=['POST'])
@login_required
def delete_reply(postid,replyid):
	#get the post match the id:
	reply = ReplyComment.query.filter_by(PostID=postid,CommentID=replyid).first()

	#check if this is the creator of the post:
	if reply.registeruser != current_user:
		#response the forbidden route
		abort(403)
	db.session.delete(reply)
	db.session.commit()
	flash(f'Successfully delete the post','success')
	return redirect(url_for('forum'))



# routes for John + Chris
#---------------------------------Search Route----------------------------------- 
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
    compound = Compound.query.filter(Compound.ChemicalFormula == searchbox).first()
    compound_headers = ["CompoundName","ChemicalFormula","AtomicNumber","State","MeltingPoint","BoilingPoint","Appearance","MolecularWeight"]
    compound_dict = {}
    index = 0
    compound_dict[index] = {compound_headers[index]: compound.CompoundName, compound_headers[index+1]: compound.ChemicalFormula, compound_headers[index+2]: compound.AtomicNumber, compound_headers[index+3]: compound.State, compound_headers[index+4]: compound.MeltingPoint, compound_headers[index+5]: compound.BoilingPoint, compound_headers[index+6]: compound.Appearance, compound_headers[index+7]: compound.MolecularWeight}
    keys_values = compound_dict.items()
    compound_json = {str(key): value for key, value in keys_values}
    replace_none(compound_json)
    return jsonify(compound_json)


@app.route("/livesearch",methods=["POST","GET"])
def livesearch():
    searchbox = request.form.get("text")
    print("Searchbox: " + searchbox)
    produce = Produces.query.filter((Produces.ReactantFormula == searchbox) | (Produces.ProductFormula == searchbox)).first()
    produce_headers = ["ReactantFormula", "ProductFormula", "ChemicalEquation"]
    produce_dict = {}
    index = 0
    produce_dict[index] = {produce_headers[index]: produce.ReactantFormula, produce_headers[index+1]: produce.ProductFormula, produce_headers[index+2]: produce.ChemicalEquation}
    keys_values = produce_dict.items()
    produce_json = {str(key): value for key, value in keys_values}
    replace_none(produce_json)
    return jsonify(produce_json)
