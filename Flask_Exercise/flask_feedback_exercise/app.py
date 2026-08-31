from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/feedback", methods=['GET', 'POST'])
def feedback():
    name = None
    comment = None

    if request.method == 'POST':
        name = request.form.get('username')
        comment = request.form.get("comment")
    return render_template('feedback.html', name=name, comment=comment)

if __name__ == '__main__':  
    app.run(debug=True)