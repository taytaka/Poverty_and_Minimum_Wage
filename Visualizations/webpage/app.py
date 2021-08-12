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
import pickle


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
    

selected_state = []
@app.route("/predict", methods = ['GET', 'POST'])

def predict():
    form_values = [x for x in request.form.values()]
    state = selected_state.pop()
    ml_features = [int(x) for x in form_values]
    file_path = f"../../Machine_Learning/Best_Models/{state}.sav"
    model = pickle.load(open(file_path, 'rb'))
    input_features = [np.array(ml_features)]
    prediction = model.predict(input_features)

    return render_template('forecast.html', prediction_text = f'The predicted poverty rate is {prediction}')

@app.route("/ranges", methods = ['GET', 'POST'])

def ranges():
    state = request.form.get('stateChoice')
    selected_state.append(state)
    data = pd.read_csv("static/min_max_values.csv")
    data = data.loc[data['state'] == state]
    crime_rate_min = data.loc[data['feature'] == 'crime_rate']['min'].item()
    crime_rate_max = data.loc[data['feature'] == 'crime_rate']['max'].item()
    unemployment_rate_min = data.loc[data['feature'] == 'unemployment_rate']['min'].item()
    unemployment_rate_max = data.loc[data['feature'] == 'unemployment_rate']['max'].item()
    divorce_rate_per_1000_people_min = data.loc[data['feature'] == 'divorce_rate_per_1000_people']['min'].item()
    divorce_rate_per_1000_people_max = data.loc[data['feature'] == 'divorce_rate_per_1000_people']['max'].item()
    homeownership_rate_min = data.loc[data['feature'] == 'homeownership_rate']['min'].item()
    homeownership_rate_max = data.loc[data['feature'] == 'homeownership_rate']['max'].item()
    minimum_wage_effective_min = data.loc[data['feature'] == 'minimum_wage_effective']['min'].item()
    minimum_wage_effective_max = data.loc[data['feature'] == 'minimum_wage_effective']['max'].item()
    CPI_Average_min = data.loc[data['feature'] == 'cpi_average']['min'].item()
    CPI_Average_max = data.loc[data['feature'] == 'cpi_average']['max'].item()
    inflation_rate_min = data.loc[data['feature'] == 'inflation_rate']['min'].item()
    inflation_rate_max = data.loc[data['feature'] == 'inflation_rate']['max'].item()
    avg_wage_index_min = data.loc[data['feature'] == 'avg_wage_index']['min'].item()
    avg_wage_index_max = data.loc[data['feature'] == 'avg_wage_index']['max'].item()
    education_per_capita_min = data.loc[data['feature'] == 'education_per_capita']['min'].item()
    education_per_capita_max = data.loc[data['feature'] == 'education_per_capita']['max'].item()
    welfare_per_capita_min = data.loc[data['feature'] == 'welfare_per_capita']['min'].item()
    welfare_per_capita_max = data.loc[data['feature'] == 'welfare_per_capita']['max'].item()

    return render_template('forecast.html', crime_rate_min = crime_rate_min, crime_rate_max = crime_rate_max,
    unemployment_rate_min = unemployment_rate_min, unemployment_rate_max = unemployment_rate_max,
    divorce_rate_per_1000_people_min = divorce_rate_per_1000_people_min, divorce_rate_per_1000_people_max = divorce_rate_per_1000_people_max,
    homeownership_rate_min = homeownership_rate_min, homeownership_rate_max = homeownership_rate_max,
    minimum_wage_effective_min = minimum_wage_effective_min, minimum_wage_effective_max = minimum_wage_effective_max,
    CPI_Average_min = CPI_Average_min, CPI_Average_max = CPI_Average_max,
    inflation_rate_min = inflation_rate_min, inflation_rate_max = inflation_rate_max,
    avg_wage_index_min = avg_wage_index_min, avg_wage_index_max = avg_wage_index_max,
    education_per_capita_min = education_per_capita_min, education_per_capita_max = education_per_capita_max,
    welfare_per_capita_min = welfare_per_capita_min, welfare_per_capita_max = welfare_per_capita_max, range_text = f'Please enter values within the given ranges for the selected state: {state}.')


@app.route("/tables")
def tables():
    return render_template("tables.html")

@app.route("/maps")
def maps():
    return render_template("maps.html")

@app.route("/about")
def about():
    return render_template("about.html")


if __name__ == '__main__':
    app.run()