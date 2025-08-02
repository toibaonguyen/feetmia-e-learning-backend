


CREATE TABLE users_statuses (
    id varchar(36) PRIMARY KEY,
    code VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id varchar(36) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    avatar_url TEXT,
    status_id varchar(36) NOT NULL,
    FOREIGN KEY (status_id) REFERENCES users_statuses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE roles (
    id varchar(36) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE users_roles (
    user_id varchar(36) NOT NULL,
    role_id varchar(36) NOT NULL,
    PRIMARY KEY (user_id, role_id),
    assigned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE categories(
    id varchar(36) PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE skills(
    id varchar(36) PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE job_roles(
    id varchar(36) PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_statuses (
    id varchar(36) PRIMARY KEY,
    code VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses (
    id varchar(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    status_id varchar(36) NOT NULL,
    FOREIGN KEY (status_id) REFERENCES courses_statuses(id) ON DELETE CASCADE,
    short_description TEXT NOT NULL,
    description TEXT NOT NULL,
    thumbnail_url TEXT,
    base_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    current_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    base_currency varchar(3) NOT NULL,
    current_currency varchar(3) NOT NULL,
    instructor_id varchar(36) NOT NULL,
    language varchar(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_by varchar(36) REFERENCES users(id),
    FOREIGN KEY (instructor_id) REFERENCES users(id)
);

CREATE TABLE courses_requirements (
    id varchar(36) PRIMARY KEY,
    description TEXT NOT NULL,
    course_id varchar(36) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_target_audiences (
    id varchar(36) PRIMARY KEY,
    description TEXT NOT NULL,
    course_id varchar(36) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_learning_outcomes (
    id varchar(36) PRIMARY KEY,
    description TEXT NOT NULL,
    course_id varchar(36) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_modules (
    id varchar(36) PRIMARY KEY,
    title TEXT NOT NULL,
    sort_order INT NOT NULL,
    course_id varchar(36) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_lectures (
    id varchar(36) PRIMARY KEY,
    title TEXT NOT NULL,
    resource_url TEXT,
    content TEXT,
    duration_seconds INT NOT NULL,
    sort_order INT NOT NULL,
    module_id varchar(36) NOT NULL,
    FOREIGN KEY (module_id) REFERENCES courses_modules(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_categories (
    course_id varchar(36) NOT NULL,
    category_id varchar(36) NOT NULL,
    PRIMARY KEY (course_id, category_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_skills (
    course_id varchar(36) NOT NULL,
    skill_id varchar(36) NOT NULL,
    PRIMARY KEY (course_id, skill_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE courses_job_roles (
    course_id varchar(36) NOT NULL,
    job_role_id varchar(36) NOT NULL,
    PRIMARY KEY (course_id, job_role_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (job_role_id) REFERENCES job_roles(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by varchar(36) REFERENCES users(id),
    updated_by varchar(36) REFERENCES users(id)
);

CREATE TABLE owners_courses(
    owner_id varchar(36) NOT NULL,
    course_id varchar(36) NOT NULL,
    PRIMARY KEY (owner_id, course_id),
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses_ratings(
    user_id varchar(36) NOT NULL,
    course_id varchar(36) NOT NULL,
    PRIMARY KEY (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
