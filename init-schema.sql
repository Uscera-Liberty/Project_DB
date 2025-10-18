CREATE DATABASE u68824;

\connect u68824;

-- Таблица пользователей
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    login VARCHAR(255),
    hashed_password VARCHAR(255)
);

-- Таблица языков программирования
CREATE TABLE programming_languages (
    id SERIAL PRIMARY KEY,
    guid VARCHAR(255)
);

-- Таблица заявок (applications)
CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    bio TEXT NOT NULL,
    agreement BOOLEAN NOT NULL,
    user_id INT REFERENCES users(user_id) ON DELETE SET NULL
);

-- Таблица связки заявок и языков программирования
CREATE TABLE application_languages (
    application_id INT NOT NULL REFERENCES applications(id) ON DELETE CASCADE,
    language_id INT NOT NULL REFERENCES programming_languages(id) ON DELETE CASCADE,
    PRIMARY KEY (application_id, language_id)
);
