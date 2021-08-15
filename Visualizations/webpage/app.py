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
from flask import Flask, render_template, request, session
import pickle
import os

app.secret_key = 'secretKey'


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
    

# selected_state = set()
@app.route("/ranges", methods = ['GET', 'POST'])

def ranges():
    # Get state from dropdown and append to selected_state to be used in /predict
    state = request.form.get('stateChoice')
    session['selectedState'] = state
    # selected_state.add(state)
    # Read in min and max value csv for ranges of each feature
    data = pd.read_csv("https://raw.githubusercontent.com/taytaka/Poverty_and_Minimum_Wage/main/Visualizations/webpage/static/min_max_values.csv", sep=",")
    # Narrow down df to selected state
    data = data.loc[data['state'] == state]
    # Gather min and max values for each feature
    crime_rate_min = round(data.loc[data['feature'] == 'crime_rate']['min'].item(), 2)
    crime_rate_max = round(data.loc[data['feature'] == 'crime_rate']['max'].item(), 2)
    unemployment_rate_min = round(data.loc[data['feature'] == 'unemployment_rate']['min'].item(), 2)
    unemployment_rate_max = round(data.loc[data['feature'] == 'unemployment_rate']['max'].item(), 2)
    divorce_rate_per_1000_people_min = round(data.loc[data['feature'] == 'divorce_rate_per_1000_people']['min'].item(), 2)
    divorce_rate_per_1000_people_max = round(data.loc[data['feature'] == 'divorce_rate_per_1000_people']['max'].item(), 2)
    homeownership_rate_min = round(data.loc[data['feature'] == 'homeownership_rate']['min'].item(), 2)
    homeownership_rate_max = round(data.loc[data['feature'] == 'homeownership_rate']['max'].item(), 2)
    minimum_wage_effective_min = round(data.loc[data['feature'] == 'minimum_wage_effective']['min'].item(), 2)
    minimum_wage_effective_max = round(data.loc[data['feature'] == 'minimum_wage_effective']['max'].item(), 2)
    CPI_Average_min = round(data.loc[data['feature'] == 'cpi_average']['min'].item(), 2)
    CPI_Average_max = round(data.loc[data['feature'] == 'cpi_average']['max'].item(), 2)
    inflation_rate_min = round(data.loc[data['feature'] == 'inflation_rate']['min'].item(), 2)
    inflation_rate_max = round(data.loc[data['feature'] == 'inflation_rate']['max'].item(), 2)
    avg_wage_index_min = round(data.loc[data['feature'] == 'avg_wage_index']['min'].item(), 2)
    avg_wage_index_max = round(data.loc[data['feature'] == 'avg_wage_index']['max'].item(), 2)
    education_per_capita_min = round(data.loc[data['feature'] == 'education_per_capita']['min'].item(), 2)
    education_per_capita_max = round(data.loc[data['feature'] == 'education_per_capita']['max'].item(), 2)
    welfare_per_capita_min = round(data.loc[data['feature'] == 'welfare_per_capita']['min'].item(), 2)
    welfare_per_capita_max = round(data.loc[data['feature'] == 'welfare_per_capita']['max'].item(), 2)

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

    
@app.route("/predict", methods = ['GET', 'POST'])

def predict():
    # Get ml feature values from form
    form_values = [x for x in request.form.values()]
    # Get state
    # state = selected_state.pop()
    state = session.get('selectedState', '')
    # aggregate features
    ml_features = [float(x) for x in form_values]
    # Retrieve/load model and predict
    file_path = f"/app/Visualizations/webpage/Best_Models/{state}.sav"
    # script_dir = os.path.dirname(__file__)
    # rel_path = f"{state}.sav"
    # rel_to_cwd_path = os.path.join(script_dir, rel_path)
    model = pickle.load(open(file_path, 'rb'))
    input_features = [np.array(ml_features)]
    prediction = model.predict(input_features)[0]
    # Get information regarding the model used
    model_info = pd.read_csv("https://raw.githubusercontent.com/taytaka/Poverty_and_Minimum_Wage/main/Machine_Learning/Model_summary.csv", sep=",")
    model_used = model_info.loc[model_info['State'] == state]
    model_type = model_used["Model"].item()
    model_score = round(model_used["R2 Score"].item(), 2)

    return render_template('forecast.html', prediction_text = f'The predicted poverty rate is {prediction} percent.',
                            selected_state = f'State Selected: {state}.',
                            model_type = f'Model Type: {model_type}.',
                            r2_value = f'Model R-Squared Score: {model_score}.')




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