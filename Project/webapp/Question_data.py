from webapp import db

# --------------------------------------------------- PraticeQuestion Table ----------------------------------------------------------------
# PracticeQuestion():
# Pre-condition: None
# Post-condition: return the table about the question information
class PracticeQuestion(db.Model):
    __tablename__ = "practicequestion"

    # Construct attributes and primary keys of the entity
    # Primary key: questionID
    QuestionID = db.Column(db.Integer, primary_key = True, nullable = False)
    Content = db.Column(db.String(500), nullable = False)
    Solution = db.Column(db.String(3), nullable = False)
    Explanation = db.Column(db.String(500), nullable = False)

    def __repr__(self):
        return f"PracticeQuestion('{self.QuestionID}', '{self.Content}', '{self.Solution}', '{self.Explanation}')"

# --------------------------------------------------- Choice Table ----------------------------------------------------------------
# Choice():
# Pre-condition: Table "PracticeQuestion" must exist
# Post-condition: construct the table about multiple choices question
class Choice(db.Model):
    __tablename__ = "choice"

    # Construct attributes, primary key and foreign key for the weak entity "Choice"
    # Primary key: ChoiceID
    # Foreign key:
    # Choices.QuestionID references PracticeQuestion.QuestionID
    QuestionID = db.Column(db.Integer, db.ForeignKey('practicequestion.QuestionID'), primary_key=True, nullable=False)
    ChoiceID = db.Column(db.String(3), primary_key = True, nullable = False)
    Content = db.Column(db.String(500), nullable = False)

    # Enable to interact with the data from PracticeQuestion
    choices = db.relationship('PracticeQuestion', lazy=True)
    def __repr__(self):
        return f"Choice('{self.QuestionID}', '{self.ChoiceID}', '{self.Content}')"

# --------------------------------------------------- Learn Table ----------------------------------------------------------------
# Learn():
# Pre-condition: Table "User" and "PracticeQuestion" must exist
# Post-condition: construct the relationships between "User" and "PracticeQuestion"
class Learn(db.Model):
    __tablename__ = "learn"
    # Construct the foreign keys of "Learn"
    # Foreign keys:
    # Learn.ID references User.ID
    # Learn.QuestionID references PracticeQuestion.QuestionID

    UserID = db.Column(db.Integer, db.ForeignKey('registeruser.id'), primary_key = True, nullable = False)
    QuestionID = db.Column(db.Integer, db.ForeignKey('practicequestion.QuestionID'), primary_key = True, nullable = False)

    # Enable to interact with the data from User and PracticeQuestion
    learn = db.relationship('RegisterUser', lazy = True)
    learn = db.relationship('PracticeQuestion', lazy = True)

    def __repr__(self):
        return f"Learn('{self.UserID}', '{self.QuestionID}')"

#Create all empty tables:
db.create_all()