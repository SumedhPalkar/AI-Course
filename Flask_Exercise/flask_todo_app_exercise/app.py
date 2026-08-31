from flask import Flask, render_template, url_for, request, redirect

app = Flask(__name__)

tasks = []

# Route to View Tasks
@app.route('/')
def index():
    remaining_tasks = 0

    for task in tasks:
        if not task["completed"]:
            remaining_tasks += 1

    return render_template(
        'todo.html',
        tasks=tasks,
        remaining_tasks=remaining_tasks
    )
    

# Route to Add a Task
@app.route('/add', methods=['GET', 'POST'])
def add_task():
    new_task = request.form.get('task').strip()
    if new_task:
        tasks.append({"text": new_task, "completed": False})
    return redirect(url_for('index'))

# Route to Delete a Task
@app.route('/delete/<int:task_id>')
def delete_task(task_id):
    if 0 <= task_id < len(tasks):
        tasks.pop(task_id)
    return redirect(url_for('index'))

# Route to mark a task complete
@app.route("/toggle/<int:task_id>")
def toggle_task(task_id):
    if 0 <= task_id < len(tasks):
        tasks[task_id]["completed"] = not tasks[task_id]["completed"]

    return redirect(url_for("index"))

if __name__ == '__main__':     
    app.run(debug=True) 