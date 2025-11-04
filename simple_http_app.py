from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, this is a containerized HTTP application!"

@app.route('/greet/<name>')
def greet(name):
    return f"Hello, {name}! Welcome to the containerized app."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
