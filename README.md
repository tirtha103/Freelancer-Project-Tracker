# Freelancer Project Tracker – Task 1: Database Setup & Schema Design

## 📌 Objective  
Design a real-world database for freelancers to manage their clients, projects, tasks, and payments efficiently.

## 🛠️ Tools Used
- PostgreSQL
- SQL
- ER Diagram (via dbdiagram.io)
- VS Code

## 📊 Tables & Relationships

### Tables Created:
1. **clients** – Stores client contact information  
2. **projects** – Tracks projects assigned by clients  
3. **tasks** – Breaks down each project into smaller to-do items  
4. **payments** – Records payments received from clients

### Entity Relationship
- One client ➝ many projects  
- One project ➝ many tasks  
- One project ➝ many payments  

📎 See `er_diagram.png` for the full visual.

---

## 💾 How to Run

1. Open PostgreSQL terminal:

```bash
psql -U postgres