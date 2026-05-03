from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)


def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root123",
        database="ak26db"
    )


@app.route("/")
def home():
    return render_template("home.html")

@app.route("/search")
def search():
    return render_template("search.html")

@app.route("/results")
def results():
    benefit_type = request.args.get("type", "")
    eligibility = request.args.get("eligibility", "")

    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        SELECT 
            p.program_name,
            o.organization_name,
            p.benefit_type,
            p.eligibility_criteria,
            p.application_deadline
        FROM Program p
        JOIN Organization o ON p.organization_id = o.organization_id
        WHERE 1 = 1
    """

    params = []

    if benefit_type:
        query += " AND p.benefit_type = %s"
        params.append(benefit_type)

    if eligibility:
        query += " AND p.eligibility_criteria LIKE %s"
        params.append("%" + eligibility + "%")

    cursor.execute(query, params)
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("results.html", results=results)

@app.route("/program/<int:id>")
def program_details(id):
    return render_template("program_details.html", program_id=id)

@app.route("/programs")
def programs():
    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        SELECT p.program_name, o.organization_name
        FROM Program p
        JOIN Organization o ON p.organization_id = o.organization_id
    """

    cursor.execute(query)
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("programs.html", programs=results)


@app.route("/add-application", methods=["GET", "POST"])
def add_application():
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == "POST":
        user_id = request.form["user_id"]
        program_id = request.form["program_id"]
        date = request.form["date"]

        insert_query = """
            INSERT INTO Application (user_id, program_id, application_date)
            VALUES (%s, %s, %s)
        """

        cursor.execute(insert_query, (user_id, program_id, date))
        conn.commit()

        return render_template("add_application_confirmation.html")

    # GET → load dropdown data
    cursor.execute("SELECT user_id, first_name, last_name FROM ApplicantUser")
    users = cursor.fetchall()

    cursor.execute("SELECT program_id, program_name FROM Program")
    programs = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("add_application.html", users=users, programs=programs)

@app.route("/reports")
def reports():
    return render_template("reports.html")

@app.route("/about")
def about():
    return render_template("about.html")
      
    
@app.route("/add-user", methods=["GET", "POST"])
def add_user():
    if request.method == "POST":
        first_name = request.form["first_name"]
        last_name = request.form["last_name"]
        dob = request.form["dob"]
        email = request.form["email"]
        phone = request.form["phone"]
        city = request.form["city"]
        state = request.form["state"]

        conn = get_db_connection()
        cursor = conn.cursor()

        query = """
            INSERT INTO ApplicantUser
            (first_name, last_name, date_of_birth, email, phone, city, state)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """

        cursor.execute(query, (first_name, last_name, dob, email, phone, city, state))
        conn.commit()

        cursor.close()
        conn.close()

        return render_template("add_user_confirmation.html")

    return render_template("add_user.html")

if __name__ == "__main__":
    app.run(debug=True)