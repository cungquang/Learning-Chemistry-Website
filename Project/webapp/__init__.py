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
*		- This file turn the folder webapp into a module						*
*		- The file has instance of Flask, database and configuration			*
*			+ app - falsk instance												*
*			+ db - database														*
*			+ app.config:														*
*				- SECRET_KEY													*
*				- SQLALCHEMY_DATABASE_URI 										*
*																				*
*********************************************************************************
"""

from flask import Flask
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