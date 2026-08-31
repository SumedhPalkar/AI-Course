from flask import Flask

app = Flask(__name__)

@app.route("/calc/<int:a>/<int:b>")
def calculator(a, b):
    return f"Addintion of {a} & {b} is {a+b}"



if __name__ == '__main__':  
    app.run(debug=True)   