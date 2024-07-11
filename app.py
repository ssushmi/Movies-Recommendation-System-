from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host='localhost', 
        database='project', 
        user='postgres', 
        password='sushmi'
    )
    return conn

@app.route('/', methods=['GET', 'POST'])
def index():
    db_conn = get_db_connection()
    cursor = db_conn.cursor()
    movies = []
    #cursor.execute("SELECT DISTINCT genres FROM movies ORDER BY genres")
    cursor.execute("SELECT DISTINCT unnest(string_to_array(genres, ', ')) AS genre FROM movies")
    genres = cursor.fetchall()
    if request.method == 'POST':
        selected_genre = request.form['genre']
        latest = 'latest' in request.form
        high_rating = 'high_rating' in request.form
        movies_query = """
        SELECT original_title, movie_id, genres, release_date, vote_average
        FROM movies
        WHERE genres LIKE %s
        """
        query_params = ['%' + selected_genre + '%']

        if latest:
            movies_query += " AND release_date >= current_date - interval '1 year' "
        if high_rating:
            movies_query += " AND vote_average > 8 "

        cursor.execute(movies_query, query_params)
        movies = cursor.fetchall()
    db_conn.close()
    return render_template('index.html', genres=genres, movies=movies)

if __name__ == '__main__':
    app.run(debug=True)
