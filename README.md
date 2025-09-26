# 📚 School CRUD API

A simple **CRUD (Create, Read, Update, Delete)** application for managing Students, Courses, and Enrollments.  
Built with **Node.js (Express)**, **Sequelize ORM**, and **MySQL**.  

This project implements both:

- **Question 1** → Database schema in `schema.sql`  
- **Question 2** → CRUD API using Node.js + Sequelize connected to the same schema  

---

## 🚀 Features

- Relational database schema (Students, Courses, Enrollments) with proper constraints.  
- REST API for:  
  - Students (`/students`)  
  - Courses (`/courses`)  
  - Enrollments (`/enrollments`)  
- Many-to-Many relationship between Students and Courses through Enrollments.  
- Sequelize ORM for database interaction.  
- Organized folder structure (models, routes, controllers, config).  
- Ready for expansion with middleware (auth, error handling, etc).  

---
---

## 🗄️ Database Schema

The schema is defined in [`schema.sql`](./schema.sql).  

### Entities:

- **Students**
  - `id`, `first_name`, `last_name`, `email`, `phone_number`, `date_of_birth`
- **Courses**
  - `id`, `code`, `course_name`, `start_date`, `end_date`, `description`, `credits`
- **Enrollments** (junction table for many-to-many)
  - `id`, `student_id`, `course_id`, `enrollment_date`, `final_grade`

### Constraints:

- `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` used where applicable.  
- Cascade on update/delete for relationships.  

---

### Tech Stack
- Node.js (Express.js)
- Sequelize ORM
- MySQL 8
- pnpm (dependency manager)
- dotenv (environment variables)

## ⚙️ Setup & Installation

### 1️⃣ Clone the repository

```sh
git clone https://github.com/your-username/school-crud-api.git
cd school-crud-api


### Install dependencies

pnpm install
```
3️⃣ Configure environment variables

Create a .env file in the project root:

DB_USERNAME=root
DB_PASSWORD=yourpassword
DB_DATABASE=school_db
DB_HOST=127.0.0.1
DB_DIALECT=mysql
PORT=3000

4️⃣ Set up the database

Run the schema file inside MySQL:

SOURCE D:/school-crud-api/schema.sql;


Or let Sequelize sync the models automatically (in development).

5️⃣ Run the server
pnpm run dev   # with nodemon (auto-reload)
pnpm run start # normal run

🔗 API Endpoints
Students

GET /students → List all students

GET /students/:id → Get a student by ID

POST /students → Create a new student

PUT /students/:id → Update a student

DELETE /students/:id → Delete a student

Courses

GET /courses → List all courses

GET /courses/:id → Get a course by ID

POST /courses → Create a new course

PUT /courses/:id → Update a course

DELETE /courses/:id → Delete a course

Enrollments

GET /enrollments → List all enrollments

POST /enrollments → Enroll a student in a course

DELETE /enrollments/:id → Remove an enrollment

🧪 Example: Create a Student
POST /students
Content-Type: application/json

{
  "first_name": "Test",
  "last_name": "User",
  "email": "test.user@example.com",
  "phone_number": "+254700123456",
  "date_of_birth": "2000-10-15"
}


Response:

{
  "id": 11,
  "first_name": "Test",
  "last_name": "User",
  "email": "test.user@example.com",
  "phone_number": "+254700123456",
  "date_of_birth": "2000-10-15",
  "created_at": "2025-09-24T10:15:00.000Z",
  "updated_at": "2025-09-24T10:15:00.000Z"
}


📌 Deliverables for Assignment

✅ schema.sql → Database schema with seeds (Question 1)

✅ GitHub repo with CRUD app source code (Question 2)

✅ README.md with setup & API docs