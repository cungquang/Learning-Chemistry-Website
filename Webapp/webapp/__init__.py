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

from flask import flask
from flask_sqlalchemy import SQLAlchemy

#Decalre the variable app - main function
app = Flask(__name__)

#--------------------------Web Configuration-------------------------- 

#Configuration of the app:
app.config['SECRET_KEY'] ='f619d6b3556fc0401cf31f077be67042'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'

#Create database 
db = SQLAlchemy(app)

from webapp import routes