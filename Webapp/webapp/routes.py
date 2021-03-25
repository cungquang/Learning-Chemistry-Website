
from flask import render_template, url_for, flash, redirect
from webapp.forms import CommentPost
from webapp.datas import Discuss, Post, ReplyComment
from webapp import app

#---------------------------------Home Route------------------------------------ 
@app.route('/')	
 
#Home page
@app.route('/home')
def home():
	return render_template('home.html'	)		



#---------------------------------Forum Route----------------------------------- 
#Forum page 
@app.route('/forum',methods=['GET','POST'])
def forum():
	current = "Post time: " + datetime.now().strftime("%d/%m/%y %H:%M:%S")
	comment = CommentPost()					#Collect user input for the post
	if comment.validate_on_submit():			#Validate user input base the assigned condition
		flash(current, 'success')
	#send the contain the template 
	return render_template('forum.html', title='Forum', form=comment)	


#-------------------------------Practice Route---------------------------------- 
#Practice page
@app.route('/practice')
def practice():
	return render_template('practice.html')
