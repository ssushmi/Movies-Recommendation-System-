COPY actors_list FROM '/actors_list.csv' DELIMITER ',' CSV HEADER;

COPY action_map FROM '/path/to/actors_map.csv' DELIMITER ',' CSV HEADER;

COPY movies FROM '/path/to/maintable2.csv' DELIMITER ',' CSV HEADER;

COPY production_companies FROM '/path/to/production_companies.csv' DELIMITER ',' CSV HEADER;

COPY production_map FROM '/path/to/production_map.csv' DELIMITER ',' CSV HEADER;

COPY keywords FROM '/path/to/keyztable.csv' DELIMITER ',' CSV HEADER;

COPY keywords_map FROM '/path/to/keyzbridge2.csv' DELIMITER ',' CSV HEADER;

COPY box_office FROM '/path/to/box_office.csv' DELIMITER ',' CSV HEADER;

-- Inserting Data Into Actors_list table
INSERT INTO actors_list (actor_id, actor_name)
SELECT actor_id, actor_name FROM actors_list_temp;

-- Inserting Data Into Actors_map table

INSERT INTO action_map (movie_id, action_id)
SELECT movie_id, action_id FROM action_map_temp;

--Inserting Data Into movies table

INSERT INTO movies (original_title, movie_id, genres, release_date, vote_average)
SELECT  original_title,movie_id, genres, release_date, vote_average FROM movies_temp;

--Inserting Data Into production_companies table

INSERT INTO production_companies ( production_name, company_id)
SELECT production_name, company_id  FROM production_companies_temp;

--Inserting Data Into production_map table

INSERT INTO production_map (movie_id, company_id)
SELECT movie_id, company_id FROM production_map_temp;


--Inserting Data Into keywords table

INSERT INTO keywords (keyword_id, keywords)
SELECT keyword_id, keywords FROM keywords_temp;

--Inserting Data Into keywords_map table

INSERT INTO keywords_map (movie_id, keyword_id)
SELECT movie_id, keyword_id FROM keywords_map_temp;

--Inserting Data Into box_office table

INSERT INTO box_office (movie_id, budget, box_office, outcome)
SELECT movie_id, budget, box_office, outcome FROM box_office_temp;



