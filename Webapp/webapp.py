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
*		- This file is the core engine of the entire webpage					*
*		- Each function represent a tab on the webpage, includes:				*
*			+ def home()														*
*			+ def search()														*
*			+ def forum()														*
*			+ def practice()													*
*		- Supplemen functions will not includes in this file 					*
*		- Command to execute the file:											*
*			- Linux terminal:													*
*				export FLASK_APP=webapp.py										*
*				flask run 														*
*			- Window command line:												*
*				set FLASK_APP=webapp.py											*
*				flask run 														*				
*																				*
*********************************************************************************
"""

#----------------------------Library-------------------------------- 

from flask import Flask, render_template, url_for
from webform import CommentPost
from datetime import date
#from flask_sqlalchemy import SQLAlchemy

#Decalre the variable app - main function
app = Flask(__name__)

#Set Secret key for protectioN
app.config['SECRET_KEY'] ='f619d6b3556fc0401cf31f077be67042'


#------------------------Database management------------------------- 
#app.config['SQLAlchemy_DATABASE_URI'] = 'sqlite:///forum.db'
#app.config['SQLAlchemy_TRACK_MODIFICATION'] = False
app.config['DEBUG'] = True


#db = SQLAlchemy(app)
#migrate = Migrate(app, db)




#---------------------------Web management----------------------------

@app.route('/')	


#Home page
@app.route('/home')
def home():
	return render_template('home.html')		


#Forum page 
@app.route('/forum',methods=['GET','POST'])
def forum():

	comment = CommentPost()					#Collect user input for the post
	#if CommentPost.validate_on_submit()			#Validate user input base the assigned condition

	#send the contain the template 
	return render_template('forum.html', title='Forum', form=comment)	


#Practice page
@app.route('/practice')
def practice():
	return render_template('practice.html')



#Run the 
if __name__ == '__main__':
	app.run(debug=True)