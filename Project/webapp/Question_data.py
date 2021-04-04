from webapp import db

# --------------------------------------------------- PraticeQuestion Table ----------------------------------------------------------------

class PracticeQuestion(db.Model):
    __tablename__ = "practicequestion"
    QuestionID = db.Column(db.Integer, primary_key = True, nullable = False)
    Content = db.Column(db.String(500), nullable = False)
    Solution = db.Column(db.String(500), nullable = False)

    def __repr__(self):
        return f"PracticeQuestion('{self.QuestionID}', '{self.Content}', '{self.Solution}')"

# --------------------------------------------------- Choice Table ----------------------------------------------------------------
class Choice(db.Model):
    __tablename__ = "choice"
    QuestionID = db.Column(db.Integer, db.ForeignKey('practicequestion.QuestionID'), primary_key=True, nullable=False)
    ChoiceID = db.Column(db.String(3), primary_key = True, nullable = False)
    Content = db.Column(db.String(500), nullable = False)
    Explaination = db.Column(db.String(500))

    choices = db.relationship('PracticeQuestion', lazy=True)

    def __repr__(self):
        return f"Choices('{self.QuestionID}', '{self.ChoiceID}', '{self.Content}', '{self.Explaination}')"

# --------------------------------------------------- Learn Table ----------------------------------------------------------------
class Learn(db.Model):
    __tablename__ = "learn"
    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)
    QuestionID = db.Column(db.Integer, db.ForeignKey('practicequestion.QuestionID'), primary_key = True, nullable = False)

    learn = db.relationship('RegisterUser', lazy = True)
    learn = db.relationship('PracticeQuestion', lazy = True)

    def __repr__(self):
        return f"Learn('{self.UserID}', '{self.QuestionID}')"


#Create all empty tables:
db.create_all()