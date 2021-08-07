# Import tools
import datetime as dt
from types import MethodDescriptorType
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, json, jsonify
from flask import Flask, render_template, request


#Set up database engine to access postgres database file
engine = create_engine('postgresql://postgres:finalproject@database-1.czpjmlarn3xk.us-east-2.rds.amazonaws.com/finaldb')
# Create the auto_map base
Base = automap_base()
# Reflect the tables
Base.prepare(engine, reflect = True)

# Save references to each table
Features = Base.classes.economic_features_full
## do we want to reference each table (poverty_rate, unemployment_rate, crime_rate etc.)
## individually? or just reference the table as a whole


# Create session link
session = Session(engine)
#features_table = session.query(Features.poverty_rate).all()


# Create Flask application
app = Flask(__name__)


### Create 1 route to JSON Data and 1 route to js for each page

@app.route("/")
def index():
    return render_template("index1.html")

@app.route("/trends")
def trends():
    return render_template("trends.html")

@app.route("/forecast")
def forecast():
    return render_template("forecast.html")

@app.route("/tables")
def tables():
    return render_template("tables.html")

@app.route("/maps")
def maps():
    return render_template("maps.html")

@app.route("/about")
def about():
    return render_template("about.html")

#app.route("")


if __name__ == '__main__':
    app.run()