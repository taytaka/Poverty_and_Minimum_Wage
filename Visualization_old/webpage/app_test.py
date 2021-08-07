from flask import Flask

# Create a Flask app
app = Flask(__name__)

# Create root route (this is the starting point or welcome route)
# Create a function after route
# forward slash inside of the app.route? This denotes that we want to put our data at the root of our routes. 
# Next, create a function called hello_world() (example function). Whenever you make a route in Flask, you put the code you want in that specific route below @app.route(). 
@app.route('/')
def hello_world():
    return 'Hello world'

# @app.route("/api/v1.0/precipitation")

# def precipitation():
    #    prev_year = dt.date(2017, 8, 23) - dt.timedelta(days=365)
#    return
# 
# 
# def precipitation():
    #    prev_year = dt.date(2017, 8, 23) - dt.timedelta(days=365)
#    precipitation = session.query(Measurement.date, Measurement.prcp).\
    #   filter(Measurement.date >= prev_year).all()
#    return