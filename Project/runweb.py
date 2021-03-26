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
*				python3 runweb.py 												*
*				python runweb.py 												*
*			- Window command line:												*
*				python3 runweb.py 												*
8				python3 runweb.py 												*
*																				*																				*
*********************************************************************************
"""

from webapp import app

#--------------------------Debug Management---------------------------
#Run the 
if __name__ == '__main__':
	app.run(debug = True)