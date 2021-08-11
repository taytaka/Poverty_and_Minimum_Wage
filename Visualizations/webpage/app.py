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

# Create session link
session = Session(engine)
#features_table = session.query(Features.poverty_rate).all()

# Create Flask application
app = Flask(__name__)

### Create routes
@app.route("/")
def index():
    return render_template("index1.html")

@app.route("/trends")
def trends():
    return render_template("trends.html")

@app.route("/forecast")
def forecast():
    return render_template("forecast.html")

# # working with just one saved model
# @app.route("/predict", methods = ['GET', 'POST'])
# def predict():

#     model = pickle.load(open("../../../Machine_Learning/Saved_DTR_Models/EntireRegressor.sav", 'rb'))
#     ml_features = [int(x) for x in request.form.values()]
#     input_features = [np.array(ml_features)]
#     prediction = model.predict(input_features)

#     return render_template('forecast.html', prediction_text = f'The predicted poverty rate is {prediction}')

# to be used for individual models
@app.route("/predict", methods = ['GET', 'POST'])
def predict():
    form_values = [x for x in request.form.values()]
    state = form_values.pop(0)
    ml_features = [int(x) for x in form_values]
    file_path = f"../../../Machine_Learning/Best_Models/{state}.sav"
    model = pickle.load(open(file_path, 'rb'))
    input_features = [np.array(ml_features)]
    prediction = model.predict(input_features)

    return render_template('forecast.html', prediction_text = f'The predicted poverty rate is {prediction}')

@app.route("/tables")
def tables():
    return render_template("tables.html")

@app.route("/analysis")
def analysis():
    return render_template("analysis.html")

@app.route("/about")
def about():
    return render_template("about.html")


if __name__ == '__main__':
    app.run()