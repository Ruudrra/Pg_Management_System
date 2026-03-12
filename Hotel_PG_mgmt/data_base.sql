-- Delete old database if exists
DROP DATABASE IF EXISTS umiyaji_pg;

-- Create database
CREATE DATABASE umiyaji_pg;
USE umiyaji_pg;


-- =========================
-- ADMIN TABLE (Login)
-- =========================

CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO admin(username,password) VALUES
('admin','admin123'),
('sahil','123');

INSERT INTO admin(username,password) VALUES
('Dhruv','123'),
('Rudra','456');


INSERT INTO admin(username,password) VALUES('hii','123');

-- =========================
-- ROOM TABLE
-- =========================

CREATE TABLE room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number INT NOT NULL,
    room_type VARCHAR(50),
    total_beds INT,
    occupied_beds INT DEFAULT 0,
    status VARCHAR(20)
);

INSERT INTO room(room_number,room_type,total_beds,occupied_beds,status) VALUES
(101,'Single',1,0,'Available'),
(102,'Double',2,1,'Available'),
(103,'Triple',3,3,'Full');


-- =========================
-- TENANT TABLE
-- =========================

CREATE TABLE tenant (
    tenant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    room_id INT,
    join_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

INSERT INTO tenant(name,phone,room_id,join_date,status) VALUES
('Rahul Sharma','9876543210',2,'2026-03-01','Active'),
('Amit Patel','9876541111',3,'2026-03-02','Active');


-- =========================
-- PAYMENT TABLE
-- =========================

CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    tenant_id INT,
    amount DOUBLE,
    month VARCHAR(20),
    status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (tenant_id) REFERENCES tenant(tenant_id)
);

INSERT INTO payment(tenant_id,amount,month,status,payment_date) VALUES
(1,5000,'March','Paid','2026-03-05'),
(2,5000,'March','Pending',NULL);


-- =========================
-- COMPLAINT TABLE
-- =========================

CREATE TABLE complaint (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    tenant_id INT,
    room_id INT,
    title VARCHAR(200),
    description TEXT,
    priority VARCHAR(20),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenant(tenant_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

INSERT INTO complaint(tenant_id,room_id,title,description,priority,status) VALUES
(1,2,'AC not working','AC not cooling properly','High','Pending');

select * from admin;