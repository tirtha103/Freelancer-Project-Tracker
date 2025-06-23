-- freelance_schema.sql
-- SQL schema for Freelancer Project Tracker

/* -------- 1. Clients Table -------- */
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,           -- Unique ID for each client
    name TEXT NOT NULL,                     -- Client name
    email TEXT UNIQUE NOT NULL,             -- Contact email
    phone TEXT                              -- Optional phone number
);

/* -------- 2. Projects Table -------- */
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,          -- Unique ID for each project
    client_id INTEGER NOT NULL,             -- Foreign key to clients
    title TEXT NOT NULL,                    -- Name of the project
    description TEXT,                       -- Details about the project
    status TEXT DEFAULT 'ongoing',          -- 'ongoing', 'completed', etc.
    start_date DATE,                        -- When it started
    end_date DATE,                          -- When it ended
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
        ON DELETE CASCADE
);

/* -------- 3. Tasks Table -------- */
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,             -- Unique task ID
    project_id INTEGER NOT NULL,            -- Foreign key to projects
    task_name TEXT NOT NULL,                -- Task title
    is_completed BOOLEAN DEFAULT FALSE,     -- Task status
    deadline DATE,                          -- Optional deadline
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
        ON DELETE CASCADE
);

/* -------- 4. Payments Table -------- */
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,          -- Unique payment ID
    project_id INTEGER NOT NULL,            -- Which project it's for
    amount NUMERIC(10, 2) NOT NULL CHECK (amount > 0),  -- Payment amount
    payment_date DATE DEFAULT CURRENT_DATE, -- When it was made
    payment_method TEXT                     -- e.g., UPI, Bank, PayPal
    -- Optionally add status: paid, pending, etc.
);
