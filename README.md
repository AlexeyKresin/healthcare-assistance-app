# Healthcare Assistance Program Finder


# Public GitHub Link:

https://github.com/AlexeyKresin/healthcare-assistance-app

## Live Demo
https://web-production-01043.up.railway.app

---

## Project Overview

This project is a web-based database application that helps users find and apply for healthcare-related financial assistance programs.

The system allows users to:
- Search for available programs
- View program and provider information
- Register as applicants
- Submit applications
- View reports generated from database queries

This project demonstrates the practical implementation of a database-driven web application using Flask and MySQL.

---

## Technologies Used

- **Backend:** Python (Flask)
- **Database:** MySQL (Railway)
- **Frontend:** HTML, CSS
- **Deployment:** Railway
- **Version Control:** Git & GitHub

---

## ⚙️ Features

### Search Programs
- Filter programs by benefit type and eligibility
- Dynamic SQL queries with filtering

### View Programs
- Displays programs and their associated organizations
- Uses SQL JOIN operations

### Add User
- Insert new applicants into the database

### Add Application
- Submit applications for programs
- Automatically assigns status = "Pending"

### Reports
- Programs grouped by provider
- Applications grouped by user
- Uses GROUP BY and JOIN queries

---

## Database Design

The system uses a relational database with the following main tables:

- **ApplicantUser**
- **Program**
- **Organization**
- **Application**

Relationships:
- A Program belongs to an Organization
- A User can submit multiple Applications
- An Application links a User and a Program

---

## How to Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/healthcare-assistance-app.git
   cd healthcare-assistance-app