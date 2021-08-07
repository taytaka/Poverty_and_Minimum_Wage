# Import tools
from types import MethodDescriptorType
import datetime as dt
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, json, jsonify, render_template, request

# --- Set Up the Database
# Set up database engine to access postgres database file
engine = create_engine('postgresql://postgres:finalproject@database-1.czpjmlarn3xk.us-east-2.rds.amazonaws.com/finaldb')
# Create the auto_map base
Base = automap_base()
# Reflect the tables
Base.prepare(engine, reflect = True)
# Save references to each table
Features = Base.classes.economic_features_full
    ## do we want to reference each table (poverty_rate, unemployment_rate, crime_rate etc.)
    ## individually? or just reference the table as a whole

# -- Set up Flask 
# Create session link from Python to database 
session = Session(engine)

# Create Flask application instance
app = Flask(__name__)


# -- Create Flask routes
    # All of your routes should go after the app = Flask(__name__) line of code. 
    # Create 1 route to JSON Data, 1 route to js and 1 route for each HTML page
    # First define the starting point, use function @app.route('/') to define the root.
    # Next, define function after @app.route("/"). Whenever you make a route in Flask, you put the code you want in that specific route below @app.route(). Here's what it will look like:

# Create homepage route and set "homepage" to index.html
@app.route('/')
def homepage():
    return render_template('index.html')
    
# Create other routes
# When creating routes, we follow the naming convention /api/v1.0/ followed by the name of the route. This convention signifies that this is version 1 of our application. This line can be updated to support future versions of the app as well.
# Example: def welcome():
    # return
    # '''
    # Welcome to the Predicting Poverty Rate API!
    # Available Routes:
    # /api/v1.0/states
    # /api/v1.0/state
    # /api/v1.0/data
    # /api/v1.0/trends
    # ''')


# @app.route("/states")
# def states():
    # d = session.query(Features.state).all()
    # states = pd.DataFrame(d).iloc[:,0].value_counts().index.to_list()
    # return jsonify({"states": states})#df.state.value_counts().index.to_list()
# 
# @app.route("/state")
# def state():
    # st = request.args.get('state')
    # print("The state is: ", st)
    # d = session.query(Features.state).filter(Features.state == st).all()
    # return {"message": "success"}
# 
# @app.route("/data")
# def data():
    # d = session.query(Features.year, Features.state).all()
    # trans = {"year": [x[0] for x in d], "state": [x[1] for x in d]}
    # return jsonify(trans)
# 
# @app.route("/trends",methods=["GET", "POST"])
# def trends():
    # code goes here
    # return render_template("trends.html")
# 

if __name__ == '__main__':
    app.run()
    
# Run Flask app in command line
# Enter: flask run

