CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    level INT NOT NULL UNIQUE CHECK (level >= 0),
    user_view BOOLEAN NOT NULL DEFAULT FALSE,
    user_create BOOLEAN NOT NULL DEFAULT FALSE,
    user_edit BOOLEAN NOT NULL DEFAULT FALSE,
    user_delete BOOLEAN NOT NULL DEFAULT FALSE,
    customer_view BOOLEAN NOT NULL DEFAULT FALSE,
    customer_create BOOLEAN NOT NULL DEFAULT FALSE,
    customer_edit BOOLEAN NOT NULL DEFAULT FALSE,
    customer_delete BOOLEAN NOT NULL DEFAULT FALSE,
    task_view BOOLEAN NOT NULL DEFAULT FALSE,
    task_create BOOLEAN NOT NULL DEFAULT FALSE,
    task_edit BOOLEAN NOT NULL DEFAULT FALSE,
    task_delete BOOLEAN NOT NULL DEFAULT FALSE,
    comment_view BOOLEAN NOT NULL DEFAULT FALSE,
    comment_create BOOLEAN NOT NULL DEFAULT FALSE,
    comment_edit BOOLEAN NOT NULL DEFAULT FALSE,
    comment_delete BOOLEAN NOT NULL DEFAULT FALSE
);


INSERT INTO roles (name, level, user_view, user_create, user_edit, user_delete,
                   customer_view, customer_create, customer_edit, customer_delete,
                   task_view, task_create, task_edit, task_delete,
                   comment_view, comment_create, comment_edit, comment_delete)
VALUES
    ('Admin', 0, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE);
