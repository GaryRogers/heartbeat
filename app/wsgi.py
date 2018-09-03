import json
from flask import Flask
from flask import request
app = Flask('heartbeat')

@app.route('/')
def hello():
    return json.dumps('Hello world')

@app.route('/heartbeats', methods=['POST'])
def heartbeat_create(heartbeat):
    return json.dumps('Not implemented')


@app.route('/heartbeats/<id>', methods=['GET', 'PUT', 'DELETE'])
def heartbeat_get(id):
    if request.method == 'PUT':
        return json.dumps('Not implemented')
    elif request.method == 'DELETE':
        return json.dumps('Not implemented')
    elif request.method == 'GET':
        return json.dumps('Not implemented')
    else:
        return '{ "code": "500", "message": "Undefined Server Error" }'


@app.route("/heartbeats/<id>/checkin", methods=['PUT'])
def heartbeat_checkin(id):
    if request.method == 'PUT':
        return json.dumps('Not implemented')
    else:
        return '{ "code": "500", "message": "Undefined Server Error" }'