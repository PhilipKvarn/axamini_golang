CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE RESTRICT,
    occupation VARCHAR(255)
);

INSERT INTO users (name, password, phone, email, role_id, occupation)
VALUES ('Philip', '123', '0707209941', 'philip@example.com', 1, 'Admin');
