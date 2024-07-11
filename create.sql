CREATE TABLE movies (
    original_title text,
    movie_id numeric PRIMARY KEY,
    genres text,
    release_date date,
    vote_average numeric(2,0)
);


--box_office

CREATE TABLE box_office (
    movie_id numeric PRIMARY KEY,
    budget numeric,
    box_office numeric,
    outcome text,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

--actor_list table

CREATE TABLE actors_list (
    actor_name text,
    actor_id numeric PRIMARY KEY
);

--actor_map table

CREATE TABLE actors_map (
    movie_id numeric,
    actor_id numeric,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors_list(actor_id)
);

-- Production Companies Table
CREATE TABLE production_companies (
    production_name text,
    company_id numeric PRIMARY KEY
);

-- Production Map Table
CREATE TABLE production_map (
    movie_id numeric,
    company_id numeric,
    PRIMARY KEY (movie_id, company_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (company_id) REFERENCES production_companies(company_id)
);

-- Keywords Table
CREATE TABLE keywords (
    keyword_id numeric PRIMARY KEY,
    keywords text);
-- Keywords Map Table
CREATE TABLE keywords_map (
    movie_id numeric,
    keyword_id numeric,
    PRIMARY KEY (movie_id, keyword_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (keyword_id) REFERENCES keywords(keyword_id)


);