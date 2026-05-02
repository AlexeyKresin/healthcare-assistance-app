from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/search")
def search():
    return render_template("search.html")

@app.route("/results")
def results():
    return render_template("results.html")

@app.route("/program/<int:id>")
def program_details(id):
    return render_template("program_details.html", program_id=id)

@app.route("/programs")
def programs():
    return render_template("programs.html")

@app.route("/add-user")
def add_user():
    return render_template("add_user.html")

@app.route("/add-application")
def add_application():
    return render_template("add_application.html")

@app.route("/reports")
def reports():
    return render_template("reports.html")

@app.route("/about")
def about():
    return render_template("about.html")

if __name__ == "__main__":
    app.run(debug=True)