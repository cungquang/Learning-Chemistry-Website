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
*			+ def search()														*
*			+ def forum()														*
*			+ def practice()													*
*																				*
*********************************************************************************
"""


from flask import render_template, url_for, flash, redirect
from datetime import datetime
from webapp.forms import CommentPost
from webapp.datas import Post
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
