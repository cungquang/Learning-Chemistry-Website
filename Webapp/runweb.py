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
*		- This file is running the package webapp								*
*		- Command to execute the file:											*
*			- Linux terminal:													*
*				export FLASK_APP=runweb.py										*
*				flask run 														*
*			- Window command line:												*
*				set FLASK_APP=runweb.py											*
*				flask run 														*				
*																				*
*********************************************************************************
"""

from webapp import app

#--------------------------Debug Management---------------------------
#Run the 
if __name__ == '__main__':
	app.run(debug=True)