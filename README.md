# Electric_billing_system_using_springboot_jsp_postgresSql
# Electricity Billing System

A full-stack web application built with Spring Boot and JSP for managing electricity billing. The system supports two distinct user roles: **Admin** and **Customer**, each with their own set of functionalities and dedicated views.



---

## ✨ Features

* **Role-Based Security:** Secure authentication and authorization using Spring Security, differentiating between Admin and Customer roles.
* **Admin Dashboard:** A central hub for administrators to view key metrics and access management functions.
* **Customer Management:** Admins can create new customer accounts and view a list of all registered customers.
* **Bill Generation:** Admins can generate new electricity bills for any customer based on units consumed.
* **Customer Self-Service:**
    * Users can register for a new customer account.
    * Customers can log in to view their personal profile and billing history.
    * Customers can "pay" their outstanding bills.

---

## 🛠️ Technologies Used

* **Backend:**
    * Java 17
    * Spring Boot 3.1.5
    * Spring Security 6
    * Spring Data JPA (Hibernate)
    * Maven
* **Database:**
    * PostgreSQL
* **Frontend:**
    * JavaServer Pages (JSP) with JSTL
    * Bootstrap 5 for styling and layout
* **Server:**
    * Embedded Apache Tomcat

---

## 🚀 Setup and Installation

Follow these steps to get the project running on your local machine.

### 1. Prerequisites

Make sure you have the following software installed:
* **JDK 17** or later
* **Apache Maven**
* **PostgreSQL** database server

### 2. Clone the Repository

Clone the project to your local machine:
```bash
Database Configuration
You need to create a dedicated user and database in PostgreSQL.

a. Open your SQL client (like psql or pgAdmin).

b. Run the following commands to create a user named ebs_user and a database named ebs. Replace 'password' with your own secure password.

SQL

-- Create a new user for the application
CREATE USER ebs_user WITH PASSWORD 'password';

-- Create the new database and set the new user as the owner
CREATE DATABASE ebs OWNER ebs_user;
4. Application Configuration
a. Navigate to the application properties file at:
src/main/resources/application.properties

b. Update the database credentials to match the user you just created.

Properties

spring.datasource.url=jdbc:postgresql://localhost:5432/ebs
spring.datasource.username=ebs_user
spring.datasource.password=password  # <-- Change this to the password you created
▶️ How to Run
Build the Project:
Open a terminal in the project's root directory and run the following Maven command to build the project:

Bash

mvn clean install
Run the Application:
You can run the application in two ways:

Using Maven:

Bash

mvn spring-boot:run
From Your IDE:
Find the ElectricityBillingSystemApplication.java file and run it directly.

The application will start on the embedded Tomcat server, and you can access it at:
http://localhost:8080

👤 Default Users
The application will automatically create an Admin user the first time it starts up. You can use these credentials to log in and begin testing.

Username: admin

Password: admin123

You can create new customer accounts through the registration page.
