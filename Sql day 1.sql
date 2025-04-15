CREATE TABLE Users9 (
    UserID INT AUTO_INCREMENT PRIMARY KEY,           -- Unique identifier for each user
    Username VARCHAR(50) UNIQUE NOT NULL,            -- Username must be unique and cannot be NULL
    Email VARCHAR(100) UNIQUE NOT NULL,              -- Email must be unique and cannot be NULL
    PasswordHash VARCHAR(255) NOT NULL,              -- Stores the hashed password, cannot be NULL
    FirstName VARCHAR(50),                           -- Optional first name
    LastName VARCHAR(50),                            -- Optional last name
    DateOfBirth DATE,                                -- Optional date of birth
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,    -- Date the user was created, defaults to current time
    LastLogin DATETIME,                              -- Last login timestamp
    Status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Inactive',  -- Status of the account
    INDEX (Email)                                    -- Index on the Email column to speed up searches
);



