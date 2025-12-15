
# 📚 Library Management System – Database Design

## 📌 Project Overview

This project involves the design and implementation of a **Library Management System database** based on a real-world library study. The system models how libraries manage books, physical copies, patrons, librarians, borrowing, reservations, acquisitions, and fines.

The project focuses on **database design**, including requirement analysis, conceptual modeling, ERD creation, and logical schema implementation using **MySQL**.

---

## 🎯 Project Objectives

* To analyze real library operations through a physical library visit
* To identify key entities, relationships, and constraints
* To design a **fully normalized (3NF)** database
* To create a clear **Entity Relationship Diagram (ERD)**
* To implement the database schema using SQL
* To ensure data integrity and scalability

---

## 🛠️ Technologies Used

* **MySQL**
* **MySQL Workbench**
* **SQL**
* **GitHub**
* **Notion** (for documentation)

---

## 📋 System Requirements

### Functional Requirements

The system supports:

* Managing books, authors, publishers, and categories
* Tracking physical book copies and their locations
* Registering patrons and librarians
* Borrowing and returning book copies
* Reserving books
* Recording book acquisitions from suppliers
* Tracking overdue fines

### Non-Functional Requirements

* Data consistency and integrity
* Scalability for future growth
* Ease of maintenance
* Secure handling of patron data

---

## 🧩 Entities in the System

* Book
* BookCopy
* Author
* Category
* Publisher
* Supplier
* Acquisition
* Patron
* Librarian
* Loan
* Reservation
* Fine

---

## 🔗 Key Relationships

* A **Book** can have multiple **Book Copies**
* A **Book** can have many **Authors** and **Categories**
* A **Patron** can make multiple **Reservations**
* A **Patron** can have multiple **Loans**
* A **Loan** is associated with one **Book Copy**
* A **Fine** is generated from an overdue **Loan**
* A **Librarian** processes many **Loans**
* A **Supplier** provides books through **Acquisitions**

---

## 🧠 Conceptual Model

The conceptual model represents the high-level view of the system, focusing on real-world objects and their interactions without technical details.
Reservations are made for **books**, loans are issued for **book copies**, and fines are derived from overdue loans.

---

## 🗺️ Entity Relationship Diagram (ERD)

The ERD illustrates:

* Entities and attributes
* Relationships and cardinality
* Normalized structure (up to Third Normal Form)

📌 *See ERD diagram in the repository.*

---

## 🗄️ Database Design

The database is normalized to **Third Normal Form (3NF)** to eliminate redundancy and ensure data integrity.

Key design decisions:

* Reservations are linked to **books**, not copies
* Fines are linked to **loans**, not directly to patrons
* Many-to-many relationships are resolved using junction tables

---

## 🚀 How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/Database_Group7_Library-Management-System.git
   ```
2. Open MySQL Workbench
3. Import the SQL scripts from the repository
4. Run the scripts to create the database and tables

---

## 📂 Repository Structure

```
📦 library-management-system
 ┣ 📜 README.md
 ┣ 📊 ERD/
 ┃ ┗ library_erd.png
 ┣ 📁 sql/
 ┃ ┗ schema.sql
 ┣ 📄 documentation/
 ┃ ┗ project_documentation.docx
```

---

## 👥 Group Members

* *Dinar Nato*
* *Jemimah Baraka*
* *Samuel Ngaru*
* *Brandon Mwalimu*
* *Daisy Jebet*
* *Ezra Njiraini*
* *Peace Kawa*
* *Oscar Mahugu*
* *Leisi Shapara*

---

## ✅ Conclusion

This project demonstrates proper database design practices by translating real-world library processes into a structured, normalized relational database. The system is scalable, maintainable, and accurately reflects library operations.

---

