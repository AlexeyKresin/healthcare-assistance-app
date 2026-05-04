-- USE ak26db;

-- =====================================================
-- Table: Organization
-- Stores organizations that offer healthcare assistance programs
-- =====================================================
CREATE TABLE Organization (
    organization_id INT AUTO_INCREMENT PRIMARY KEY,
    organization_name VARCHAR(100) NOT NULL UNIQUE,
    org_type VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    website VARCHAR(150)
);

-- =====================================================
-- Table: Program
-- Stores healthcare assistance programs offered by organizations
-- Relationship: One Organization offers many Programs
-- =====================================================
CREATE TABLE Program (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    organization_id INT NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    description TEXT,
    eligibility_criteria TEXT,
    benefit_type VARCHAR(50) NOT NULL,
    application_deadline DATE,
    
    CONSTRAINT fk_program_organization
        FOREIGN KEY (organization_id)
        REFERENCES Organization(organization_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =====================================================
-- Table: ApplicantUser
-- Stores people who search and apply for programs
-- =====================================================
CREATE TABLE ApplicantUser (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- =====================================================
-- Table: Application
-- Stores user applications submitted to programs
-- Relationship: One ApplicantUser submits many Applications
-- Relationship: One Program receives many Applications
-- =====================================================
CREATE TABLE Application (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    program_id INT NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    notes TEXT,
    
    UNIQUE (user_id, program_id),

    CONSTRAINT fk_application_user
        FOREIGN KEY (user_id)
        REFERENCES ApplicantUser(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        
    CONSTRAINT fk_application_program
        FOREIGN KEY (program_id)
        REFERENCES Program(program_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);