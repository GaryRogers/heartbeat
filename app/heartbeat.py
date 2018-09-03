import json
from flask import Flask
app = Flask('heartbeat')

@app.route("/")
def hello():
    return json.dumps('Hello workd')