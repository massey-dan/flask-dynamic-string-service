from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

dynamic_string = "The saved string is dynamic string"

@app.route('/')
def index():
    return render_template('index.html', dynamic_string=dynamic_string)

@app.route('/update', methods=['POST'])
def update_dynamic_string():
    global dynamic_string
    data = request.get_json()
    if not data or 'dynamic_string' not in data:
        return jsonify({'error': 'Missing dynamic_string'}), 400
    dynamic_string = data['dynamic_string']
    return jsonify({'dynamic_string': dynamic_string})