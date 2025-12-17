CREATE DATABASE universe;
\c universe
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(100) NOT NULL,
    age_in_millions_of_years INT,
    has_life BOOLEAN NOT NULL,
    distance_from_earth NUMERIC
);
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    age_in_millions_of_years INT,
    is_spherical BOOLEAN NOT NULL,
    distance_from_earth NUMERIC
);
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    has_life BOOLEAN NOT NULL,
    description TEXT,
    distance_from_star NUMERIC
);
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    is_spherical BOOLEAN NOT NULL,
    description TEXT,
    diameter_km INT
);
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    mass_kg NUMERIC NOT NULL,
    is_potentially_hazardous BOOLEAN NOT NULL,
    diameter_km INT
);
-- Insert data into galaxy table (6 rows)
INSERT INTO galaxy (name, type, age_in_millions_of_years, has_life, distance_from_earth) VALUES
('Milky Way', 'Spiral', 13600, true, 0),
('Andromeda', 'Spiral', 10000, false, 2537000),
('Triangulum', 'Spiral', 13000, false, 3000000),
('Whirlpool', 'Spiral', 11000, false, 23000000),
('Sombrero', 'Spiral', 13250, false, 29350000),
('Centaurus A', 'Elliptical', 13270, false, 13700000);
-- Insert data into star table (6 rows)
INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical, distance_from_earth) VALUES
('Sun', 1, 4600, true, 0.000016),
('Proxima Centauri', 1, 4850, true, 4.24),
('Sirius', 1, 242, true, 8.6),
('Betelgeuse', 1, 8500, true, 642.5),
('Vega', 1, 455, true, 25.04),
('Rigel', 1, 8000, true, 860);
-- Insert data into planet table (12 rows)
INSERT INTO planet (name, star_id, has_life, description, distance_from_star) VALUES
('Mercury', 1, false, 'Smallest planet in solar system', 57.9),
('Venus', 1, false, 'Hottest planet with thick atmosphere', 108.2),
('Earth', 1, true, 'Our home planet with abundant water', 149.6),
('Mars', 1, false, 'Red planet with potential for past life', 227.9),
('Jupiter', 1, false, 'Largest gas giant with Great Red Spot', 778.5),
('Saturn', 1, false, 'Gas giant famous for its rings', 1432),
('Uranus', 1, false, 'Ice giant tilted on its side', 2867),
('Neptune', 1, false, 'Furthest ice giant with strong winds', 4515),
('Proxima b', 2, false, 'Exoplanet in habitable zone', 0.05),
('Proxima c', 2, false, 'Super-Earth candidate', 1.5),
('Sirius b companion', 3, false, 'Hypothetical planet', 20),
('Betelgeuse I', 4, false, 'Theoretical hot Jupiter', 5);
-- Insert data into moon table (20 rows)
INSERT INTO moon (name, planet_id, is_spherical, description, diameter_km) VALUES
('Moon', 3, true, 'Earths only natural satellite', 3474),
('Phobos', 4, false, 'Larger moon of Mars', 22),
('Deimos', 4, false, 'Smaller moon of Mars', 12),
('Io', 5, true, 'Most volcanically active body', 3643),
('Europa', 5, true, 'Ice-covered moon with subsurface ocean', 3121),
('Ganymede', 5, true, 'Largest moon in solar system', 5268),
('Callisto', 5, true, 'Heavily cratered moon', 4820),
('Titan', 6, true, 'Largest moon of Saturn with atmosphere', 5149),
('Enceladus', 6, true, 'Ice moon with water geysers', 504),
('Mimas', 6, true, 'Death Star lookalike moon', 396),
('Rhea', 6, true, 'Second largest moon of Saturn', 1527),
('Iapetus', 6, true, 'Two-toned moon', 1469),
('Dione', 6, true, 'Icy moon with wispy terrain', 1123),
('Tethys', 6, true, 'Moon with large crater', 1062),
('Miranda', 7, true, 'Moon with extreme surface features', 471),
('Ariel', 7, true, 'Brightest moon of Uranus', 1157),
('Umbriel', 7, true, 'Dark moon of Uranus', 1169),
('Titania', 7, true, 'Largest moon of Uranus', 1577),
('Oberon', 7, true, 'Outermost major moon of Uranus', 1522),
('Triton', 8, true, 'Largest moon of Neptune in retrograde orbit', 2706);
-- Insert data into asteroid table (4 rows)
INSERT INTO asteroid (name, star_id, mass_kg, is_potentially_hazardous, diameter_km) VALUES
('Ceres', 1, 939300000000000000000, false, 939),
('Vesta', 1, 259000000000000000000, false, 525),
('Pallas', 1, 211000000000000000000, false, 512),
('Hygiea', 1, 87000000000000000000, false, 434);
