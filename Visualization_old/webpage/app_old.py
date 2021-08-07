# Import tools
import datetime as dt
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify
from flask import Flask, render_template, request
from flask import Flask, current_app
#from flask_sqlalchemy import SQLAlchemy

#Set up the Database
engine = create_engine('postgresql://postgres:finalproject@database-1.czpjmlarn3xk.us-east-2.rds.amazonaws.com/finaldb')

Base = automap_base()
# Reflect the tables
Base.prepare(engine, reflect = True)

# Save references to each table
Features = Base.classes.economic_features_full
# Do we want to reference each table individually or just the economic_features_full?

#Crime = Base.classes.crime_rate
#session = Session(engine)
#crime_table= session.query(Crime.state).all()
#print(crime_table)

# Create a session link
session = Session(engine)

# Create Flask application
app = Flask(__name__)

# Create 1 route for js.app and 1 route for each html
@app.route("/")
def homepage():
    return render_template("index.html")

@app.route("/data")
def index():
   d = session.query(Features.year, Features.state).all()


# if request.method == 'GET':
#     trendResults = db.session.query(finaldb).filter(finaldb.<table?>)
#     for result in trendResults:
#         print(result.<column?>)

if __name__ == '__main__':
    app.run()