CREATE TABLE Users(
    Id SERIAL PRIMARY KEY,
    Username VARCHAR(40),
    Password VARCHAR(70),
    Role VARCHAR(30)
);