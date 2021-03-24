from flask import Flask, render_template, url_for
#from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

#app.config['SQLAlchemy_DATABASE_URI'] = 'sqlite:///forum.db'
#app.config['SQLAlchemy_TRACK_MODIFICATION'] = False
app.config['DEBUG'] = True
#app.config['SECRET_KEY'] = 'mysecret'

#db = SQLAlchemy(app)
#migrate = Migrate(app, db)

@app.route('/')	

#Home page
@app.route('/home')
def Home():
	return render_template('home.html')

#Search page
@app.route('/search')
def Search():
	return "<h1>Search.html</h1>"

#Forum page - my part
@app.route('/forum')
def Forum():
	return render_template('forum.html')

#Practice page
@app.route('/practice')
def Practice():
	return render_template('practice.html')

#Sign-in page
@app.route('/sign_In')
def Sign_In():
	return "<h1>Sign_In.html</h1>"



if __name__ == '__main__':
	app.run(debug=True)