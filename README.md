# Driving License Application Tracking System (DLATS)

A web-based **Driving License Application Tracking System (DLATS)** designed to simplify the process of applying for, managing, and tracking driving license applications.

The system is being developed as part of the **Full Stack Development (FSD) Skill Development Program**. The project will initially focus on frontend/UI development and database design, followed by backend integration and complete full-stack implementation.

---

## 📌 Project Overview

The Driving License Application Tracking System aims to provide a centralized platform where users can submit driving license applications, upload required documents, track application progress, view driving test details, and access issued license information.

The system will also provide administrative functionality for managing applications, verifying documents, updating application statuses, and managing driving test and license information.

---

## 🎯 Objectives

- Provide a simple and user-friendly interface for driving license applications.
- Allow users to track their application status.
- Maintain applicant and application information in a structured database.
- Manage submitted documents and their verification status.
- Maintain driving test schedules and results.
- Store issued license details.
- Provide a scalable database structure for future backend integration.
- Reduce manual effort in managing driving license applications.

---

## ✨ Planned Features

### User Features

- User registration and login
- User profile management
- Apply for a driving license
- Select vehicle/license class
- Upload required documents
- View application details
- Track application status
- View driving test details
- View issued license information

### Admin Features

- Admin login
- View and manage applications
- Verify submitted documents
- Update application status
- Schedule and manage driving tests
- Record driving test results
- Approve or reject applications
- Manage issued license information

---

## 🏗️ System Modules

The project is divided into the following major modules:

1. **User Management**
2. **License Application Management**
3. **Document Management**
4. **Application Status Tracking**
5. **Driving Test Management**
6. **License Management**
7. **Vehicle Class Management**
8. **Admin Management**

---

## 🗄️ Database Design

The database is designed using a relational database model.

### Main Tables

| Table | Description |
|---|---|
| `USER` | Stores applicant information |
| `APPLICATION` | Stores driving license application details |
| `VEHICLE_CLASS` | Stores different vehicle/license classes |
| `DOCUMENT` | Stores submitted document information |
| `APPLICATION_STATUS` | Maintains application status history |
| `DRIVING_TEST` | Stores driving test schedules and results |
| `LICENSE` | Stores issued license information |

### Database Relationships

- One user can have multiple applications.
- One vehicle class can be associated with multiple applications.
- One application can have multiple documents.
- One application can have multiple status updates.
- One application can have multiple driving test records.
- One application can result in one issued license.

---

## 🖥️ Frontend

The frontend provides the user interface for interacting with the system.

### Current Technologies

- HTML5
- CSS3
- JavaScript

### Planned Interface

- Home Page
- Login/Register
- User Dashboard
- License Application Form
- Application Tracking
- Application Details
- Driving Test Details
- License Details
- Admin Dashboard

---

## 🔧 Technology Stack

### Current

- **Frontend:** HTML, CSS, JavaScript
- **Database:** MySQL
- **Version Control:** Git & GitHub

### Planned

- **Backend:** To be implemented
- **API:** To be implemented
- **Frontend-Backend Integration:** To be implemented

The technology stack may be updated as the project progresses.

---

## 📁 Project Structure

```text
DLATS/
│
├── frontend/
│   ├── index.html
│   ├── ...
│   └── css/
│
├── database/
│   ├── schema.sql
│   ├── sample_data.sql
│   └── ER-Diagram.png
│
├── README.md
└── .gitignore
