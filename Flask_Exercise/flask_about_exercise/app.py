from flask import Flask, render_template

app = Flask(__name__) 

@app.route("/")
def home():
    return render_template("index.html", title="My flask app")

@app.route("/about")
def about():
    hobbies = ["Reading", "Volleyball", "Gym", "Learning Python"]
    return render_template("about.html", hobbies=hobbies)

if __name__ == '__main__':
    app.run(debug=True)