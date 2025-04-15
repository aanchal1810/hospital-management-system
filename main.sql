-- Create Patient Table
CREATE TABLE IF NOT EXISTS patient (
    patient_id SERIAL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(30) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(60) NOT NULL,
    gender VARCHAR(20) NOT NULL
);
 
-- Create Doctor Table
CREATE TABLE IF NOT EXISTS doctor (
    doctor_id SERIAL PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL
);
 
-- Create Medical History Table
CREATE TABLE IF NOT EXISTS medical_history (
    history_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    date DATE NOT NULL,
    conditions VARCHAR(100),
    surgeries VARCHAR(100),
    medication VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
 
-- Create Appointment Table
CREATE TABLE IF NOT EXISTS appointment (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status VARCHAR(15) NOT NULL,
    concerns VARCHAR(100),
    symptoms VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
 
-- Create Diagnosis Table
CREATE TABLE IF NOT EXISTS diagnosis (
    diagnosis_id SERIAL PRIMARY KEY,
    appointment_id INTEGER NOT NULL,
    diagnosis TEXT NOT NULL,
    prescription TEXT NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);
 
-- Create Doctor Schedule Table
CREATE TABLE IF NOT EXISTS doctor_schedule (
    schedule_id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL,
    day VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    break_time TIME NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
 
 
 
INSERT INTO patient (email, password, name, address, gender)
VALUES
    ('devporiya101@gmai.com', 'pass123', 'Dev Poriya', 'Tambe nagar, gate 2, mulund west', 'Male'),
    ('aryanvora9999@gmail.com', 'pass456', 'Aryan Vora', 'Tambe nagar, gate 21, mulund west', 'Male'),
    ('lisa12@example.com', 'pass789', 'Lisa White', '789 Cooper St', 'Female'),
    ('jane.doe@example.com', 'pass101', 'Jane Doe', '123 Maple Ave', 'Female'),
    ('john.smith@example.com', 'pass112', 'John Smith', '456 Oak St', 'Male');
 
-- Insert data into Doctor Table
INSERT INTO doctor (email, password, name, gender)
VALUES
    ('dr.tia@gmail.com', 'marvel1', 'Dr. Tia', 'Female'),
    ('dr.aanchal@gmail.com', 'wanda1', 'Dr. Anahcal', 'Female'),
    ('dr.jones@example.com', 'jones123', 'Dr. Jones', 'Male'),
    ('dr.martin@example.com', 'martin456', 'Dr. Martin', 'Male'),
    ('dr.doe@example.com', 'doe789', 'Dr. Doe', 'Female');
 
-- Insert data into Medical History Table
INSERT INTO medical_history (patient_id, date, conditions, surgeries, medication)
VALUES
    (1, '2024-03-10', 'Diabetes', 'Appendectomy', 'Metformin'),
    (2, '2024-03-15', 'Hypertension', 'None', 'Amlodipine'),
    (3, '2024-03-20', 'Asthma', 'None', 'Albuterol'),
    (4, '2024-03-25', 'Migraine', 'None', 'Ibuprofen'),
    (5, '2024-03-30', 'Anxiety', 'None', 'Xanax');
 
-- Insert data into Appointment Table
INSERT INTO appointment (patient_id, doctor_id, date, start_time, end_time, status, concerns, symptoms)
VALUES
    (1, 1, '2024-04-10', '09:00', '09:30', 'Scheduled', 'Routine Checkup', 'Fatigue'),
    (2, 2, '2024-04-11', '10:00', '10:30', 'Completed', 'High BP', 'Headache'),
    (3, 3, '2024-04-12', '11:00', '11:30', 'Scheduled', 'Breathing problems', 'Shortness of breath'),
    (4, 4, '2024-04-13', '12:00', '12:30', 'Completed', 'Severe headache', 'Dizziness'),
    (5, 5, '2024-04-14', '13:00', '13:30', 'Scheduled', 'Anxiety concerns', 'Palpitations');
 
-- Insert data into Diagnosis Table
INSERT INTO diagnosis (appointment_id, diagnosis, prescription)
VALUES
    (1, 'Seasonal Allergy', 'Paracetamol'),
    (2, 'Stage 1 Hypertension', 'Low-salt diet, Amlodipine'),
    (3, 'Asthma exacerbation', 'Inhaler, Albuterol'),
    (4, 'Migraine', 'Ibuprofen'),
    (5, 'Generalized Anxiety Disorder', 'Xanax');
 
-- Insert data into Doctor Schedule Table
INSERT INTO doctor_schedule (doctor_id, day, start_time, end_time, break_time)
VALUES
    (1, 'Monday', '09:00', '13:00', '11:00'),
    (2, 'Tuesday', '10:00', '14:00', '12:00'),
    (3, 'Wednesday', '08:00', '12:00', '10:00'),
    (4, 'Thursday', '09:30', '13:30', '11:30'),
    (5, 'Friday', '14:00', '18:00', '16:00');
 
ALTER TABLE doctor
ADD COLUMN specialization VARCHAR(50);
UPDATE doctor SET specialization = 'General Physician' WHERE doctor_id = 1;
UPDATE doctor SET specialization = 'Cardiologist' WHERE doctor_id = 2;
UPDATE doctor SET specialization = 'Pulmonologist' WHERE doctor_id = 3;
UPDATE doctor SET specialization = 'Neurologist' WHERE doctor_id = 4;
UPDATE doctor SET specialization = 'Psychiatrist' WHERE doctor_id = 5;
 
